Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCCA4B5144
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:13:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271878.466591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbAK-0006vy-Ck; Mon, 14 Feb 2022 13:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271878.466591; Mon, 14 Feb 2022 13:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbAK-0006tN-9D; Mon, 14 Feb 2022 13:13:16 +0000
Received: by outflank-mailman (input) for mailman id 271878;
 Mon, 14 Feb 2022 13:13:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsDI=S5=epam.com=prvs=4044e07e7c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJbAI-0006t9-NG
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:13:14 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc259c2e-8d97-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:13:12 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21ECmtv7023768;
 Mon, 14 Feb 2022 13:13:08 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e7q5h05fd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 13:13:08 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB5052.eurprd03.prod.outlook.com (2603:10a6:10:7e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 13:13:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 13:13:05 +0000
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
X-Inumbo-ID: dc259c2e-8d97-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4Cu/3Ep5Qlf3DuUFdTQUv81hJXu3HtAIgyQvYkEKMMYQAjj8oRwrxkwZRSEN6Fv42dzQTr9+8PGCYczhD+AHf5VTEfKNx2ZxRXBwTNYFM96XwIi+aHqv96s8QgEHXhK8Yx88JTHzAtiHfcGbp4qbj261ZHfS7lcwoKJfwXOhxZR0Je7weVSY+fzy0eCRndc8cv2ABTHx1AcKiPrLWPjLG4fMVmp/ZXu54WVXYdxKd/E17DYgRWnwbcN+6s6GAC3G2w6Zq+xF0CtzY3C/KBrePkaeZ5h8cft81tQBb3CR56Sed+xU7HcvuESJt5i/U6Z1fNPPSesg8BwmxeiVdsArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtpnDP6mG53v9dhdVWrFUPfYugizhk9vgUfzjOG5g7k=;
 b=ZT8YdJGIXIXHs3d/FwY/yQLlJlo+doIyEiMJ93IhGMQH8hPIKdMT0AGTO1awF3QQebvyup2elEzx7UeXkFK3UTTEx+n9EpxkNt5QKE8FhBv+Xrjw03NNW96MK7Bpp6hUxeJPuSXeDQkFoPdq31u+ryXwW0fVGVc0LvmbOMTs3RjNteIhZct4gM6RoHm0ILjYKEJij8izcKBSGsfxmxWizsEVOb5Ahr5SEeqNbDlET5uVJUBawk504hdUTyHv7Bs6XvJdHYXEVXdI8rQaQLK8WHS7BEASqqT3r/eXOizVGPMs0jYfxmNzyrqqs3HB/VFrT3jz/6Lg39B2AQfEeqGEeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtpnDP6mG53v9dhdVWrFUPfYugizhk9vgUfzjOG5g7k=;
 b=f5G6iChOO7r8NmboWmKpejommPKu2S5DA4A0SQDh6HkoUHHsBuzQh411gIItBUZuZI+2RbTNv/VbwEZYKg3dkXoxm7PviOlnaLXDO6R1HX1hK+MY9yyNJoYXpCk3qeocrm6fOBDBgKu03iHMKRcL+IuzkCSDs9LtXjGqC987OWcRpKSk1EYL5003S9UuXMA9CRH+xdkFf/LJrLZ1K/dSC8YAdlv8/MJqjLKJsp8UvOXjtG6a+aa6dQ5cufKpYG9rnHdqqY+fLKqXfyUyhuMwloRG2Ydlj8gaJS+zoQoYTcgzBgEMEOtrh3t6JYG0Yrc+xy9rE5YFhm+AkjeDkV/Vlg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHYHboQT3cBWYI1/EGunE7hOwop6ayM95MAgAD+qQCAAEaDAIAElIcAgAAQEwCAAAV1AIAABOQAgAABMICAAALZgIAAAzmAgAAWXYCAAARtAA==
Date: Mon, 14 Feb 2022 13:13:05 +0000
Message-ID: <6ccc7add-c13e-555f-b341-ce37118746e5@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
 <YgowIg5MvTaf2zsR@Air-de-Roger>
 <d8389a90-00c8-b34a-8488-b0f3fc5bde1b@epam.com>
 <Ygo40L4dMPJjZKRF@Air-de-Roger>
 <746860aa-c403-1eca-0a75-587c5d10c8c2@epam.com>
 <Ygo8M3Y6BLzljn15@Air-de-Roger>
 <114b8578-ee13-b67d-e282-d060187ef509@epam.com>
 <06baf0c8-d7d2-50b8-ea8f-1d422ceac728@suse.com>
In-Reply-To: <06baf0c8-d7d2-50b8-ea8f-1d422ceac728@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0910f785-3592-4d51-6ce1-08d9efbbbcb5
x-ms-traffictypediagnostic: DB7PR03MB5052:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB50526A1B08886EBCCD4E2F18E7339@DB7PR03MB5052.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lp5BRE7vlqdeOiray85JPlleec8frU4vsvIRXmulxLOY23xblscQa2wo+/DlC8zNhGHXka0RBWG2nvWKRGKeW9U92l9C/QxcW+efdSeX/NNXgNWnecn2ntJ6HUmD4x9EjwYy76euwwpvf3J1rfaqrjOJ7/634wj9b0HebMhq2DHUP/P9egUyyi+4KZmqlXJ7npllvogxIrZn6K6TfwwCjLECRGMmJDXckigB4R4ROFwKZjK8+bMfx8iIdx+BMNi3GLnkj+yQY9jFxXDFD8spORNEUXqVslZYr/dQBFkpL8yrsysoDHB9LJUujmsecVK4uKgHOYEinzGh3yELSzcICNmygMZkaP0l5AZxmx7XKdBiCvvQLqAC6x0dMia7jTBVEYAqTCOmf0lTCohByCOCuvDr/5RcecWmYbOMO6KBGjm2JEHKVfoGPgpjszBvzW7HnGte2mB+NvwPReChMQI2BKcBuA68Wds3pG+db05tJH3VJUNFF3u0lDNRvDDxUDjs7INyUm4hkDfwzSA08bPl0jHXCF0a6FOg1FzSpUrgm3Ty4nAIkTxh4XkJcp1tfGrRZzWcuCpV63s47d2fcSn1laS6suyzjW9DMz67beYzFhiL9y7J2EFTdmj9nrcFkPauEUT1BK4T+maH4wp5SSKc/nbw2RbOfxOcOE1BLDxHsXTelkxMc0eaM2wu2ip/9kQ3L1aSGzsnzuRadWLGd193EKqtvFOYASHaGCRTIfjL6qN51l73AJbSZ/5u6SnfZ85o
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(66946007)(66446008)(38100700002)(5660300002)(76116006)(64756008)(66476007)(66556008)(6506007)(71200400001)(86362001)(26005)(6916009)(8936002)(8676002)(53546011)(38070700005)(91956017)(6486002)(508600001)(31696002)(186003)(4326008)(316002)(122000001)(36756003)(83380400001)(2616005)(107886003)(31686004)(55236004)(6512007)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MlAxaWpVb3VwOEdiVVE3ck9maXpLbDc4M1dwakkvbFc0TnJIaitKZVNkZWx5?=
 =?utf-8?B?T2pnemVYd1Ezbi9VZHM1VS90eG9Dc1BWYWNRczNKQ1ErNkJ4a1dITFhyL1ZB?=
 =?utf-8?B?VGR6NzFxWWVxMjJnRGRSdHh5eklpdW1SYTlwR1NWNC9aNENWRFd2VURRM1ll?=
 =?utf-8?B?UDhNSDFTTEhveGhpWXVJTW9KT2k3QUhTT0ZGZFFYS2QrK1d6WWR2TWtGWDdx?=
 =?utf-8?B?ajgzVjAzbDN6dGxZeTd6VVlidUd2T0x5YnZLVVVZb1dxbTRIRlZYVHlWZU54?=
 =?utf-8?B?WDJwSWNDMjdjUTRnODJZbFBWTDhtaTVjVklqSnhzL2FjYTFJT2FTaW1Sb2xO?=
 =?utf-8?B?U09XZFh1cDFwZ2pZblJoQnAwY3BQdHQ2Yi82MjhORmhoQk4vQUJxQXhzc1FT?=
 =?utf-8?B?WWhkNzJIZ0dqYXdwTWVic0hIdUxyRStqRFpvaWo2YlZkRDRhQjhyMUxsRGNH?=
 =?utf-8?B?VjlhY2JxOC9ZR1hTc0VQUUROWGRtQkExSmFwcU9BbEpyYWFXV0NPaUUzWGsz?=
 =?utf-8?B?aFVHRmVrTlBnTEw0UUdESlVpVHFiZkE0d2E5bjhUSkxpZE5XNjdjRkx5M1BE?=
 =?utf-8?B?VE4vYlhLcUplT2RrRE9SbUFWbUpIb1hBVXhCa0ZFckl0dTcxaWpidmQ5TWt6?=
 =?utf-8?B?YnlVYzFtbjkrdEN5UXJmQmdnYVNQUUorZnN1QUxBOEQzcVZOTE5KWEpSZmp3?=
 =?utf-8?B?ME15T3k2cnJkMkh5MjNucTluZjc5MzlZcWdNQlBENDU2eDN0aGFNbFB4eUpU?=
 =?utf-8?B?ZHNWcXVWWXdYVlFKMmNzRDJXeFJNbnZhRnMwOFlMU3g0bWNvalErQ1U5aGlE?=
 =?utf-8?B?b0FiLzBtWGg5aXRxa2Y0NWlRaVJmcTNIK2pJM1RxK3pTbWtPQTNOZFIrZDVS?=
 =?utf-8?B?K1k0SzhpQkNCOEhraEYxdWRuMEkyVW5CdDFiQ2pkNm9nT1lOcFRROWRCWmFn?=
 =?utf-8?B?amxERXFmbC9FZnVnaU0yaUdySUNVMlN3V0RRT0J5Nm9FU3B0bWxTUUIzazBU?=
 =?utf-8?B?d01EUzlCYXhxOTN0VHhEanVxOXREMFVRRUpta3VOUXJpTjhhOVZodHlLL0lt?=
 =?utf-8?B?QzhWM0lrMjdMOStRa09EMEpCVWNkbDBQQ2NPb0ZocGk5MmpMVWVCbEtHWlBB?=
 =?utf-8?B?aVlrZzJtOUd1dE55ZlBLUWlrSkF5SnhRclZJS05zQk5jSzJ0UEhCT21Oa3Y0?=
 =?utf-8?B?aVo4Ymx2bWZJc0NSWExwamVRSmUrci8ycDQ0TnRNSk9WenY3Q1J6WjEyOGJS?=
 =?utf-8?B?aUpCb3h2WnMxMCtJQnNMQ1dGOHFjL2ljNnpENC9JVm5XaGlZaVRVbWxld1ZF?=
 =?utf-8?B?K2JMbmgwZElKZHdaZW9jTGtUK0pudmVmOTI4TEdtV1JjLzlsT0ZjOXR4L3pE?=
 =?utf-8?B?UXpScGs4SEpjZ1lDZnFoVnJUekYrNXREY1pFdWhoaGxRMFYwZ3hEd3VGOHFk?=
 =?utf-8?B?a0UrczN3K0RIZ0YybXpUcy9WODcvaWswdVIxZGN2Sk5LMnBNVlZtTE5idHJy?=
 =?utf-8?B?ZFVjbGNuSXJzR1NsSTBKSVRGVk5KSUNMYk1pWldQQjgyY3dqVm1pdis1UFNE?=
 =?utf-8?B?YytscEI0U29NU2dackdFR0NraitEby9pS3RtNGl2bWxhSGlXYXJGcmtvVzg2?=
 =?utf-8?B?bHMybUhvejRsNjAzTWFDTUI1MWV6V1BoUUZYYWRlaVE4T3pYQUF1MnhucUhY?=
 =?utf-8?B?TFJsQWVJYStXOHRqV3VZUzNieXpEWG96Q210VzVSa2NyTzNZNVIwRTJOaGRi?=
 =?utf-8?B?TytVRXFXL21wdndnZ3hwVUpsUE8zZlFmWnNCd0s1QTVxRHNiem1tMG1FUEIx?=
 =?utf-8?B?cXJ3aFpmVWM1Y3E4bC9Md2YrTWJ1OVRSYWhuc3BBN2N1MmNhajF5T0ZJckVP?=
 =?utf-8?B?ZnhsenJxRmlpN3lmejVIS1lmTGwrRjE4NitiTTVOZDBocWdDcWdKM1Vsdjh4?=
 =?utf-8?B?d25yWmRsNjFqNk5HSlZRMXh3MnBTdDRkK3llTHpHTEtXckZCSXRYcXZCWGw1?=
 =?utf-8?B?R3ZiNThvK2twMmw2eGVodGVxaWtnUDhXT0VzZ0p4ZWF5c1UwTjN2OU1OZnhM?=
 =?utf-8?B?Nk05K0hvYS9DRU0vV2o4V2E4VksxWC9wSDVoVXNqdGtvT3NzalhWSWNZVnMx?=
 =?utf-8?B?dld4RVh5MDNGT3hSOEJUQmJ6NEdsRmJHUXdjUUN4aTV0TmphSDU1eGNXSFRs?=
 =?utf-8?B?akhNQWh4R0l6YnM5M3FnT2RRQ2ExbWplN0VhNG5GK2d0MGhId0R6aDdYczIr?=
 =?utf-8?B?eGFtVXFoY2hQUENNMndnTm5tVjdjZFY2TzJKUjI2Tkp0NXVvK1d3cHViTG1o?=
 =?utf-8?B?azRtWnhCV3hucm9xYnFRREJpWlhYR3RXZmFmWmtoT3hnMFhxT3pWdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BFDE3265BE7CB4D83FE3625B2623D6A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0910f785-3592-4d51-6ce1-08d9efbbbcb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 13:13:05.1846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Gh/vpGN+pdreNZDr4l1UQ89G0Qbo9D0ht/Y6rp4evsq4SiKSLCP6lx6Aos/vZ3c2VQJCu6YA5UfTXhe1S4yBv3wChDUQEAzgXrhsvyjc92xZj/fQ/15ZdJGlJ6nijif
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB5052
X-Proofpoint-GUID: n0rfuGn5DvtMlYYmL6xZw_H-KpeXsZZ7
X-Proofpoint-ORIG-GUID: n0rfuGn5DvtMlYYmL6xZw_H-KpeXsZZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_06,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140081

DQoNCk9uIDE0LjAyLjIyIDE0OjU3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTQuMDIuMjAy
MiAxMjozNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMTQuMDIu
MjIgMTM6MjUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gTW9uLCBGZWIgMTQsIDIw
MjIgYXQgMTE6MTU6MjdBTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+
Pj4+IE9uIDE0LjAyLjIyIDEzOjExLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4gT24g
TW9uLCBGZWIgMTQsIDIwMjIgYXQgMTA6NTM6NDNBTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6DQo+Pj4+Pj4gT24gMTQuMDIuMjIgMTI6MzQsIFJvZ2VyIFBhdSBNb25uw6kg
d3JvdGU6DQo+Pj4+Pj4+IE9uIE1vbiwgRmViIDE0LCAyMDIyIGF0IDA5OjM2OjM5QU0gKzAwMDAs
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMTEuMDIuMjIgMTM6
NDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+Pj4+ICAg
ICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBtc2l4LT5tYXhfZW50cmllczsgaSsrICkNCj4+Pj4+
Pj4+Pj4+PiAgICAgICAgICAgIHsNCj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgdnBjaV9tc2l4X2VudHJ5ICplbnRyeSA9ICZtc2l4LT5lbnRyaWVzW2ldOw0KPj4+Pj4+
Pj4+Pj4gU2luY2UgdGhpcyBmdW5jdGlvbiBpcyBub3cgY2FsbGVkIHdpdGggdGhlIHBlci1kb21h
aW4gcndsb2NrIHJlYWQNCj4+Pj4+Pj4+Pj4+IGxvY2tlZCBpdCdzIGxpa2VseSBub3QgYXBwcm9w
cmlhdGUgdG8gY2FsbCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMNCj4+Pj4+Pj4+Pj4+IHdoaWxl
IGhvbGRpbmcgc3VjaCBsb2NrIChjaGVjayBiZWxvdykuDQo+Pj4+Pj4+Pj4+IFlvdSBhcmUgcmln
aHQsIGFzIGl0IGlzIHBvc3NpYmxlIHRoYXQ6DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IHByb2Nl
c3NfcGVuZGluZ19zb2Z0aXJxcyAtPiB2cGNpX3Byb2Nlc3NfcGVuZGluZyAtPiByZWFkX2xvY2sN
Cj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gRXZlbiBtb3JlLCB2cGNpX3Byb2Nlc3NfcGVuZGluZyBt
YXkgYWxzbw0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiByZWFkX3VubG9jayAtPiB2cGNpX3JlbW92
ZV9kZXZpY2UgLT4gd3JpdGVfbG9jaw0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBpbiBpdHMgZXJy
b3IgcGF0aC4gU28sIGFueSBpbnZvY2F0aW9uIG9mIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcw0K
Pj4+Pj4+Pj4+PiBtdXN0IG5vdCBob2xkIGQtPnZwY2lfcndsb2NrIGF0IGxlYXN0Lg0KPj4+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4+PiBBbmQgYWxzbyB3ZSBuZWVkIHRvIGNoZWNrIHRoYXQgcGRldi0+dnBj
aSB3YXMgbm90IHJlbW92ZWQNCj4+Pj4+Pj4+Pj4gaW4gYmV0d2VlbiBvciAqcmUtY3JlYXRlZCoN
Cj4+Pj4+Pj4+Pj4+IFdlIHdpbGwgbGlrZWx5IG5lZWQgdG8gcmUtaXRlcmF0ZSBvdmVyIHRoZSBs
aXN0IG9mIHBkZXZzIGFzc2lnbmVkIHRvDQo+Pj4+Pj4+Pj4+PiB0aGUgZG9tYWluIGFuZCBhc3Nl
cnQgdGhhdCB0aGUgcGRldiBpcyBzdGlsbCBhc3NpZ25lZCB0byB0aGUgc2FtZQ0KPj4+Pj4+Pj4+
Pj4gZG9tYWluLg0KPj4+Pj4+Pj4+PiBTbywgZG8geW91IG1lYW4gYSBwYXR0ZXJuIGxpa2UgdGhl
IGJlbG93IHNob3VsZCBiZSB1c2VkIGF0IGFsbA0KPj4+Pj4+Pj4+PiBwbGFjZXMgd2hlcmUgd2Ug
bmVlZCB0byBjYWxsIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcz8NCj4+Pj4+Pj4+Pj4NCj4+Pj4+
Pj4+Pj4gcmVhZF91bmxvY2sNCj4+Pj4+Pj4+Pj4gcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzDQo+
Pj4+Pj4+Pj4+IHJlYWRfbG9jaw0KPj4+Pj4+Pj4+PiBwZGV2ID0gcGNpX2dldF9wZGV2X2J5X2Rv
bWFpbihkLCBzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2Zm4pOw0KPj4+Pj4+Pj4+PiBpZiAo
IHBkZXYgJiYgcGRldi0+dnBjaSAmJiBpc190aGVfc2FtZV92cGNpKHBkZXYtPnZwY2kpICkNCj4+
Pj4+Pj4+Pj4gPGNvbnRpbnVlIHByb2Nlc3Npbmc+DQo+Pj4+Pj4+Pj4gU29tZXRoaW5nIGFsb25n
IHRob3NlIGxpbmVzLiBZb3UgbGlrZWx5IG5lZWQgdG8gY29udGludWUgaXRlcmF0ZSB1c2luZw0K
Pj4+Pj4+Pj4+IGZvcl9lYWNoX3BkZXYuDQo+Pj4+Pj4+PiBIb3cgZG8gd2UgdGVsbCBpZiBwZGV2
LT52cGNpIGlzIHRoZSBzYW1lPyBKYW4gaGFzIGFscmVhZHkgYnJvdWdodA0KPj4+Pj4+Pj4gdGhp
cyBxdWVzdGlvbiBiZWZvcmUgWzFdIGFuZCBJIHdhcyBhYm91dCB0byB1c2Ugc29tZSBJRCBmb3Ig
dGhhdCBwdXJwb3NlOg0KPj4+Pj4+Pj4gcGRldi0+dnBjaS0+aWQgPSBkLT52cGNpX2lkKysgYW5k
IHRoZW4gd2UgdXNlIHBkZXYtPnZwY2ktPmlkwqAgZm9yIGNoZWNrcw0KPj4+Pj4+PiBHaXZlbiB0
aGlzIGlzIGEgZGVidWcgbWVzc2FnZSBJIHdvdWxkIGJlIE9LIHdpdGgganVzdCBkb2luZyB0aGUN
Cj4+Pj4+Pj4gbWluaW1hbCBjaGVja3MgdG8gcHJldmVudCBYZW4gZnJvbSBjcmFzaGluZyAoaWU6
IHBkZXYtPnZwY2kgZXhpc3RzKQ0KPj4+Pj4+PiBhbmQgdGhhdCB0aGUgcmVzdW1lIE1TSSBlbnRy
eSBpcyBub3QgcGFzdCB0aGUgY3VycmVudCBsaW1pdC4gT3RoZXJ3aXNlDQo+Pj4+Pj4+IGp1c3Qg
cHJpbnQgYSBtZXNzYWdlIGFuZCBtb3ZlIG9uIHRvIHRoZSBuZXh0IGRldmljZS4NCj4+Pj4+PiBB
Z3JlZSwgSSBzZWUgbm8gYmlnIGlzc3VlIChwcm9iYWJseSkgaWYgd2UgYXJlIG5vdCBhYmxlIHRv
IHByaW50DQo+Pj4+Pj4NCj4+Pj4+PiBIb3cgYWJvdXQgdGhpcyBvbmU6DQo+Pj4+Pj4NCj4+Pj4+
PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyBiL3hlbi9kcml2ZXJzL3Zw
Y2kvaGVhZGVyLmMNCj4+Pj4+PiBpbmRleCA4MDlhNmI0NzczZTEuLjUwMzczZjA0ZGE4MiAxMDA2
NDQNCj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4gKysrIGIv
eGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+IEBAIC0xNzEsMTAgKzE3MSwzMSBAQCBz
dGF0aWMgaW50IF9faW5pdCBhcHBseV9tYXAoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0
IHBjaV9kZXYgKnBkZXYsDQo+Pj4+Pj4gICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCByYW5nZXNldCAqbWVtLCB1aW50MTZf
dCBjbWQpDQo+Pj4+Pj4gICAgIMKgew0KPj4+Pj4+ICAgICDCoMKgwqDCoCBzdHJ1Y3QgbWFwX2Rh
dGEgZGF0YSA9IHsgLmQgPSBkLCAubWFwID0gdHJ1ZSB9Ow0KPj4+Pj4+ICvCoMKgwqAgcGNpX3Ni
ZGZfdCBzYmRmID0gcGRldi0+c2JkZjsNCj4+Pj4+PiAgICAgwqDCoMKgwqAgaW50IHJjOw0KPj4+
Pj4+DQo+Pj4+Pj4gKyBBU1NFUlQocndfaXNfd3JpdGVfbG9ja2VkKCZwZGV2LT5kb21haW4tPnZw
Y2lfcndsb2NrKSk7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICAgICDCoMKgwqDCoCB3aGlsZSAoIChyYyA9
IHJhbmdlc2V0X2NvbnN1bWVfcmFuZ2VzKG1lbSwgbWFwX3JhbmdlLCAmZGF0YSkpID09IC1FUkVT
VEFSVCApDQo+Pj4+Pj4gK8KgwqDCoCB7DQo+Pj4+Pj4gKw0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCAvKg0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFz
IG1heSB0cmlnZ2VyIHZwY2lfcHJvY2Vzc19wZW5kaW5nIHdoaWNoDQo+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqAgKiBtYXkgbmVlZCB0byBhY3F1aXJlIHBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2sg
aW4gcmVhZCBtb2RlLg0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICovDQo+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHdyaXRlX3VubG9jaygmcGRldi0+ZG9tYWluLT52cGNpX3J3bG9jayk7DQo+Pj4+
Pj4gICAgIMKgwqDCoMKgwqDCoMKgwqAgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7DQo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHdyaXRlX2xvY2soJnBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2sp
Ow0KPj4+Pj4+ICsNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyogQ2hlY2sgaWYgcGRldiBzdGls
bCBleGlzdHMgYW5kIHZQQ0kgd2FzIG5vdCByZW1vdmVkIG9yIHJlLWNyZWF0ZWQuICovDQo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKGQsIHNiZGYuc2Vn
LCBzYmRmLmJ1cywgc2JkZi5kZXZmbikgIT0gcGRldikNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoIHZwY2kgaXMgTk9UIHRoZSBzYW1lICkNCj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB7DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYyA9
IDA7DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+Pj4+Pj4gK8KgwqDCoCB9DQo+Pj4+Pj4gKw0K
Pj4+Pj4+ICAgICDCoMKgwqDCoCByYW5nZXNldF9kZXN0cm95KG1lbSk7DQo+Pj4+Pj4gICAgIMKg
wqDCoMKgIGlmICggIXJjICkNCj4+Pj4+PiAgICAgwqDCoMKgwqDCoMKgwqDCoCBtb2RpZnlfZGVj
b2RpbmcocGRldiwgY21kLCBmYWxzZSk7DQo+Pj4+Pj4NCj4+Pj4+PiBUaGlzIG9uZSBhbHNvIHdh
bnRzIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcyB0byBydW4gc28gaXQgKm1pZ2h0Kg0KPj4+Pj4+
IHdhbnQgcGRldiBhbmQgdnBjaSBjaGVja3MuIEJ1dCBhdCB0aGUgc2FtZSB0aW1lIGFwcGx5X21h
cCBydW5zDQo+Pj4+Pj4gYXQgKCBzeXN0ZW1fc3RhdGUgPCBTWVNfU1RBVEVfYWN0aXZlICksIHNv
IGRlZmVyX21hcCB3b24ndCBiZQ0KPj4+Pj4+IHJ1bm5pbmcgeWV0LCB0aHVzIG5vIHZwY2lfcHJv
Y2Vzc19wZW5kaW5nIGlzIHBvc3NpYmxlIHlldCAoaW4gdGVybXMNCj4+Pj4+PiBpdCBoYXMgc29t
ZXRoaW5nIHRvIGRvIHlldCkuIFNvLCBJIHRoaW5rIHdlIGp1c3QgbmVlZDoNCj4+Pj4+Pg0KPj4+
Pj4+ICAgICDCoMKgwqDCoMKgwqDCoCB3cml0ZV91bmxvY2soJnBkZXYtPmRvbWFpbi0+dnBjaV9y
d2xvY2spOw0KPj4+Pj4+ICAgICDCoMKgwqDCoMKgwqDCoCBwcm9jZXNzX3BlbmRpbmdfc29mdGly
cXMoKTsNCj4+Pj4+PiAgICAgwqDCoMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmcGRldi0+ZG9tYWlu
LT52cGNpX3J3bG9jayk7DQo+Pj4+Pj4NCj4+Pj4+PiBhbmQgdGhpcyBzaG91bGQgYmUgZW5vdWdo
DQo+Pj4+PiBHaXZlbiB0aGUgY29udGV4dCBhcHBseV9tYXAgaXMgY2FsbGVkIGZyb20gKGRvbTAg
c3BlY2lmaWMgaW5pdCBjb2RlKSwNCj4+Pj4+IHRoZXJlJ3Mgbm8gbmVlZCB0byBjaGVjayBmb3Ig
dGhlIHBkZXYgdG8gc3RpbGwgZXhpdHMsIG9yIHdoZXRoZXIgdnBjaQ0KPj4+Pj4gaGFzIGJlZW4g
cmVjcmVhdGVkLCBhcyBpdCdzIG5vdCBwb3NzaWJsZS4gSnVzdCBhZGQgYSBjb21tZW50IHRvDQo+
Pj4+PiBleHBsaWNpdGx5IG5vdGUgdGhhdCB0aGUgY29udGV4dCBvZiB0aGUgZnVuY3Rpb24gaXMg
c3BlY2lhbCwgYW5kIHRodXMNCj4+Pj4+IHRoZXJlJ3Mgbm8gcG9zc2liaWxpdHkgb2YgZWl0aGVy
IHRoZSBkZXZpY2Ugb3IgdnBjaSBnb2luZyBhd2F5Lg0KPj4+PiBEb2VzIGl0IHJlYWxseSBuZWVk
IHdyaXRlX3VubG9jay93cml0ZV9sb2NrIGdpdmVuIHRoZSBjb250ZXh0Py4uLg0KPj4+IEkgdGhp
bmsgaXQncyBiYWQgcHJhY3RpY2UgdG8gY2FsbCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMgd2hp
bGUNCj4+PiBob2xkaW5nIGFueSBsb2Nrcy4gVGhpcyBpcyBhIHZlcnkgc3BlY2lmaWMgY29udGV4
dCBzbyBpdCdzIGxpa2VseSBmaW5lDQo+Pj4gdG8gbm90IGRyb3AgdGhlIGxvY2ssIGJ1dCB3b3Vs
ZCBzdGlsbCBzZWVtIGluY29ycmVjdCB0byBtZS4NCj4+IE9rDQo+Pj4+IEkgdGhpbmsgaXQgZG9l
c24ndCBhcyB0aGVyZSBpcyBubyBjaGFuY2UgZGVmZXJfbWFwIGlzIGNhbGxlZCwgdGh1cw0KPj4+
PiBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMgLT4gdnBjaV9wcm9jZXNzX3BlbmRpbmcgLT4gcmVh
ZF9sb2NrDQo+Pj4gSW5kZWVkLCB0aGVyZSdzIG5vIGNoYW5jZSBvZiB0aGF0IGJlY2F1c2UgcHJv
Y2Vzc19wZW5kaW5nX3NvZnRpcnFzDQo+Pj4gd2lsbCBuZXZlciB0cnkgdG8gZG8gYSBzY2hlZHVs
aW5nIG9wZXJhdGlvbiB0aGF0IHdvdWxkIHJlc3VsdCBpbiBvdXINCj4+PiBjb250ZXh0IGJlaW5n
IHNjaGVkdWxlZCBvdXQuDQo+PiAgIMKgwqDCoCB3aGlsZSAoIChyYyA9IHJhbmdlc2V0X2NvbnN1
bWVfcmFuZ2VzKG1lbSwgbWFwX3JhbmdlLCAmZGF0YSkpID09IC1FUkVTVEFSVCApDQo+PiAgIMKg
wqDCoCB7DQo+PiAgIMKgwqDCoMKgwqDCoMKgIC8qDQo+PiAgIMKgwqDCoMKgwqDCoMKgwqAgKiBG
SVhNRTogR2l2ZW4gdGhlIGNvbnRleHQgYXBwbHlfbWFwIGlzIGNhbGxlZCBmcm9tIChkb20wIHNw
ZWNpZmljDQo+PiAgIMKgwqDCoMKgwqDCoMKgwqAgKiBpbml0IGNvZGUgYXQgc3lzdGVtX3N0YXRl
IDwgU1lTX1NUQVRFX2FjdGl2ZSkgaXQgaXMgbm90IHN0cmljdGx5DQo+PiAgIMKgwqDCoMKgwqDC
oMKgwqAgKiByZXF1aXJlZCB0aGF0IHBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2sgaXMgdW5sb2Nr
ZWQgYmVmb3JlIGNhbGxpbmcNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoCAqIHByb2Nlc3NfcGVuZGlu
Z19zb2Z0aXJxcyBhcyB0aGVyZSBpcyBubyBjb250ZW50aW9uIHBvc3NpYmxlIGJldHdlZW4NCj4+
ICAgwqDCoMKgwqDCoMKgwqDCoCAqIHRoaXMgY29kZSBhbmQgdnBjaV9wcm9jZXNzX3BlbmRpbmcg
dHJ5aW5nIHRvIGFjcXVpcmUgdGhlIGxvY2sgaW4NCj4+ICAgwqDCoMKgwqDCoMKgwqDCoCAqIHJl
YWQgbW9kZS4gQnV0IHJ1bm5pbmcgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzIHdpdGggYW55IGxv
Y2sgaGVsZA0KPj4gICDCoMKgwqDCoMKgwqDCoMKgICogZG9lc24ndCBzZWVtIHRvIGJlIGEgZ29v
ZCBwcmFjdGljZSwgc28gZHJvcCB0aGUgbG9jayBhbmQgcmUtYWNxdWlyZQ0KPj4gICDCoMKgwqDC
oMKgwqDCoMKgICogaXQgcmlnaHQgYWdhaW4uDQo+PiAgIMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4+
ICAgwqDCoMKgwqDCoMKgwqAgd3JpdGVfdW5sb2NrKCZwZGV2LT5kb21haW4tPnZwY2lfcndsb2Nr
KTsNCj4+ICAgwqDCoMKgwqDCoMKgwqAgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7DQo+PiAg
IMKgwqDCoMKgwqDCoMKgIHdyaXRlX2xvY2soJnBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2spOw0K
Pj4gICDCoMKgwqAgfQ0KPiBJJ20gYWZyYWlkIHRoYXQncyBtaXNsZWFkaW5nIGF0IGJlc3QuIGFw
cGx5X21hcCgpIGlzIG1lcmVseSBhIHNwZWNpZmljDQo+IGV4YW1wbGUgd2hlcmUgeW91IGtub3cg
dGhlIGxvY2sgaXMgZ29pbmcgdG8gYmUgdGFrZW4uIEJ1dCByZWFsbHkgYW55DQo+IHNvZnRpcnEg
aGFuZGxlciBjb3VsZCBiZSBhY3F1aXJpbmcgYW55IGxvY2ssIHNvIHJlcXVlc3RpbmcgdG8gcHJv
Y2Vzcw0KPiBzb2Z0aXJxcyBjYW5ub3QgZXZlciBiZSBkb25lIHdpdGggYW55IGxvY2sgaGVsZC4N
Cj4NCj4gV2hhdCB5b3UgaW5zdGVhZCB3YW50IHRvIGV4cGxhaW4gaXMgd2h5LCBhZnRlciByZS1h
Y3F1aXJpbmcgdGhlIGxvY2ssDQo+IG5vIGZ1cnRoZXIgY2hlY2tpbmcgaXMgbmVlZGVkIGZvciBw
b3RlbnRpYWxseSBjaGFuZ2VkIHN0YXRlLg0KSG93IGFib3V0Og0KDQovKg0KIMKgKiBGSVhNRTog
R2l2ZW4gdGhlIGNvbnRleHQgYXBwbHlfbWFwIGlzIGNhbGxlZCBmcm9tIChkb20wIHNwZWNpZmlj
DQogwqAqIGluaXQgY29kZSBhdCBzeXN0ZW1fc3RhdGUgPCBTWVNfU1RBVEVfYWN0aXZlKSB0aGVy
ZSBpcyBubyBjb250ZW50aW9uDQogwqAqIHBvc3NpYmxlIGJldHdlZW4gdGhpcyBjb2RlIGFuZCB2
cGNpX3Byb2Nlc3NfcGVuZGluZyB0cnlpbmcgdG8gYWNxdWlyZQ0KIMKgKiB0aGUgbG9jayBpbiBy
ZWFkIG1vZGUgYW5kIGRlc3Ryb3kgcGRldi0+dnBjaSBpbiBpdHMgZXJyb3IgcGF0aC4NCiDCoCog
TmVpdGhlciBwZGV2IG1heSBiZSBkaXNwb3NlZCB5ZXQsIHNvIGl0IGlzIG5vdCByZXF1aXJlZCB0
byBjaGVjayBpZiB0aGUNCiDCoCogcmVsZXZhbnQgcGRldiBzdGlsbCBleGlzdHMgYWZ0ZXIgcmUt
YWNxdWlyaW5nIHRoZSBsb2NrLg0KIMKgKi8NCg0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9s
ZWtzYW5kcg==

