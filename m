Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71174A43B8
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:24:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262995.455522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUmx-0001cs-C0; Mon, 31 Jan 2022 11:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262995.455522; Mon, 31 Jan 2022 11:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUmx-0001ZH-60; Mon, 31 Jan 2022 11:24:03 +0000
Received: by outflank-mailman (input) for mailman id 262995;
 Mon, 31 Jan 2022 11:24:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEUmv-0000cr-B9
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:24:01 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48c0384a-8288-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 12:24:00 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VAw4wG020845;
 Mon, 31 Jan 2022 11:23:56 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dx9je94s5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:23:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4227.eurprd03.prod.outlook.com (2603:10a6:208:c6::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 11:23:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 11:23:48 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 48c0384a-8288-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y29nYq9rgQeOf2boX1duru5F8YJUeG87u3di1o9KA6Tfnpyh2SVr6YHuD6wldjVGrZrnWisF7F0q+c1NjRXn07T0+pPPsauEFfjSQkiRbv9fz/8ms67AYE+pLnmk3hOBbik5VRR7UJ1VwdIOIyKx9q4gf3WPZ7H0CMjgFwg9d1nwdBm5mXAf6lWTDPJV0IQnK9V9hKyL4/1ACIseG9CH1hV4NPXH+8bgnvomEHQyKE9xFg5Mr6D+jL8/8D1glTiEzUCbSDSh5P8fCgt5MYT7YkdTo09k9tviNEfLOcnKkxrTwl4AJezVb93D/KfD14mIdXBZ3cOn59b34oTt3aN62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tv1c6yndgsa27ER0Ugw6CDyTDFYDS3jGIwZvn8VYUIA=;
 b=XI2gcTUPCslU/FNoZGiLI9z9aITVPtSHqIORxoKDD8af7d9P/eidPdVXg8vzoeAvC4Kqx6vpL7YLQk1GB6G2gOqMeugyrn0gGMSvw4NDg8qUcUWuj7eBuhvsIKIKNQjPQW2ZqDOcmUKvvNukDuJRpxK9Q10YpnLVbvez44FLgac/v7gVZch7GnCLIKperabTfM9QfMZZ0nB7ECR07XA8J90QVXAqGxYmSEZ1KS53hIqy2bARLqAHI86KwpS97h/lGiJI+C03BPuKNyui69dMfzMwWONWoE/Dsysr5efTO3tJ5nCyBu3v8YMLYOl1aYKrl1dp6VBviROyNAMbvQ2M2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tv1c6yndgsa27ER0Ugw6CDyTDFYDS3jGIwZvn8VYUIA=;
 b=J1qWLGYyr6ewKNvwq0XpPD3dPEPO/yMnYQMgBezbNRkvN0SX7P1pj4LavvX/J6LNujaOEaII+N9cRSgWSydfMtlEFxUSgEVHbujRGybdyoUZIcjy2cw9cRfAE9G27q4Ey2NOfNKysNUehA5q8dqjuU1F1729DuLQSVb7pFdXiW7t9pA+86IyLSHfo7E+NUrO0vIzBcr2Uw5JVvAprwyua1d8KTXEbB5EbREP1reT2IxJYoqnJ3Lf/7wXTu2CU/uc31h9H0kQJo5oVYl9+YLY7L5jh+YNcMtlxxBFLQcJQRsUXRwLpFCPs9LaXQZCmiIC5fFsoSqzp1K3lXMh9I5DPw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewHyWAyD811HEGp8pIjUuVWNaxfndGAgB2tWgCAAA7+AIAACECAgAADxgA=
Date: Mon, 31 Jan 2022 11:23:48 +0000
Message-ID: <6d1772b1-25f1-0f63-8b8a-5dfaf94b2953@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
 <YffDmW4JGk+iDIVF@Air-de-Roger>
In-Reply-To: <YffDmW4JGk+iDIVF@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61f79a0c-5db5-4905-e505-08d9e4ac26fa
x-ms-traffictypediagnostic: AM0PR03MB4227:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4227BFEED9AD422AEB4EF050E7259@AM0PR03MB4227.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +EmH+cof4KuPN7x7KizXosYgPfJDbFgnG77pYKQflvAdGnd43Z98nnbxrrQprcKOSYVMzGmZ9g+ugSjEVHHJw1sxYmVmTymhl1hJ4s67ZZ3SznltKG5m5HgtqA/05S+I9aePLNGZGCao/Y4dj5GhFYe9kAEs8fsiMVvQXLj2GDJzN+DV7b4X3cHrN3jcDZslB8GywC3Kjbb4Z8HDjckOKBSXrIXp9OxC5rv2F9j3QI9M7cQSd3dvXda7yjHpm1EobRhx9/I1wqqtPBTZ4UwIc4AuwLf9Jp7ScQoGFSDPozCXypZyKq/x0T9Jaz9vuGeYjR4KaNcfemfXAEy2x055D7djByO18FeZ5vFEbWEl10ACU9QkEXM3YBbfrHLZUZM2PJZ5P+hkRg4vbcEGXkISx4TnMDrJr76gJaAtYQYsju5h58oNw8ZcLmdVwdRJEVlNv6InJpjcuz4TyIsA9Zl2RsWs58KNqyjf1HRLZgzu6oVG5YCx6EZ0taqHp8uXi2+aDlpFVTvuhLcDEubAN348dAWxEzvWkXN1JhCHMHN4LMfqKkasnKz/p6Ze+lavzhdcYFsjnhzmXo6hsGaroafhod90j0hf49SgwkbxLV2uZnaBobdCZIujJhPIpU+OIE4FRNXp54ny3mgKj2zmdXUYXKf88NXxz6cJAcrtfIZluJugDiRGQt5u53VaFJBS9mmhIZGzZanPpEv7VPLNp2qjD8JyZfyOweeWPABbnc5L59xBlQeBHgJMIe1/ywGk0Fi7
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(76116006)(2616005)(64756008)(4326008)(66556008)(31696002)(66946007)(66476007)(66446008)(38100700002)(8676002)(86362001)(6486002)(8936002)(71200400001)(31686004)(2906002)(36756003)(186003)(26005)(6506007)(6512007)(38070700005)(107886003)(508600001)(53546011)(122000001)(5660300002)(54906003)(6916009)(316002)(83380400001)(7416002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UVNDRTRXNVN1aWd0SnVmKzZIZXFzcnJyUjlLVksyR01RUFJFS0ZwV1lBb2tn?=
 =?utf-8?B?YjZNR2k1V1VRMkYzekZVUGhzS2FZVGg2MllyRkpwcUFNUFUrR01IaURkTHBu?=
 =?utf-8?B?ZVZHdkRuR0krQngvKzBKRnp1TGRBOGx1UnJ2Z0UrMUZUeWM1SXhJTTF1RFV6?=
 =?utf-8?B?aU1BWStrbldtSmYvT0NjcDhLa1RoeWR5RjBwZmxDK1lpaW9hK1ZrWjhyS2Jx?=
 =?utf-8?B?RW1KZWI4Z1cwWmt6ZmJBZlA5cFdlN2grTTRlR3Y3TExUdXlscnFpV2ZiL3dk?=
 =?utf-8?B?aDBzU2cySFhaWnVUZHhKSytCbGxQdzJNKzJZK2RIMXoxWDhreFN1bWhjcHdo?=
 =?utf-8?B?M2NtTDlvbEpHelFJU1p5N3BwZkRMQVpYYk5PRk43UGlkK3JnTnUrWmdkdU8v?=
 =?utf-8?B?SUhmRXI0SHJBRlEwU1pWMk53NmoyOWRDQ2pSZ3RzUklnSnlQQkJVRVArekpK?=
 =?utf-8?B?YUkrc3A5ejJ3YndKbDZkeE9JUWVCdGZIbjZmeXZmSEE4cjFSdm1qajBaSHdG?=
 =?utf-8?B?NERBRWhrbjIzMVZKVVFnaC9LMnlKV1lUbDZkMnZDaHQ2aWFZTy8rUEZWZ3pl?=
 =?utf-8?B?VXdMZ2tZZEdDWTdNS0VLWlhKeEZRUDdmL3piU1RYLzJuODJHdWFWdFhXQVc4?=
 =?utf-8?B?em9tbTNPU3NxNmQyU2RZVDQvQ2pCeitJdHQxcWh4azViY2YvYlcxMFdXN2or?=
 =?utf-8?B?ZEtQbVoxbXdHUThtT0lTbFBBdElyY3dxZmFIWWdvOHNLRldJVHRRaXdpaGtW?=
 =?utf-8?B?bGdXWlo1TmhIQUY1L3ZtT3JzcnFmSjlTZDhyNU9FaDdtZmk4K1ZiRzVKTHJs?=
 =?utf-8?B?WnVadVQ2SlJVYlc5MmNoY2YvNjd3THR4YndsSHk2SGw0ODVpS1VlVk9ncXA3?=
 =?utf-8?B?UGxtanlKMzZOT2pLaS9EY1dITGF4a0crYXhqZWFTd1BLOUJtVDl1UThlSno3?=
 =?utf-8?B?eW01SHBETUErTVVyQmNSRkkvRWk5OWY3MXhtRXovWHQ4T2N0R1JMU2NIeXJG?=
 =?utf-8?B?Q2VZc0xYTCt5ZW90OWNRQzJvODdJbGFoekRXT2VzaEhKaDFLTjhRS24ybzhv?=
 =?utf-8?B?S0ZJS0U5RHJQS25sS0dZbDZzNkhxNWQ5Rk9xMG5RZlBKc0JacHo0Y01FRzN0?=
 =?utf-8?B?bi8rVzV2WEZwV0xCNFFFU0JlRTAwVXU2WTFzcnM3TlBUa25tYlcxZVAraWsx?=
 =?utf-8?B?aTlheUZEbXVQcjdQU0V6WkRCdEszOXZZZFBVZU52WmhkL2N6Y25CUmZCZTRk?=
 =?utf-8?B?di93dDVxTUZwYUtla3Q4a1VLYlIvdUVJL3dXRi9KeTFOcWtmZ3RReHF2ZThU?=
 =?utf-8?B?bDFscnhkWE5MQW4wTEZCL1B1TDExSXU3OWZjVGFCZHdlTVVWRXJUem53M1Bu?=
 =?utf-8?B?cXRld3Jab1BoblhsejAvdDBzcEtRbVJMblRnSWJvMVNKVnFCNFFlejgwdVNK?=
 =?utf-8?B?cmJxUiszM3EvaGYxdzVSOC9GNFl6bWVWcTdZTnFLcFQ4cTBJLzR4aXJhMVhy?=
 =?utf-8?B?eUxqN1M1djR3QVpKVkg1a2d2bitKeGYvNkMyNENMMFp5R0tBR3AvdUNBcFA0?=
 =?utf-8?B?U2hpRnhXQUNyUlBIcEtCVTIxZ3VjN2pLZnd0ZDJrbkp2Z0FUeW44SDFYUW5i?=
 =?utf-8?B?dFdna29GZ0tjd2JLOGJWWUhkNm5zczRGR0c1aHBwOEtuYTQrcVRSbTRyWUN1?=
 =?utf-8?B?Y0dHMDNhazBXQ3hESVdwTWl6Qy81ZjQwRlFJRU11MVU5YmNQc2ZrRzFmWjBZ?=
 =?utf-8?B?a2xEd25QamVUaDBjcDMrZUY4aDRabzJ0THlzQ1hGNFVXR2hnS0s4ellMV01L?=
 =?utf-8?B?WHB3SWtjT01FWHN6c2kvRnFmRGQ3TGsvWStBM01VMnNCYW0vNzJ2czBNNnJZ?=
 =?utf-8?B?NStiRStCdVhnQ1FmelJyTlJFS2E2b0hlVWJSdncyY3ZoTU9XeS9wYm5yWjF2?=
 =?utf-8?B?c0Ixc3BEVjVGeXlpeVc0cHYvYjgzNTFGZVBkaDYrSzAwTDdIRnJOelpGUUdw?=
 =?utf-8?B?Mk9UUjhSV0tqQkVFVTljV3BuQnJidzZCOGZra29wNFZLZGpldDVJMUNVdGho?=
 =?utf-8?B?V1hiQjB5SkRNdWpWWlRnM3N1TEJacVJPcjROYzBQcytqZktuTldZTFhwTmRh?=
 =?utf-8?B?RGtOV0dkWFFRU042OGpPS0RONStoS0xuVitEcmtIYk1GTGFaVllGd0I0elVt?=
 =?utf-8?B?cEVxUEpOTFRrbXBxQWhlaXVRY081YjZVd094Z2RrT3lYRkhxbUYvVGg3Uy9B?=
 =?utf-8?B?d3AwejhFNXFFUXhzWjF5TlR3eTJVSmdZOVhsOC8xUFNMOHV4ZktKVUQ2Y1M4?=
 =?utf-8?B?eXVIZWczZm9US3l6dkFldEJoSk1nRFhmYXp0bUZRcnZCT0hiRXpPUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79654145BCB0044B89D4D7B8E6CB8AF4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f79a0c-5db5-4905-e505-08d9e4ac26fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 11:23:48.7558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zYPbaErMYiVWnQ1VH43zugG0TWyYP+ulJHDJXa8mwyqEc6TPPjlH0Ewdi9UKTT6KM5E0a4PjZqwGRmdYGrO444/d6Q2oc/fWCgTbub/QFTGuOdhFWUFbWKDmaROojEdE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4227
X-Proofpoint-ORIG-GUID: tUUYzL-AcJ5zU3I3pyJPtz5cXRYqMgv8
X-Proofpoint-GUID: tUUYzL-AcJ5zU3I3pyJPtz5cXRYqMgv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310076

DQoNCk9uIDMxLjAxLjIyIDEzOjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IEphbiAzMSwgMjAyMiBhdCAxMDo0MDo0N0FNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IE9uIDMxLjAxLjIyIDExOjQ3LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3
cm90ZToNCj4+PiBIaSwgUm9nZXIhDQo+Pj4NCj4+PiBPbiAxMi4wMS4yMiAxNDozNSwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+ICtzdGF0aWMgdm9pZCBndWVzdF9yb21fd3JpdGUoY29u
c3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+Pj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZhbCwgdm9pZCAqZGF0YSkNCj4+Pj4+ICt7
DQo+Pj4+PiArfQ0KPj4+Pj4gKw0KPj4+Pj4gK3N0YXRpYyB1aW50MzJfdCBndWVzdF9yb21fcmVh
ZChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSkNCj4+Pj4+ICt7DQo+Pj4+
PiArICAgIHJldHVybiAweGZmZmZmZmZmOw0KPj4+Pj4gK30NCj4+Pj4gVGhlcmUgc2hvdWxkIGJl
IG5vIG5lZWQgZm9yIHRob3NlIGhhbmRsZXJzLiBBcyBzYWlkIGVsc2V3aGVyZTogZm9yDQo+Pj4+
IGd1ZXN0cyByZWdpc3RlcnMgbm90IGV4cGxpY2l0bHkgaGFuZGxlZCBzaG91bGQgcmV0dXJuIH4w
IGZvciByZWFkcyBhbmQNCj4+Pj4gZHJvcCB3cml0ZXMsIHdoaWNoIGlzIHdoYXQgeW91IGFyZSBw
cm9wb3NpbmcgaGVyZS4NCj4+PiBZZXMsIHlvdSBhcmUgcmlnaHQ6IEkgY2FuIHNlZSBpbiB2cGNp
X3JlYWQgdGhhdCB3ZSBlbmQgdXAgcmVhZGluZyB+MCBpZiBubw0KPj4+IGhhbmRsZXIgZXhpc3Rz
ICh3aGljaCBpcyB3aGF0IEkgZG8gaGVyZSB3aXRoIGd1ZXN0X3JvbV9yZWFkKS4gQnV0IEkgYW0g
bm90IHRoYXQNCj4+PiBzdXJlIGFib3V0IHRoZSBkcm9wcGVkIHdyaXRlczoNCj4+Pg0KPj4+IHZv
aWQgdnBjaV93cml0ZShwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsIHVuc2lnbmVk
IGludCBzaXplLA0KPj4+ICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50MzJf
dCBkYXRhKQ0KPj4+IHsNCj4+PiAgICDCoMKgwqAgdW5zaWduZWQgaW50IGRhdGFfb2Zmc2V0ID0g
MDsNCj4+Pg0KPj4+IFtzbmlwXQ0KPj4+DQo+Pj4gICAgwqDCoMKgIGlmICggZGF0YV9vZmZzZXQg
PCBzaXplICkNCj4+PiAgICDCoMKgwqDCoMKgwqDCoCAvKiBUYWlsaW5nIGdhcCwgd3JpdGUgdGhl
IHJlbWFpbmluZy4gKi8NCj4+PiAgICDCoMKgwqDCoMKgwqDCoCB2cGNpX3dyaXRlX2h3KHNiZGYs
IHJlZyArIGRhdGFfb2Zmc2V0LCBzaXplIC0gZGF0YV9vZmZzZXQsDQo+Pj4gICAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGEgPj4gKGRhdGFfb2Zmc2V0ICog
OCkpOw0KPj4+DQo+Pj4gc28gaXQgbG9va3MgbGlrZSBmb3IgdGhlIHVuLWhhbmRsZWQgd3JpdGVz
IHdlIHN0aWxsIHJlYWNoIHRoZSBIVyByZWdpc3Rlci4NCj4+PiBDb3VsZCB5b3UgcGxlYXNlIHRl
bGwgaWYgdGhlIGNvZGUgYWJvdmUgbmVlZHMgaW1wcm92ZW1lbnQgKGxpa2UgY2hlY2tpbmcNCj4+
PiBpZiB0aGUgd3JpdGUgd2FzIGhhbmRsZWQpIG9yIEkgc3RpbGwgbmVlZCB0byBwcm92aWRlIGEg
d3JpdGUgaGFuZGxlciwgZS5nLg0KPj4+IGd1ZXN0X3JvbV93cml0ZSBoZXJlPw0KPj4gSG0sIGJ1
dCB0aGUgc2FtZSBhcHBsaWVzIHRvIHRoZSByZWFkcyBhcyB3ZWxsLi4uIEFuZCB0aGlzIGlzIG5v
IHN1cnByaXNlLA0KPj4gYXMgZm9yIHRoZSBndWVzdHMgSSBjYW4gc2VlIHRoYXQgaXQgYWNjZXNz
ZXMgYWxsIHRoZSBjb25maWd1cmF0aW9uIHNwYWNlDQo+PiByZWdpc3RlcnMgdGhhdCBJIGRvbid0
IGhhbmRsZS4gV2l0aG91dCB0aGF0IEkgd291bGQgaGF2ZSBndWVzdHMgdW5hYmxlDQo+PiB0byBw
cm9wZXJseSBzZXR1cCBhIFBDSSBkZXZpY2UgYmVpbmcgcGFzc2VkIHRocm91Z2guLi4gQW5kIHRo
aXMgaXMgd2h5DQo+PiBJIGhhdmUgYSBiaWcgVE9ETyBpbiB0aGlzIHNlcmllcyBkZXNjcmliaW5n
IHVuaGFuZGxlZCByZWdpc3RlcnMuDQo+PiBTbywgaXQgc2VlbXMgdGhhdCBJIGRvIG5lZWQgdG8g
cHJvdmlkZSB0aG9zZSBoYW5kbGVycyB3aGljaCBJIG5lZWQgdG8NCj4+IGRyb3Agd3JpdGVzIGFu
ZCByZXR1cm4gfjAgb24gcmVhZHMuDQo+IFJpZ2h0IChzZWUgbXkgcHJldmlvdXMgcmVwbHkgdG8g
dGhpcyBjb21tZW50KS4gSSB0aGluayBpdCB3b3VsZCBiZQ0KPiBlYXNpZXIgKGFuZCBjbGVhbmVy
KSBpZiB5b3Ugc3dpdGNoZWQgdGhlIGRlZmF1bHQgYmVoYXZpb3IgcmVnYXJkaW5nDQo+IHVuaGFu
ZGxlZCByZWdpc3RlciBhY2Nlc3MgZm9yIGRvbVVzIGF0IHRoZSBzdGFydCBvZiB0aGUgc2VyaWVz
IChkcm9wDQo+IHdyaXRlcywgcmVhZHMgcmV0dXJucyB+MCksIGFuZCB0aGVuIHlvdSB3b24ndCBu
ZWVkIHRvIGFkZCBhbGwgdGhvc2UNCj4gZHVtbXkgaGFuZGxlciB0byBkcm9wIHdyaXRlcyBhbmQg
cmV0dXJuIH4wIGZvciByZWFkcy4NCj4NCj4gSXQncyBnb2luZyB0byBiZSBtb3JlIHdvcmsgaW5p
dGlhbGx5IGFzIHlvdSB3b3VsZCBuZWVkIHRvIHN1cHBvcnQNCj4gcGFzc3Rocm91Z2ggb2YgbW9y
ZSByZWdpc3RlcnMsIGJ1dCBpdCdzIHRoZSByaWdodCBhcHByb2FjaCB0aGF0IHdlDQo+IG5lZWQg
aW1wbGVtZW50YXRpb24gd2lzZS4NCldoaWxlIEkgYWdyZWUgaW4gZ2VuZXJhbCwgdGhpcyBlZmZl
Y3RpdmVseSBtZWFucyB0aGF0IEknbGwgbmVlZCB0byBwcm92aWRlDQpoYW5kbGluZyBmb3IgYWxs
IFBDSWUgcmVnaXN0ZXJzIGFuZCBjYXBhYmlsaXRpZXMgZnJvbSB0aGUgdmVyeSBzdGFydC4NCk90
aGVyd2lzZSBubyBndWVzdCBiZSBhYmxlIHRvIHByb3Blcmx5IGluaXRpYWxpemUgYSBQQ0kgZGV2
aWNlIHdpdGhvdXQgdGhhdC4NCk9mIGNvdXJzZSwgd2UgbWF5IHdhbnQgc3RhcnRpbmcgZnJvbSBz
dHVicyBpbnN0ZWFkIG9mIHByb3BlciBlbXVsYXRpb24sDQp3aGljaCB3aWxsIGRpcmVjdCB0aGUg
YWNjZXNzIHRvIHJlYWwgSFcgYW5kIGxhdGVyIG9uIHdlIGFkZCBwcm9wZXIgZW11bGF0aW9uLg0K
QnV0LCBhZ2FpbiwgdGhpcyBpcyBnb2luZyB0byBiZSBhIHJhdGhlciBiaWcgcGllY2Ugb2YgY29k
ZSB3aGVyZSB3ZSBuZWVkDQp0byBleHBsaWNpdGx5IGhhbmRsZSBldmVyeSBwb3NzaWJsZSBjYXBh
YmlsaXR5Lg0KDQpBdCB0aGUgbW9tZW50IHdlIGFyZSBub3QgZ29pbmcgdG8gY2xhaW0gdGhhdCB2
UENJIHByb3ZpZGVzIGFsbCBtZWFucyB0bw0KcGFzcyB0aHJvdWdoIGEgUENJIGRldmljZSBzYWZl
bHkgd2l0aCB0aGlzIHJlc3BlY3QgYW5kIHRoaXMgaXMgd2h5IHRoZSBmZWF0dXJlDQppdHNlbGYg
d29uJ3QgZXZlbiBiZSBhIHRlY2ggcHJldmlldyB5ZXQuIEZvciB0aGF0IHJlYXNvbiBJIHRoaW5r
IHdlIGNhbiBzdGlsbA0KaGF2ZSBpbXBsZW1lbnRlZCBvbmx5IGNydWNpYWwgc2V0IG9mIGhhbmRs
ZXJzIGFuZCBzdGlsbCBhbGxvdyB0aGUgcmVzdCB0bw0KYmUgcmVhZC93cml0ZSBkaXJlY3RseSB3
aXRob3V0IGVtdWxhdGlvbi4NCg0KQW5vdGhlciBxdWVzdGlvbiBpcyB3aGF0IG5lZWRzIHRvIGJl
IGRvbmUgZm9yIHZlbmRvciBzcGVjaWZpYyBjYXBhYmlsaXRpZXM/DQpIb3cgdGhlc2UgYXJlIGdv
aW5nIHRvIGJlIGVtdWxhdGVkPw0KPg0KPiBUaGFua3MsIFJvZ2VyLg0KVGhhbmsgeW91LA0KT2xl
a3NhbmRy

