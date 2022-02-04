Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCFF4A971B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 10:47:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265309.458649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFvBp-0004tX-VF; Fri, 04 Feb 2022 09:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265309.458649; Fri, 04 Feb 2022 09:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFvBp-0004r9-Qa; Fri, 04 Feb 2022 09:47:37 +0000
Received: by outflank-mailman (input) for mailman id 265309;
 Fri, 04 Feb 2022 09:47:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFvBn-0004r3-6S
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 09:47:35 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79013f62-859f-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 10:47:33 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2147VchK001227;
 Fri, 4 Feb 2022 09:47:29 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e0yu5rg17-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 09:47:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB8PR03MB6300.eurprd03.prod.outlook.com (2603:10a6:10:13f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 09:47:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 09:47:24 +0000
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
X-Inumbo-ID: 79013f62-859f-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNZYTYXMR4X72RWrsGdDkYww/7oPoygBIx50HUDQ4j75m/N1ZQmWLqhtCsKl3rc7JlyjXCzh57DcLb9i0bl7V+G3XQlP5r0GTKYO8b7at0txtSDgp6/u9beRj1G67FZVL1z1e5VacDiJ4JfDnx/zhY+4Icok0fzH4DcquJrbKMDKag6sdixdsxVgbLpV9UIjx7+sK51Wq29X2eHHfy4icAlIxvGDKPNmrj+en8tolj/XFAME+TnMOF2fU634lFZXeoeo2SI/BG4AKDM7PLE6rVqlAIh4+pX1jkQdv0/MIpks6UD4kue6CYmC2Zda1HheInJ4jeg6r4MBzvZeUPi6QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwICvpDE2fe4T4tWgkfH1bEvLBMLGpgSNmD+RdtsPHY=;
 b=OrXPK/DgJqafEhIatZS9eN0TcsSEpb2dbhKNiamMOpPGCfSsFlh+4TP+mlZdXBwuI9RbOqasFwUsUuRJeIgDZSokicF+NxPpHF7Pu+aEhqeCiHbThOcWDtH7wAiOehxFyzrYBL1JwZey1IXQFcOGIExKlPjsSojAz3y/4NPwoPNkVzsMjzEhnfCot+5UADU1K7hIN7MZuXNepDypuTtTh7qrgUaQDZCt4PRyMTYp7+OV3WNHxVQUkli9K0sCfgGIsZAHKzf5iir9YN4SAJZAe9G6CXZSyvSQk0d3AECn0dPjO5s31h/F3JWeUV1Q4Toy/6AiK5PMws6GW2aPEOpXOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwICvpDE2fe4T4tWgkfH1bEvLBMLGpgSNmD+RdtsPHY=;
 b=PgDi7SpfYFGlKVNdMyli+HcejJnIs8b0F3S4mcp6grEKgUso9xGv4wGBdFe4jlf7euY+PGbHKxu1hoWMgTNDtYXlL0ncG1KXNDpQRiKkQS1K9Z2zxlf8pS9ck2irxBmW/i4MJSH7pLMLtk453C3AthcJyiLdSKN+++S0FG+O9WVKqHqxxXnzfb6Hx2N9/kW7NUASliFhbGa6UvzTGgES7H/hOYlE8VYw8zGvEGDr1rYfgCE7hdkP+sCPCpsvJk9puLXtnhBETpFSJ3ydpQFCtb1mSH9d5Gq5yLwV5ixKmyZRHmqlg+G8/Js/nVhsHtRGTbl1AR1tlyrdUbb8ZP6HEw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 01/13] xen/pci: arm: add stub for is_memory_hole
Thread-Topic: [PATCH v6 01/13] xen/pci: arm: add stub for is_memory_hole
Thread-Index: AQHYGZFbEg6Erttt1UCNei+XrySHEqyDFYiAgAAC4gCAAAsigIAAAbyA
Date: Fri, 4 Feb 2022 09:47:24 +0000
Message-ID: <43cab3d0-1a62-dca0-0d2d-5ea8fe237b21@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-2-andr2000@gmail.com>
 <000ac24e-fdac-855d-7fb4-2165a1192ea4@xen.org>
 <19e50632-5865-9a75-756b-88db85007e96@epam.com>
 <d9741ff0-2152-6792-5249-09e3b0960972@xen.org>
