Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916EE4A4441
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263020.455555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUtX-0004cV-N2; Mon, 31 Jan 2022 11:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263020.455555; Mon, 31 Jan 2022 11:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUtX-0004ZM-HB; Mon, 31 Jan 2022 11:30:51 +0000
Received: by outflank-mailman (input) for mailman id 263020;
 Mon, 31 Jan 2022 11:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEUtW-0004ZG-36
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:30:50 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c319e0e-8289-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 12:30:48 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VAvb6R021512;
 Mon, 31 Jan 2022 11:30:43 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dx84m1dc9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:30:43 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB6PR0301MB2311.eurprd03.prod.outlook.com (2603:10a6:4:48::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 11:30:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 11:30:39 +0000
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
X-Inumbo-ID: 3c319e0e-8289-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPClRrylsyymlTm+00BSqe3i/wMYJSS90dSPQQ739bY816fqpbDuRrEcYezBmBcLW2JF4bQTeyyi75p4CUtBeRpIFU1Y5K57SnobhuFy8b0HwsgPz7eQwPH0EGWpzda0NP3CZow0Er3SSSJX0tYBkflzgw+zv1D5MEJUK1uLPD196qFTQTsCHeTgR9Z2ol7Mc5j21NQEradVGyiB1lNy/x0Wwr7VtSbQbGYaC5idrqRoo6Hwlb1wGJt0iCzpwTyukoV6wa6E8cxv3QTb5eMrMlhGOUa4jd06s5lbpnhcFq0x7hBtY8aSo2wJ5FMvbj03jsUINUGv3pkxQjbz3drTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lewh/3Ae4/T3rjLmnLM66AH37RKjU9Kyy3K7pb13OwQ=;
 b=eWK+Zq8pHf5jIyJwLyB+sAB/QTHtCa7ATWJS4dRxjdLOVcAvzFVa+GEcGYmT+JlixVQrOW4GTmkEucbNX4Sk1IgUfzFporD0gsUeSqXuQkJczBLwLezvqhQ/Z7PtSok9tZriyh/k5BECbebJSHzkXxeovUowQ7ngWk73UGlGS1mWrk2Tg3kyktpm7V6nD6zQxMGR088roL22eyIUKVvgy4X/Kc4Y1Z2QLR/3sBxE/FR/PKO36qwATcC8jmlouFYwO0D+e6OZss2Hd0rljytk9KME88TrrNUqj6182opOnszLoZCntlqe0PRfV8k8YQqFuTyk4vOfqHzaAv75olL/1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lewh/3Ae4/T3rjLmnLM66AH37RKjU9Kyy3K7pb13OwQ=;
 b=FFuh+3jjuTUd00nTg804dkR81TWGa+zzKL1rW1iXFKmKCZg+l32o9ldjDkZExcIBIGARU3xuCoUIN8G8Bi9sZRABvjRQUNY7sUKm242OJ3UMgekUDT4+BTkr65RmQk7C4ZNyVqfacKvjeUM+hNqgApP0NvE9MgDo1+9dlbKYO8Wa/IluEDW3nqswzOU/5fUc3cvVoykHQqaOW1bmItQ4wZ9hjsLtpAN82lJou8CZ0VP4W2yC7pHpIRVoVrwVp/rRSpCxfHMt/OSeznlK7ab+n8fMtuccYBjJr0zDyxExK64SKSHwW0Ud0eoj4Rm1b2UVGmhj7gQlQLeLyr8F6nWHew==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: 
 AQHX4ewHyWAyD811HEGp8pIjUuVWNaxfndGAgB2tWgCAAA7+AIAAA9kAgAACyICAAAZ5gIAAANUA
Date: Mon, 31 Jan 2022 11:30:39 +0000
Message-ID: <a7adb84a-1e46-fb52-80c5-cdd3cddb75bf@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
 <3db8d85e-4b9e-ed0c-5053-cc953c835efc@suse.com>
 <5de61dc5-0292-de1b-fad2-aa99d5351043@epam.com>
 <YffHq2hjpakgdhQb@Air-de-Roger>
In-Reply-To: <YffHq2hjpakgdhQb@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39cb4ba2-65e4-4832-847e-08d9e4ad1b9c
x-ms-traffictypediagnostic: DB6PR0301MB2311:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB6PR0301MB231178AEDFB715963B44CA61E7259@DB6PR0301MB2311.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 q6uIYq3J6rlBWPOo91mQqwIGh2hC93+VQ3c8jezlwGJMfCenpbOrm8/lvJTTGtajBlC0EJbOqIQbX2KYzNQsTBtO5hdZbm7tbRtTOHeL/KgxK/aOjUMthKhDJ2Oc8iQN4Fdohc2/Q1cXl4mtBheL9sshXRfYmCJhlF/WVoPZCKVfG9rsty6H1rvqsdHck2Pk9KVDQXnz4Ecl4wE8c8hYpv4FpdxKmrMG8a/0EL8gmi6bI9TdwxY0MrVd2CK846A2IgMGJm9FKpUZ9BrtRQUmmz8TRfZJhfSax/JYjkIg+yZpXb3+LjdmMF3JNHZjPClznCrZhN3qvN4RkNUv0sRLt2JKb83Lkv+ybYACwDiEs9hfTOD265GTze447uolC4qkMbiX2KDHLUUIsdYSuxirujX3lBi0R3Y8MWOIkDOm/lvPuF3R8X3LGGclwgdOgo8kZsPSgPqBL/2mR8XSU0lACQQAhnfORdZoD8NbwkipjhSf9nwIrdnqKAwHbaVkgA14FQ6HNiP1LrqeJXh4D2+2DGixnHK51beJeP43u2ikSEZffpOZqBN8uT/XS2EWnt/1n2Y/Kd2Ezja2uGEpl64NW4zNeGGXaz3L9o+/sMmfoPRNKJ6g3151LfuCOWZCos5512shrUzl79veILhrEs8nqaC16vTpmgczzOcQlYdPE6SntX3jZaVQhMrp0FRTHwVOdafX7EJyse8b7E6lCU+a8LeZikslOAJp7fVgoXEfov5f0XlNLvgvzR1lKKmHAYOY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(66946007)(8936002)(64756008)(8676002)(66556008)(86362001)(316002)(6916009)(54906003)(38070700005)(38100700002)(31686004)(122000001)(4326008)(76116006)(36756003)(91956017)(66446008)(66476007)(31696002)(508600001)(71200400001)(53546011)(6506007)(83380400001)(6512007)(5660300002)(2906002)(7416002)(107886003)(186003)(26005)(2616005)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Nm1MeFFwOWZLT2Uxdk9DWDlVbS9rNzR3MXBFcGVEdFB4NHpzdVY0Snh1V0ZF?=
 =?utf-8?B?cVhpY0E5RXdlT2FyRzRxQWxWZUFjUXJBYThSaTBFVEdIWjM2UGtZVkYxeUpv?=
 =?utf-8?B?MnlBSzB2ZFRjcDVVZzcvR0RXRTVuTFlTTHFXK0RFTXpNUUVUeFIvZ01RTGpO?=
 =?utf-8?B?NGsxM29nc3h6dGNtdlczSnVBQmp3bjJvc0JPdE5hRlM2U0NqcC9sd0IxNXNK?=
 =?utf-8?B?TnhLbmpzaE11VzF6S2xOWTZhWUJLUkN3dGFJQm1WZ29HaHBBQU5Pb0JMZHpU?=
 =?utf-8?B?R2tMME5NOVFKY0xZMVkvUUNlR283aHdSaFNicXdGV3B5ckhHdXd6Zng0eUVP?=
 =?utf-8?B?c1FsbzRwV2VVU1h0akJobXRISFg4NHVFVWgzYVZYS0Z3eWJUMFQxT2ZKaHJW?=
 =?utf-8?B?bGl4SHE2OVViYXIvK21zZHRIK214Szc5Y3pGOXpLdjdJZkhBQVpqSExlRFFt?=
 =?utf-8?B?WjZzbGhTTisvMndjcE9CZmV5UDZkYlJBeWJqcGRPV2lhUUQxYjhmV0JsQTRi?=
 =?utf-8?B?c3dOUU1JajdlR2g2bDBTYisvRUVsQUhNOTEzR25CNnM0YU0wY1NFYmcyK0pS?=
 =?utf-8?B?czdYNitlb3QrL1dWZ3RTT3hIRUc4aXR0c08rSTAwaW1KTzRNVHFnclNrYWVq?=
 =?utf-8?B?bTRxaTVLTWZmOHZYNVdDaW5JR2UxTkt2dWtqL2xTSWc5SEkyTDFLZVJnQWRJ?=
 =?utf-8?B?Z2JGZ2xiMVcxaWhGK055UENUcGVSQStWVk9MR1g5LzhxajF5SW41Y0FwTGFY?=
 =?utf-8?B?aDl3OU9GQWVRZGgwb1V5d3YwTCtrSVlCVTRZSWhxU3o5dk54ZytrZGVEdGNl?=
 =?utf-8?B?eTdPR1lOTGZTN3hDb0pON2kxWkxMMUo1NWJJem9KeExHVHl6MVNJT1hYejQ4?=
 =?utf-8?B?dDNYWVRJWi9zN2ZEMnVoNW9oSGdMMEt2SDJPN21mNUJXSEZDWEg1eE51ZjM4?=
 =?utf-8?B?b1JRUDBPbDhQN3NHbDVoN3pvalFMeGdHblkwSFYzUjlvZjNqZzBrbFBWRGpU?=
 =?utf-8?B?M2IyNnl2WVcxRzlqOXZJTEwrenAxZURwR0pER1E1RnZDUkIrdjhjQjJFM2wx?=
 =?utf-8?B?enNpRkludXo3aU1CRGgyU0xmOGl5MlZ5MEpQM1RMSDNoRGhlaWhYOGo1eG9G?=
 =?utf-8?B?S3ZRVi9jb1VwV3NVVkgzaWtVNTJHN2xHOWpwY2IvUzAxN3NUY0hxSGp6bWo0?=
 =?utf-8?B?VFg4Vy9tVHQrdW1ud0JPZnlFMXExcVkzVWw0SkJoOVQ0S1QyaVBWaDIrajdO?=
 =?utf-8?B?YkdGNGFud0JLbzg0UlUxU1lvbnRRV25Qa2M0VVRibWcxRWhWbG11VjlUZXEr?=
 =?utf-8?B?aDdYVHJGbFNVMkJ4NDl3YXRISm10N3J6d0JGNGRmTUtIRDBQbEZBc01KSUVO?=
 =?utf-8?B?U0t2NlF5S0RkcVhNbHNxMGVWN3Y0d2R6TU0zVFNheGJ0bGtjb2hTYWpHMWhU?=
 =?utf-8?B?Tlh2U2VqTUZYK3Q2SktJMk8xUG53N3U1V2RENW1ZUm5PRm9GYnpiL3IrYW5q?=
 =?utf-8?B?RlE1ZGIrTlpzYTFkRlkrVnZjSUZaN2lHdHhQenhqNUNuc3J4Q1J6M2hUTVl0?=
 =?utf-8?B?NFU5K2VPTG1xYVdhY0JTeXhkRGR1eXJlaDZGb0lkUTk1WlFGay9VVHU2cHRQ?=
 =?utf-8?B?UG03WjVUMkU2Mm13WC9rUWpBbTVnUS9NVEZSS2VpZWtGTDA0RlNhSEVSRjc2?=
 =?utf-8?B?eUpjUWhoL0NmRWFoUTJBWXhBQ1FkNkhzcFJHaWxKR3ptWFRISU9KbUZCTFZa?=
 =?utf-8?B?bTl3bzVraUFXRXM1UDlJNGpjdFRScDNubGpHdENNZklUdTVaVkxFemo5cFU5?=
 =?utf-8?B?YktUTVNPM3R1aDhWU242TXM1T2F4aGNXTTQyaVFXLzIrOVhRcHYzZWswZ3gr?=
 =?utf-8?B?bVlqbmFZeEJ6WDFzUDVyTlczU01nY3JpQkRKdXRyeVFveXIxdk5BUkhUMWRu?=
 =?utf-8?B?TW5aN0hDeU9pUGttbXpHQ1pGZGNsMG5QMWlDU3NzS2o0Q3lvRzJGR1lzcVdq?=
 =?utf-8?B?N0JKQ0JRTXFjUVVZamFLL2hIUk9mdTJMTmhiL2k1NnFEWUEvdjJReVNHSUFX?=
 =?utf-8?B?OCtiT1FlZjdMTUJ3YkRtZE5Sbk15aUxqRGQwYUlLRnNUSDNPVUhxY0dnV09L?=
 =?utf-8?B?V0FHU2JhZVlPZG1QK29GOStwcHcrYkpwd2xKWkRvenVYcFdSTm1EeUtOblZ4?=
 =?utf-8?B?cDhhQmFZWXhhbUNucjd3VGYxcDFGbUpMbTMvckRRWHVWNXF1QmJpRVE3dGNO?=
 =?utf-8?B?UURLVEtIZ05hYnBVTHFvb3ltNm1MRnIvVWI0aWhLMUJ0LzNTZ04xMVBIZWhG?=
 =?utf-8?B?Z0pjOEZwejZMR0g2T3FhZDdtQ0M1VTNXZ2JWcHdYQ2ZNSS9FeG5BZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <103E68173ABD1C42AC147B40C748F861@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39cb4ba2-65e4-4832-847e-08d9e4ad1b9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 11:30:39.1947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: He0gxxoNN0afukxn+wknHgTRf9xl4hEMPd1Qq6/a5O+ROUj6lwdJ7hZc903xiGJOfpRayUCcyaumOyG6ECw10uoh1+o8nvp+jY1qFMUvgN5IyJn91lOFlnUl+HxtuUSG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0301MB2311
X-Proofpoint-GUID: G8FFskeVm9Ve0Wnf5OrWlqezPgVW9fqe
X-Proofpoint-ORIG-GUID: G8FFskeVm9Ve0Wnf5OrWlqezPgVW9fqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310077

DQoNCk9uIDMxLjAxLjIyIDEzOjI3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IEphbiAzMSwgMjAyMiBhdCAxMTowNDoyOUFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEhpLCBKYW4hDQo+Pg0KPj4gT24gMzEuMDEuMjIgMTI6NTQsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+IE9uIDMxLjAxLjIwMjIgMTE6NDAsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4+PiBPbiAzMS4wMS4yMiAxMTo0NywgT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gd3JvdGU6DQo+Pj4+PiBIaSwgUm9nZXIhDQo+Pj4+Pg0KPj4+Pj4gT24gMTIuMDEuMjIgMTQ6
MzUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+ICtzdGF0aWMgdm9pZCBndWVzdF9y
b21fd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+
Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgdmFsLCB2b2lkICpk
YXRhKQ0KPj4+Pj4+PiArew0KPj4+Pj4+PiArfQ0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICtzdGF0aWMg
dWludDMyX3QgZ3Vlc3Rfcm9tX3JlYWQoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2ln
bmVkIGludCByZWcsDQo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9p
ZCAqZGF0YSkNCj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4gKyAgICByZXR1cm4gMHhmZmZmZmZmZjsNCj4+
Pj4+Pj4gK30NCj4+Pj4+PiBUaGVyZSBzaG91bGQgYmUgbm8gbmVlZCBmb3IgdGhvc2UgaGFuZGxl
cnMuIEFzIHNhaWQgZWxzZXdoZXJlOiBmb3INCj4+Pj4+PiBndWVzdHMgcmVnaXN0ZXJzIG5vdCBl
eHBsaWNpdGx5IGhhbmRsZWQgc2hvdWxkIHJldHVybiB+MCBmb3IgcmVhZHMgYW5kDQo+Pj4+Pj4g
ZHJvcCB3cml0ZXMsIHdoaWNoIGlzIHdoYXQgeW91IGFyZSBwcm9wb3NpbmcgaGVyZS4NCj4+Pj4+
IFllcywgeW91IGFyZSByaWdodDogSSBjYW4gc2VlIGluIHZwY2lfcmVhZCB0aGF0IHdlIGVuZCB1
cCByZWFkaW5nIH4wIGlmIG5vDQo+Pj4+PiBoYW5kbGVyIGV4aXN0cyAod2hpY2ggaXMgd2hhdCBJ
IGRvIGhlcmUgd2l0aCBndWVzdF9yb21fcmVhZCkuIEJ1dCBJIGFtIG5vdCB0aGF0DQo+Pj4+PiBz
dXJlIGFib3V0IHRoZSBkcm9wcGVkIHdyaXRlczoNCj4+Pj4+DQo+Pj4+PiB2b2lkIHZwY2lfd3Jp
dGUocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwN
Cj4+Pj4+ICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgZGF0YSkN
Cj4+Pj4+IHsNCj4+Pj4+ICAgICDCoMKgwqAgdW5zaWduZWQgaW50IGRhdGFfb2Zmc2V0ID0gMDsN
Cj4+Pj4+DQo+Pj4+PiBbc25pcF0NCj4+Pj4+DQo+Pj4+PiAgICAgwqDCoMKgIGlmICggZGF0YV9v
ZmZzZXQgPCBzaXplICkNCj4+Pj4+ICAgICDCoMKgwqDCoMKgwqDCoCAvKiBUYWlsaW5nIGdhcCwg
d3JpdGUgdGhlIHJlbWFpbmluZy4gKi8NCj4+Pj4+ICAgICDCoMKgwqDCoMKgwqDCoCB2cGNpX3dy
aXRlX2h3KHNiZGYsIHJlZyArIGRhdGFfb2Zmc2V0LCBzaXplIC0gZGF0YV9vZmZzZXQsDQo+Pj4+
PiAgICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGEgPj4g
KGRhdGFfb2Zmc2V0ICogOCkpOw0KPj4+Pj4NCj4+Pj4+IHNvIGl0IGxvb2tzIGxpa2UgZm9yIHRo
ZSB1bi1oYW5kbGVkIHdyaXRlcyB3ZSBzdGlsbCByZWFjaCB0aGUgSFcgcmVnaXN0ZXIuDQo+Pj4+
PiBDb3VsZCB5b3UgcGxlYXNlIHRlbGwgaWYgdGhlIGNvZGUgYWJvdmUgbmVlZHMgaW1wcm92ZW1l
bnQgKGxpa2UgY2hlY2tpbmcNCj4+Pj4+IGlmIHRoZSB3cml0ZSB3YXMgaGFuZGxlZCkgb3IgSSBz
dGlsbCBuZWVkIHRvIHByb3ZpZGUgYSB3cml0ZSBoYW5kbGVyLCBlLmcuDQo+Pj4+PiBndWVzdF9y
b21fd3JpdGUgaGVyZT8NCj4+Pj4gSG0sIGJ1dCB0aGUgc2FtZSBhcHBsaWVzIHRvIHRoZSByZWFk
cyBhcyB3ZWxsLi4uIEFuZCB0aGlzIGlzIG5vIHN1cnByaXNlLA0KPj4+PiBhcyBmb3IgdGhlIGd1
ZXN0cyBJIGNhbiBzZWUgdGhhdCBpdCBhY2Nlc3NlcyBhbGwgdGhlIGNvbmZpZ3VyYXRpb24gc3Bh
Y2UNCj4+Pj4gcmVnaXN0ZXJzIHRoYXQgSSBkb24ndCBoYW5kbGUuIFdpdGhvdXQgdGhhdCBJIHdv
dWxkIGhhdmUgZ3Vlc3RzIHVuYWJsZQ0KPj4+PiB0byBwcm9wZXJseSBzZXR1cCBhIFBDSSBkZXZp
Y2UgYmVpbmcgcGFzc2VkIHRocm91Z2guLi4gQW5kIHRoaXMgaXMgd2h5DQo+Pj4+IEkgaGF2ZSBh
IGJpZyBUT0RPIGluIHRoaXMgc2VyaWVzIGRlc2NyaWJpbmcgdW5oYW5kbGVkIHJlZ2lzdGVycy4N
Cj4+Pj4gU28sIGl0IHNlZW1zIHRoYXQgSSBkbyBuZWVkIHRvIHByb3ZpZGUgdGhvc2UgaGFuZGxl
cnMgd2hpY2ggSSBuZWVkIHRvDQo+Pj4+IGRyb3Agd3JpdGVzIGFuZCByZXR1cm4gfjAgb24gcmVh
ZHMuDQo+PiBSZXBseWluZyB0byBteXNlbGY6IGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIGhhdmUg
dnBjaV9pZ25vcmVkX3tyZWFkfHdyaXRlfQ0KPj4gdG8gaGFuZGxlIGRlZmF1bHRzIGlmLCB3aGVu
IHZwY2lfYWRkX3JlZ2lzdGVyIGlzIGNhbGxlZCwgdGhlIGhhbmRsZXINCj4+IHByb3ZpZGVkIGlz
IE5VTEwNCj4+PiBJdCBmZWVscyBsaWtlIHdlIGhhZCBiZWVuIHRoZXJlIGJlZm9yZTogRm9yIHlv
dXIgaW5pdGlhbCBwdXJwb3NlcyBpdCBtYXkNCj4+PiBiZSBmaW5lIHRvIGRvIGFzIHlvdSBzdWdn
ZXN0LCBidXQgYW55IHN1Y2ggcGF0Y2hlcyBzaG91bGQgY2FycnkgUkZDIHRhZ3MNCj4+PiBvciBh
bGlrZSB0byBpbmRpY2F0ZSB0aGV5J3JlIG5vdCBjb25zaWRlcmVkIHJlYWR5LiBPbmNlIHlvdSdy
ZSBhaW1pbmcNCj4+PiBmb3IgdGhpbmdzIHRvIGdvIGluLCBJIHRoaW5rIHRoZXJlJ3Mgbm8gZ29v
ZCB3YXkgYXJvdW5kIHdoaXRlLWxpc3RpbmcNCj4+PiB3aGF0IGd1ZXN0cyBtYXkgYWNjZXNzLiBZ
b3UgbWF5IGtub3cgdGhhdCB3ZSd2ZSBiZWVuIGJpdHRlbiBieSBzdGFydGluZw0KPj4+IG91dCB3
aXRoIGJsYWNrLWxpc3RpbmcgaW4gdGhlIHBhc3QsIGZpcnN0IGFuZCBmb3JlbW9zdCB3aXRoIHg4
NidlcyBNU1JzLg0KPj4gSSBhbHJlYWR5IGhhdmUgYSBiaWcgVE9ETyBwYXRjaCBkZXNjcmliaW5n
IHRoZSBpc3N1ZS4gRG8geW91IHdhbnQNCj4+IGl0IHRvIGhhdmUgYSBsaXN0IG9mIGhhbmRsZXJz
IHRoYXQgd2Ugc3VwcG9ydCBhcyBvZiBub3c/IFdoYXQgc29ydCBvZg0KPj4gd2hpbGUvYmxhY2sg
bGlzdCB3b3VsZCB5b3UgZXhwZWN0Pw0KPj4gSSBkbyB1bmRlcnN0YW5kIHRoYXQgd2UgZG8gbmVl
ZCBwcm9wZXIgaGFuZGxpbmcgZm9yIGFsbCB0aGUgUENJIHJlZ2lzdGVycw0KPj4gYW5kIGNhcGFi
aWxpdGllcyBsb25nIHRlcm0sIGJ1dCB0aGlzIGNhbid0IGJlIGRvbmUgYXQgdGhlIG1vbWVudCB3
aGVuDQo+PiB3ZSBoYXZlIG5vdGhpbmcgd29ya2luZyBhdCBhbGwuIFJlcXVlc3RpbmcgcHJvcGVy
IGhhbmRsaW5nIG5vdyB3aWxsDQo+PiB0dXJuIHRoaXMgc2VyaWVzIGludG8gYSBodWdlIGFtb3Vu
dCBvZiBjb2RlIGFuZCB1bmRlZmluZWQgdGltZSBmcmFtZS4NCj4gV2Ugc2hvdWxkIGF0IGxlYXN0
IG1ha2Ugc3VyZSB0aGUgY29kZSBhZGRlZCBub3cgZG9lc24ndCBuZWVkIHRvIGJlDQo+IGNoYW5n
ZWQgaW4gdGhlIGZ1dHVyZSB3aGVuIHRoZSBkZWZhdWx0IGlzIHN3aXRjaGVkLiBJZiB5b3UgZG9u
J3QNCj4gd2FudCB0byBzd2l0Y2ggdGhlIGRlZmF1bHQgaGFuZGxpbmcgZm9yIGRvbVVzIHRvIGln
bm9yZSB3cml0ZXMgYW5kDQo+IHJldHVybiB+MCBmcm9tIHJlYWRzIHRvIHVuaGFuZGxlZCByZWdp
c3RlcnMgcmlnaHQgbm93IHlvdSBzaG91bGQga2VlcA0KPiB0aGUgcGF0Y2hlcyB0aGF0IGFkZCB0
aGUgaWdub3JlIGhhbmRsZXJzIHRvIHRoZSBlbmQgb2YgdGhlIHNlcmllcyBhbmQNCj4gbWFyayB0
aGVtIGFzICdIQUNLJyBvciBzb21lIHN1Y2ggaW4gb3JkZXIgdG8gbm90aWNlIHRoZXkgYXJlIGp1
c3QNCj4gdXNlZCBmb3IgdGVzdGluZyBwdXJwb3Nlcy4NCk9yIGZvciBhbGwgdGhlIHJlZ2lzdGVy
cyB0aGF0IEkgZG8gd2FudCB0aGUgd3JpdGVzIHRvIGJlIHJlamVjdGVkIGFuZA0KcmVhZHMgcmV0
dXJuIH4wIEkgY2FuIHBhc3MgTlVMTCB3aGlsZSBjYWxsaW5nIHZwY2lfYWRkX3JlZ2lzdGVyLA0K
c28gdGhlIGZvbGxvd2luZyB3b3JrczoNCg0KaW50IHZwY2lfYWRkX3JlZ2lzdGVyKHN0cnVjdCB2
cGNpICp2cGNpLCB2cGNpX3JlYWRfdCAqcmVhZF9oYW5kbGVyLA0KIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2cGNpX3dyaXRlX3QgKndyaXRlX2hhbmRsZXIsIHVu
c2lnbmVkIGludCBvZmZzZXQsDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHVuc2lnbmVkIGludCBzaXplLCB2b2lkICpkYXRhKQ0Kew0KW3NuaXBdDQogwqDCoMKg
IHItPnJlYWQgPSByZWFkX2hhbmRsZXIgPzogdnBjaV9pZ25vcmVkX3JlYWQ7DQogwqDCoMKgIHIt
PndyaXRlID0gd3JpdGVfaGFuZGxlciA/OiB2cGNpX2lnbm9yZWRfd3JpdGU7DQp3aGljaCBkb2Vz
IHdoYXQgd2Ugd2FudC4NCj4gVGhhbmtzLCBSb2dlci4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