In-Reply-To: <d9741ff0-2152-6792-5249-09e3b0960972@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 184d875b-4255-41a3-fede-08d9e7c358cb
x-ms-traffictypediagnostic: DB8PR03MB6300:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB8PR03MB6300F85BE2E291799ACF998DE7299@DB8PR03MB6300.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mWc701zS6kKWj9w6qguqnW+Dk+vOn5xw498BHX+igtcf8N9NH76nZwvQ/gzhMhlhIUTyMtR41h/fbQXHtegviVzSuXqwB0ZpQC+TRmMzUNoKQIFg4hn5iXwSjp8sm5t70MKn7W9xQaQY5kPnp+t2Zwcnvj/KrrjBmx9j4S0eL15qOzBVY5oVLQcTnI+bj1lI2C4QDaLMawZo5+gWaokQQiK1P26inENeoNDbWuOFXo/HN0ruFYAYa6UnUobtFWq98jYVLtbMLsvemIc4pXu5zArkoEVypWuuMqZ9JaV0n3asUdMc5qunoZRk5OwuIVfYxERPCZTAxZXgij15kUyHPhNQmc4d3MnIGLRs95ilmsjjk6F8+xubiQDixrVGOBkVtg2cRvq7YHNGCKdW8fw+j2HAp+czUj+69j5sLYDw6t2A5LO/W5Wg6tXQM/RGI34PrAjJZVy9k7Dqe8OUQI/IDcB4P6NKxZWaZ1azn9VhwFDksqHMv31X3nJhV1YPz4dPNrkwMIe3bZzhQKT/pyMrhG4NKxiQbFw78P+ZTUvRbHgIdkWa/XkTk/hkiuHWDRo/1lga9qz/yeEUylWtiJlM7jgJH2da6A6LsZw9ZIHzbz7PRsN1OZNdYzRhibKsOj9h4ZrN5GFX6rky8PJ0xNCoIdhRqQrJ4/NDxa03iXs32uhaN753xQGSSFftUxPuzGK39A5+ZJWzOWMdhBmIGwVvyp4U7UsrMrdZ08TubFw49UB/mcWbsXxG04OR+Ubj+/hr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(31696002)(64756008)(122000001)(54906003)(71200400001)(2906002)(31686004)(83380400001)(6486002)(38070700005)(66476007)(107886003)(5660300002)(66446008)(508600001)(8936002)(110136005)(53546011)(8676002)(316002)(38100700002)(66946007)(76116006)(186003)(6506007)(91956017)(36756003)(7416002)(86362001)(6512007)(4326008)(2616005)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bmFTZTFnVGd2WWp4T2RDZ0pOSC9Gd3MycUhQNmVUZy9kV0RvS3h6L3hPb3Rx?=
 =?utf-8?B?MFpUNzhXUE5hSHdVWURMVlRCTEpSUTBCK2RDQTlqaW1KQzY1YlBmYXd1R2xm?=
 =?utf-8?B?UFFLYUZhVFdqU3RVT0ljd3V3VmEvMGxhdUZyUmJud3kxajl3S3lrUXVGWEtT?=
 =?utf-8?B?SVRhbUtLZTlrTmdJb0tqUVE3VDBEMkhRQkRjNWltZ1ZqR1MxL1JCZnZOMGZC?=
 =?utf-8?B?ajZua1lyeHRtNW9ZcndYQit3b2R6N1FYeWRqM0M1ekw0aHFDeUlQcDlScnlJ?=
 =?utf-8?B?V0UyRll2RmZwbkZ1QVQzdktNc0oxSTB3VHVXWUdHOXErbUdpWDBtalJIeWNK?=
 =?utf-8?B?WDFjdkZCU2RRYzlUcDZJdkE5eU1ESGNrTXIvOHo0VW8yMTZndGJZTkZQVy92?=
 =?utf-8?B?UlRPQThPZmx4bUlyMFE1cERxQ1NtekVuZjNBcnJGK0Z0KzZmaUZRUWg1U3Fj?=
 =?utf-8?B?U1JmcjFRaklxeDJYTzZIZkVvb2E5Qncwa1VVb3UvRVo5ZVdKamFEQ25DOFM1?=
 =?utf-8?B?QWliUTZjOGVkaFBWYkxkaWtQWjRkT0pFMnUxWDR0T003UWF1V0RmaHBGS2pL?=
 =?utf-8?B?K3BITnZBY0tnbHdES205bm15VEZoOFJDQ2ErYllhR1ViWlQ5SjR6YUYra0Vu?=
 =?utf-8?B?QmV4K1RrSzh4OEplM2RrWml2bzdaMGdRT2RBVm14QkJpaUNlRjRjUkNhR1Rr?=
 =?utf-8?B?MzdQRmFrclpGQkorZURKOG5UeHdSakVvR2NrY2pUOHpLNEJ0blZWY3RYNFQw?=
 =?utf-8?B?T2ZHcjNRc3ZSOEhRMGJtQWFXK0FtY0hlWm9pV2NqQUxlWTZRVCsvRHRIY3RF?=
 =?utf-8?B?Q2MvSkorVWd5cU9KVjgySGxZSjJpUUdmdWxUUnlIMHlJVGVoQlFnYmZya2c0?=
 =?utf-8?B?QVJBU21xRGo1YkFYanpKVU0zNFZic0loM1o3UCttcjE0QTc4d2VvZWEyZ0kz?=
 =?utf-8?B?WUM4ei9meHo2M1l4b0w2dlY5aUxJL0xTRTRPMS9FUUFpWitSMC96OVF3NlB6?=
 =?utf-8?B?aEovZm5yVkdJeDBPOVFoZ2RsZjl2NnhmeEtkcjAxaUQ5VUV4Z2FQWXJJbUVZ?=
 =?utf-8?B?eEEzOWNPMHZXRG55ZzdseGVQZGR2d0VVUldjejIxSGNXc1dHaHhoZmVQWVJJ?=
 =?utf-8?B?ODNHbXhLVEVMVVFDSlorQkkxVUVveFFNVDRrNXJUZ0QxUXViaUpJOGt6aUNz?=
 =?utf-8?B?MEsyaTVXRkJqMFJWZ2pYRllkb1YvSEhhRjdIOWhjeGh4SFJiTEdkK0RwUDFO?=
 =?utf-8?B?VUk5TUVJaC9CaXFmTi9INlFFc2tWQWo1U09wQ2lsY1hYRDNJVFBaOGhXRjRw?=
 =?utf-8?B?Z09CbWtvdFVMYWxLZkd4anh6ZHRsYm50YmlJc3lQdkZCSXc5WnhiUGNnS2Rt?=
 =?utf-8?B?SWIrRDRvZ3FNUVdVVytPQ2RucWh1Qm9xc3BBRy9KR2hGN202M1ZibUVlUzhR?=
 =?utf-8?B?RXpxM1dUOXBmSFZvZGtyRS9BZU1xRFI0WklCSFMyOHBTU0RWaldYVkpKWWtB?=
 =?utf-8?B?Zkp5RWFoYkNRMy9TTFJQTFpxUndxQnYvbFlPdXdhT09VK2hLOU1RTXFRR3dp?=
 =?utf-8?B?cVZndzJHNXczYUc4NURhclh4ZWxaWUtpWUVQUHMrM3BvaFZ5bVZmalBhSVBM?=
 =?utf-8?B?MmRTampLWmZxbEFvdUo0dG5qY0E2T2JhQURxQmk2UnBLRXNCdHBpN3dSYTJr?=
 =?utf-8?B?RkpTUE1jUllHd1dKZXJQNjIwL0NnL2VTMHVIV25GNUpEa0d3OVZxampXQzNq?=
 =?utf-8?B?QVptMm93akRvait5MmpEVE1WeW9jenNwUDZVV0xmQituN1l2RzlRdjgzYy9w?=
 =?utf-8?B?ODZrYm55Qkt6dGswaXprUFh4YklRM2l3NGNQNWx0L2J0Z2xmVmkzWjRSL1ZW?=
 =?utf-8?B?dTNuWXR3aEhDS2lHazZ1dEp6VUFmQlpRVjlqTW1qbW1RRXRYcGM3MEpnZGFk?=
 =?utf-8?B?b2lOZTRxRkJYWVJoWXlQNVI0MjFMS2d6MytNeFQwczFKKzhIQXZhYnRiNzdn?=
 =?utf-8?B?alhoYTdYa3ZBU1grS0pocFhtRVAvUmQ4bU4zb3A1WW02T3l0Z25IdHhRaXd2?=
 =?utf-8?B?QVF2SkpnUVg4V0pPZEc1aER1STFuMXlWZHBLNGMyYlBOYmdtbjVFRlNVSlFw?=
 =?utf-8?B?bzRjR1ozRVZrN3BGNWJlM1RWL3hxTGNZdC9NVTU0dUZYNG11V0M2STRta1N0?=
 =?utf-8?B?QzVRTGxIOEhDOUI4aG9ENnlud3h2N2VPR3dIZEExOUwxNzEwV1VuazAxL3Bl?=
 =?utf-8?B?Q2wzcXFWWG05V3NjWllnRWlPMDZSQ2h1bFZUNmhlYS94MVNnNUdvdGdNekwz?=
 =?utf-8?B?cW4zRDNXMTZPQ1pMMnpvK1ViRGNYT3UzS2I4RVQ3VitVUUVjeEh2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A39E8E04F1CFBD4BB8931B9D9196B719@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184d875b-4255-41a3-fede-08d9e7c358cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 09:47:24.3257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vVLzpEx5wQW16A1PzdYRqE6IKFPXue6SohPz1U5Vyue2IEdtUjDfMvHx1MXCHz2kSpC5id/FNbD1FoFmJ/IN56f5Lc3g2P+C0CfNyTFvBMAR6ddK/otdcYUX9lD4Tznx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6300
X-Proofpoint-GUID: 2uoDSoXiWrkRngE4H64voBLnP8SCwO2w
X-Proofpoint-ORIG-GUID: 2uoDSoXiWrkRngE4H64voBLnP8SCwO2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202040051

DQoNCk9uIDA0LjAyLjIyIDExOjQxLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IE9uIDA0LzAyLzIw
MjIgMDk6MDEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDQuMDIuMjIg
MTA6NTEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IE9uIDA0LzAyLzIw
MjIgMDY6MzQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBGcm9tOiBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+
Pj4+DQo+Pj4+IEFkZCBhIHN0dWIgZm9yIGlzX21lbW9yeV9ob2xlIHdoaWNoIGlzIHJlcXVpcmVk
IGZvciBQQ0kgcGFzc3Rocm91Z2gNCj4+Pj4gb24gQXJtLg0KPj4+Pg0KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBh
bS5jb20+DQo+Pj4+DQo+Pj4+IC0tLQ0KPj4+PiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4NCj4+Pj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4NCj4+Pj4gLS0tDQo+Pj4+IE5ldyBpbiB2Ng0KPj4+PiAtLS0NCj4+Pj4gwqDCoCB4ZW4vYXJj
aC9hcm0vbW0uYyB8IDYgKysrKysrDQo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4v
YXJjaC9hcm0vbW0uYw0KPj4+PiBpbmRleCBiMWVhZTc2N2MyN2MuLmMzMmUzNGExODJhMiAxMDA2
NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJt
L21tLmMNCj4+Pj4gQEAgLTE2NDAsNiArMTY0MCwxMiBAQCB1bnNpZ25lZCBsb25nIGdldF91cHBl
cl9tZm5fYm91bmQodm9pZCkNCj4+Pj4gwqDCoMKgwqDCoMKgIHJldHVybiBtYXhfcGFnZSAtIDE7
DQo+Pj4+IMKgwqAgfQ0KPj4+PiDCoMKgICtib29sIGlzX21lbW9yeV9ob2xlKG1mbl90IHN0YXJ0
LCBtZm5fdCBlbmQpDQo+Pj4+ICt7DQo+Pj4+ICvCoMKgwqAgLyogVE9ETzogdGhpcyBuZWVkcyB0
byBiZSBwcm9wZXJseSBpbXBsZW1lbnRlZC4gKi8NCj4+Pg0KPj4+IEkgd2FzIGhvcGluZyB0byBz
ZWUgYSBzdW1tYXJ5IG9mIHRoZSBkaXNjdXNzaW9uIGZyb20gSVJDIHNvbWV3aGVyZSBpbiB0aGUg
cGF0Y2ggKG1heWJlIGFmdGVyIC0tLSkuIFRoaXMgd291bGQgaGVscCB0byBicmluZyB1cCB0byBz
cGVlZCB0aGUgb3RoZXJzIHRoYXQgd2VyZSBub3Qgb24gSVJDLg0KPj4gSSBhbSBub3QgcXVpdGUg
c3VyZSB3aGF0IG5lZWRzIHRvIGJlIHB1dCBoZXJlIGFzIHRoZSBzdW1tYXJ5DQo+DQo+IEF0IGxl
YXN0IHNvbWUgZGV0YWlscyBvbiB3aHkgdGhpcyBpcyBhIFRPRE8uIElzIGl0IGJlY2F1c2UgeW91
IGFyZSB1bnN1cmUgb2YgdGhlIGltcGxlbWVudGF0aW9uPyBJcyBpdCBiZWNhdXNlIHlvdSB3YW50
ZWQgdG8gc2VuZCBlYXJseT8uLi4NCj4NCj4gSU9XLCB3aGF0IGFyZSB5b3UgZXhwZWN0aW5nIGZy
b20gdGhlIHJldmlld2Vycz8NCldlbGwsIEkganVzdCBuZWVkIHRvIGFsbG93IFBDSSBwYXNzdGhy
b3VnaCB0byBiZSBidWlsdCBvbiBBcm0gYXQgdGhlIG1vbWVudC4NCkNsZWFybHksIHdpdGhvdXQg
dGhpcyBzdHViIEkgY2FuJ3QgZG8gc28uIFRoaXMgaXMgdGhlIG9ubHkgaW50ZW50aW9uIG5vdy4N
Ck9mIGNvdXJzZSwgd2hpbGUgUENJIHBhc3N0aHJvdWdoIG9uIEFybSBpcyBzdGlsbCBub3QgcmVh
bGx5IGVuYWJsZWQgdGhvc2UNCndobyB3YW50IHRyeWluZyBpdCB3aWxsIG5lZWQgcmV2ZXJ0aW5n
IHRoZSBvZmZlbmRpbmcgcGF0Y2ggb3RoZXJ3aXNlLg0KSSBhbSBmaW5lIGJvdGggd2F5cw0KPg0K
Pj4gQ291bGQgeW91IHBsZWFzZSBoZWxwIG1lIHdpdGggdGhlIGV4YWN0IG1lc3NhZ2UgeW91IHdv
dWxkIGxpa2UgdG8gc2VlPw0KPg0KPiBIZXJlIGEgc3VtbWFyeSBvZiB0aGUgZGlzY3Vzc2lvbiAo
KyBzb21lIG15IGZvbGxvdy11cCB0aG91Z2h0cyk6DQo+DQo+IGlzX21lbW9yeV9ob2xlKCkgd2Fz
IHJlY2VudGx5IGludHJvZHVjZWQgb24geDg2IChzZWUgY29tbWl0IDc1Y2M0NjBhMWI4YyAieGVu
L3BjaTogZGV0ZWN0IHdoZW4gQkFScyBhcmUgbm90IHN1aXRhYmx5IHBvc2l0aW9uZWQiKSB0byBj
aGVjayB3aGV0aGVyIHRoZSBCQVIgYXJlIHBvc2l0aW9uZWQgb3V0c2lkZSBvZiBhIHZhbGlkIG1l
bW9yeSByYW5nZS4gVGhpcyB3YXMgaW50cm9kdWNlZCB0byB3b3JrLWFyb3VuZCBxdWlya3kgZmly
bXdhcmUuDQo+DQo+IEluIHRoZW9yeSwgdGhpcyBjb3VsZCBhbHNvIGhhcHBlbiBvbiBBcm0uIElu
IHByYWN0aWNlLCB0aGlzIG1heSBub3QgaGFwcGVuIGJ1dCBpdCBzb3VuZHMgYmV0dGVyIHRvIHNh
bml0eSBjaGVjayB0aGF0IHRoZSBCQVIgY29udGFpbnMgInZhbGlkIiBJL08gcmFuZ2UuDQo+DQo+
IE9uIHg4NiwgdGhpcyBpcyBpbXBsZW1lbnRlZCBieSBjaGVja2luZyB0aGUgcmVnaW9uIGlzIG5v
dCBkZXNjcmliZWQgaXMgaW4gdGhlIGU4MjAuIElJVUMsIG9uIEFybSwgdGhlIEJBUnMgaGF2ZSB0
byBiZSBwb3NpdGlvbmVkIGluIHByZS1kZWZpbmVkIHJhbmdlcy4gU28gSSB0aGluayBpdCB3b3Vs
ZCBiZSBwb3NzaWJsZSB0byBpbXBsZW1lbnQgaXNfbWVtb3J5X2hvbGUoKSBieSBnb2luZyB0aHJv
dWdoIHRoZSBsaXN0IG9mIGhvc3RicmlkZ2VzIGFuZCBjaGVjayB0aGUgcmFuZ2VzLg0KPg0KPiBC
dXQgZmlyc3QsIEknZCBsaWtlIHRvIGNvbmZpcm0gbXkgdW5kZXJzdGFuZGluZyB3aXRoIFJhaHVs
LCBhbmQgb3RoZXJzLg0KPg0KPiBJZiB3ZSB3ZXJlIGdvaW5nIHRvIGdvIHRoaXMgcm91dGUsIEkg
d291bGQgYWxzbyByZW5hbWUgdGhlIGZ1bmN0aW9uIHRvIGJlIGJldHRlciBtYXRjaCB3aGF0IGl0
IGlzIGRvaW5nIChpLmUuIGl0IGNoZWNrcyB0aGUgQkFSIGlzIGNvcnJlY3RseSBwbGFjZWQpLiBB
cyBhIHBvdGVudGlhbGx5IG9wdGltaXphdGlvbi9oYXJkZW5pbmcgZm9yIEFybSwgd2UgY291bGQg
cGFzcyB0aGUgaG9zdGJyaWRnZSBzbyB3ZSBkb24ndCBoYXZlIHRvIHdhbGsgYWxsIG9mIHRoZW0u
DQpJdCBzZWVtcyB0aGlzIG5lZWRzIHRvIGxpdmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHRoZW4/
IFNvLCBpdCBpcyBlYXN5IHRvIGZpbmQNCmFzIGV2ZXJ5dGhpbmcgYWZ0ZXIgIi0tLSIgaXMgZ29p
bmcgdG8gYmUgZHJvcHBlZCBvbiBjb21taXQNCj4NCj4gQ2hlZXJzLA0KPg0KVGhhbmsgeW91LA0K
T2xla3NhbmRy

