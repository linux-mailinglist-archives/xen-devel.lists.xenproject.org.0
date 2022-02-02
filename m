Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F1C4A6F16
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 11:45:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264041.456991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFD7m-0002gs-9V; Wed, 02 Feb 2022 10:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264041.456991; Wed, 02 Feb 2022 10:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFD7m-0002e9-4Y; Wed, 02 Feb 2022 10:44:30 +0000
Received: by outflank-mailman (input) for mailman id 264041;
 Wed, 02 Feb 2022 10:44:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFD7k-0002e3-KJ
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 10:44:28 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15a446fc-8415-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 11:44:24 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212AdEk4009771;
 Wed, 2 Feb 2022 10:44:18 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dyrctr0x6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 10:44:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PR3PR03MB6506.eurprd03.prod.outlook.com (2603:10a6:102:5f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 10:44:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 10:44:14 +0000
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
X-Inumbo-ID: 15a446fc-8415-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=al0qtxIpIsOnqt8kHuQ7h5IiUMIMky2axFWYHvQ/+jkI2xzvpBqXtcj1e3EeS158OW5IKTHf16ML4FuzKnRXwBdIiULV9PGSZaXvtcZNJ/wXIdjGPCswOB6/LZyYAUyF5Wi5Id2QFFXRDke0TIKAjRqwwP/pEqKLii/x0fF9BycwbTwWxwNE6T1uEf2xPmOEGfUxzDKUk2HkIUNCjv6WrKFTeVF3JQBQYbPQo6d80LAy+NgvR4Y1Zxv9WzXflWO7PFSEzFXQ3JM8KLhILPQsmRofCMMsBnvnf7/+En2IZVx6if0fLNUIfpSLC5mJQQ/PG+JWZFsvMMpS+W4Cz2NgTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFCmh+ZeVUGVjX0A9gmlwS/HRScuGSTWJcBrgJK92js=;
 b=f+7Q1XjNMl23IVGhm5ZTYmJkE1n25xDoETZ2DHy2I41dZjFOGC4iLo6PqlPAXQMqpecJ/WNQRuYkIEQBYampXfWqTsntlvUz8wBS6DljR2itJwcmZdpDGoUq2/JAl5Y1VK3FUq8unYz3y9Uds5LEGt2nhbLl0ZtIxprE8GHZ/e7vhkVjQmotv7C7uV9zx/geNwOgtodzGhDS3ycs+JXJ5h8P5NUUiryxPhm5+rF5vaHI2cSetzC0+tchjOaYPlR3ezk4UlPxHDknBHqzI++8KcWyrOkFm3RNGqDYJ9rPUQ4D8JTfhspPxNRime/imjyZeT4z2h3fpGgg0e4/+25oDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFCmh+ZeVUGVjX0A9gmlwS/HRScuGSTWJcBrgJK92js=;
 b=YbOzN6L7+gizx4MnFqLP+nlKx9ViribtQFixSqgHwmZbuU1YZYDtH2QXcnC2NlSAdJ32LRtPjgIQ7HPQdWuYISPVfZvIiPJx+Q4lMa3O+xW4Jux96/k1kq0yvsInAu9rrnaBJkNSDrWWIPzgK4lBZqMSudN8tstlWv+4V5nSVZ9xAzXOTw+TD7PXaN+M8oP4rlSOM2TMGFuPDkeTTkRZJihbykkOle7d6Qo8UEC1zGTkLKWh5Q3p50eEvk5pfW6HgGGiP/HEUEZFdXQzRwSoBMatBBMzSsIgfMzczLkGPZsS4Ont6tdlhUu5ieXwLzOQrl9n2eWjdL1hgZw97aQjPg==
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
Subject: Re: [PATCH v5 08/14] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v5 08/14] vpci/header: program p2m with guest BAR view
Thread-Index: AQHX4ewInH3i1A85zUqSOqe7J03BoaxhCwuAgB9Nb4CAABckAIAADZOAgAACmgA=
Date: Wed, 2 Feb 2022 10:44:14 +0000
Message-ID: <7d4c128d-f6f0-8dca-8ab4-6138ed6cd61d@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-9-andr2000@gmail.com> <Yd/9W7GFO51GE0ch@Air-de-Roger>
 <37c2374d-c0f7-23b6-d2f8-e94d1348807c@epam.com>
 <2282e7c5-ba1b-e2a2-af4a-84a894211870@epam.com>
 <YfpeT+VMWiklDWGf@Air-de-Roger>
In-Reply-To: <YfpeT+VMWiklDWGf@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ccc7837-6c43-46c9-0db7-08d9e638f4cc
x-ms-traffictypediagnostic: PR3PR03MB6506:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR3PR03MB6506D6D844B376F21B9DAD46E7279@PR3PR03MB6506.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NqdyR44nZsI46ThYL4FgqofC6D9yiJKr7EjjVIB/wgbK409zXf0jMpOM9f+6npnO/Ecz25CUlUR9dFDOwn0ILHBUWaHFt2iZZT21mFlA+6vsIcoMa0Q7zU0pu/ZXFhkG1EqY4h0BgjEvbgl66eboihntKf7OxdDa7ZWfMIumCPvONFmpoj2h3CrgBrgbiwi01PMfIELXIf6sYQA1SuyvWFDH0rTrr0giOQPRkBODIYgagYGbKKhsvdgLUCcOZTA/KcCgxyRbMdNb1xB9j5k3U9LNVYN9GbmK9mrRwmZA1vXRwgVhQTjowJb6DFR+4tsFzDIz0+GdqDPiYioJYOy5n5ykfbQxs6a2N+JjtqCYoG3nl2EjybQqJ5b+tt9X0/t4kZ66hIZCQMDGzy8V4127dTRGyCQMcU/syqEWHc9aPxN1NDNUh5pX2ckfZz/vICiwNXqJNEcuRli9OhnwZu0wM7oR+PVfPUBO2k6z4YVTPJSiUil6jHndtGm0qEXoGndPUbzLih6DrEY/3KzpXFLrGZfwakDh3iBFJ8zAHzndbIBtX3r072OYVtp5Tu5Q55ggW1JnGh7HomzOtrqJ4LmL1ECZtYQsF+z4jtU30Ob5o1U012qdfpr/bKowjXDTdKplnep7t9LgA6wktXP4TEAw11XLS1aISxWR3f9i33pJ6fiQ7h+PumwZAcP+G8Xgl+z3TWAy63w2KfQCKTwxT/lUNuHNB/CylOOz7edbqtolGNj5lY1pO8215Tb9P7JNy8S7
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8676002)(66556008)(66476007)(66446008)(107886003)(2906002)(6512007)(64756008)(53546011)(6486002)(91956017)(26005)(186003)(122000001)(86362001)(31696002)(38100700002)(36756003)(2616005)(8936002)(38070700005)(31686004)(83380400001)(54906003)(6916009)(508600001)(66946007)(316002)(76116006)(6506007)(71200400001)(7416002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?STdvaVlhc0trazUreEx1Qi9wMmFBYjJFdXFDbVVDa0VhRTRUb2dMTXQrTTgx?=
 =?utf-8?B?S1dpOE52Zjd2NEJscE4xcmk0dkFsYVMza0NXRHNSa2Y5K3NSUFVXWFY1WW9o?=
 =?utf-8?B?aGNrVWF6Y0lGKzBCQmdsUzBLS1lBOEd3bUdTY2ZCNjZ4TzVVMm4xNnRkRGE3?=
 =?utf-8?B?dVkxalRIc1haVCtNME9hbldpT2NBVllZOVlxV0IyMVU5MUpQRDBTYWw3ellG?=
 =?utf-8?B?bTBwbmNPZW1LbUxuZGlBSm8vem80cU5nbTBwYWZhOGRFWFNkZHFlVzVRdlRO?=
 =?utf-8?B?TnZaWGZSQllIUlBCN0Jna1psenZXM0RDYTdiN2h5WFBZQ3lmWFkzKzZ3MGJ0?=
 =?utf-8?B?OUpDc21iVlRqN1RMMy81WElXdlFvVFJ5NGVtampDWFV6ZFVSa0ZJUVo4dU9J?=
 =?utf-8?B?cFhlSzlSZm5TQkVCTXZldWZwclhvVk1oQjFaZ2M2TTk5bVdFd0gxZlF3bHJQ?=
 =?utf-8?B?ZzAySUt3NEozNnBzZUhtYXJNRVVidmdQeEsyWFNhRXdHTG1qUlJGZnFsY0xC?=
 =?utf-8?B?U05OdEdnWCtnN1hqQVJiTkMrZHQ2dVYzR3JlcElpL1Nlb3ZobGNMcmxQL2Ix?=
 =?utf-8?B?QkFKNlhqODF0NjZzb2lKRE14NE0xbDkzVW1rbGN3MEJBdnB4YzJyS3lDRlM4?=
 =?utf-8?B?SXRJYm13L1g1OU5aM1NkTU5EZEpJdk9SVS9LS29mNUxOUklkL0ljZHdsTTNB?=
 =?utf-8?B?bnZkcmFteEYxWEVuSmFsa2grWldTWVBwT1F4c2RFZzZKbUx0aWtaN3FBdFlu?=
 =?utf-8?B?ZVUvSUJRU1BJVDg3MHRkWW95dCt2bk40WExmMG1uanBzMEV6Y2cyVGR2TEI4?=
 =?utf-8?B?ZzVBZHd1R2FIWFA5RGJTQmhOdHpRN1lvWUFDeGdSYnRTdm54VmJRMXFmM3Ja?=
 =?utf-8?B?ZHpCdTJRRk5jZ3BqUDBXcFhQb0lkRjduOU1mM3dFS2hHYjFES0JtZmYxMEd0?=
 =?utf-8?B?dXl4bXBZRE1Lbnc1Z212R0pETVJYUHhrN3NDbkE1Yk00L3Vyd252VnNrQVVq?=
 =?utf-8?B?N1RmZVR4dCt4Y24xQWRSQjAzMnljR2lJdXYwK3NOUHBaSDNKek1CQ2ZnOC9a?=
 =?utf-8?B?N0t3VEUyWnd3WW9DUTlzM2dqeXZKbmhvSVp3cS82TzYvWHdpMGlvMWVKaXV6?=
 =?utf-8?B?V0lVVFAxWm5Zc3ViN0Z0ZVpBMzh0eUhOV0VRNWdmWWdwOW9GTzk4UVpmSTgr?=
 =?utf-8?B?RXgyOUpyOG91ZmkrZHI3QjgzUllZUVEvdEdpNksvM25ZU3JoSGtndHRibjFp?=
 =?utf-8?B?MGhjTEF1aEVNaU4weS96Z3JXU0ZFS0QycGtRRnNwZTM1em1PQnc3eURmUzdv?=
 =?utf-8?B?eit0Z0RxZ1pKUlp4SFJmMVdUbDk5bmhReXBCd0VvSkg2WjE5RjRvVlNOalhy?=
 =?utf-8?B?VjZsTXRPVFhsWndFNFNZQWJuK3dONVhkVm1EZExpOFpLRkc1RUNJa3huOTFF?=
 =?utf-8?B?NVRNWUQ1dVZpUVlRbE5OVVRCRXd6VzhKMzY4VkhQand2MjFBVGxDMmV6OXNN?=
 =?utf-8?B?V25VUEk4V0UyaVo5V1NDR3g0QmpSM2VETGtmRzNBa0U0VFdUOFAxeTZyUHR5?=
 =?utf-8?B?WnZSN2k3ZU4yOEF5MFBmQmVQODRhUUwwKzlNL0pqZ2pCVURCVDdsclA1MEpU?=
 =?utf-8?B?eS9YNXJYTFkxd0w1cmxZY3N3ZnYrYUwwVCtVK1FxajZCYnJXVDFJci9pbG85?=
 =?utf-8?B?ell5cTJWek8zSjVocHBlZlNLZk5xM0lBaXdXYU1wRUs1R0VTdStoZjNIMFRj?=
 =?utf-8?B?a1JqNHB2OHk2akg1WlVxZHNFRi8rQXp6eFdIUjRnckZqVzRFNFdiQjc5Q0hQ?=
 =?utf-8?B?ZW1Wc2MwUks2c0FBQytXc0hNWUxHUmRMSnhTUnJsMTVsd3FxdFhsSDBiTEly?=
 =?utf-8?B?VHorUzJ6SitTdTZ5YU04UlVIbXlhMXNqRTY1d1NjTUpzYVJTQ1MxWGR5bG4y?=
 =?utf-8?B?RVNtcTlnb2lFMmpZZGg0NDg5MVlKKzJhYzlQUjJCdGI1WTQyeDkyQW5EUTlt?=
 =?utf-8?B?aUIxYlhpLzRDTVE0eXJjS21vcTNIZ1dabllWa3Y0cTFIMStVQnBMbEkvUnZM?=
 =?utf-8?B?Wm1FMmRtcUE2emZLVzhjRlFEcEEzS3VaeDhXdGVoeS9mdVJMZFNXcGgrSWdp?=
 =?utf-8?B?Z0pJOEY4TVdkK0VlM2tkNWUvNXZCeHZ1ODY2SjRBT2poRkYyS016RS9INGxv?=
 =?utf-8?B?UTlROXkvNXVxcndUMWo1bWtpcWJyb0Y5Z2xlY0ZpZ0ppeUFHR1l2a29zRm9i?=
 =?utf-8?B?Q2c4R29vb2o1VWxVYllzMEVmREZjVExjT3VuMFN4VFBrZWMrNkRhbzRRNElK?=
 =?utf-8?B?WHI4N2ZFSXVVdmNzaWFvbnRkQ0hzRDJWTEFJOFZIVHRsOVNwNGF4dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9372CB71C728F34C9D89219539F8C99C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ccc7837-6c43-46c9-0db7-08d9e638f4cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 10:44:14.8269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y62sGD2+VLPyNedCE5Mi6LED35t4JP654NpiRaSIivimLb07draGRGVjZBsavzNWZ+TPQL3TM3cuBdcX/kFuiKnik8q9O613SOxqyPDLzBjlCakKiyzqva4HYGo5A2V9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6506
X-Proofpoint-ORIG-GUID: Yf-SpjmATLgiBHoTv9qnafYjU_qHQy-Q
X-Proofpoint-GUID: Yf-SpjmATLgiBHoTv9qnafYjU_qHQy-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_04,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020057

DQpPbiAwMi4wMi4yMiAxMjozNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gV2VkLCBG
ZWIgMDIsIDIwMjIgYXQgMDk6NDY6MjFBTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
d3JvdGU6DQo+Pj4+PiArICAgICAgICBnZHByaW50ayhYRU5MT0dfR19ERUJVRywNCj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICIlc21hcCBbJWx4LCAlbHhdIC0+ICUjIlBSSV9nZm4iIGZvciAlcGRc
biIsDQo+Pj4+PiArICAgICAgICAgICAgICAgICBtYXAtPm1hcCA/ICIiIDogInVuIiwgcywgZSwg
Z2ZuX3goc3RhcnRfZ2ZuKSwNCj4+Pj4+ICsgICAgICAgICAgICAgICAgIG1hcC0+ZCk7DQo+Pj4+
IFRoYXQncyB0b28gY2hhdHR5IElNTywgSSBjb3VsZCBiZSBmaW5lIHdpdGggcHJpbnRpbmcgc29t
ZXRoaW5nIGFsb25nDQo+Pj4+IHRoaXMgbGluZXMgZnJvbSBtb2RpZnlfYmFycywgYnV0IG5vdCBo
ZXJlIGJlY2F1c2UgdGhhdCBmdW5jdGlvbiBjYW4gYmUNCj4+Pj4gcHJlZW1wdGVkIGFuZCBjYWxs
ZWQgbXVsdGlwbGUgdGltZXMuDQo+Pj4gT2ssIHdpbGwgbW92ZSB0byBtb2RpZnlfYmFycyBhcyB0
aGVzZSBwcmludHMgYXJlIHJlYWxseSBoZWxwZnVsIGZvciBkZWJ1Zw0KPj4gSSB0cmllZCB0byBp
bXBsZW1lbnQgdGhlIHNhbWUsIGJ1dCBub3cgaW4gaW5pdF9iYXJzOg0KPj4NCj4+IGRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIu
Yw0KPj4gaW5kZXggNjY3YzA0Y2VlM2FlLi45MjQwN2U2MTc2MDkgMTAwNjQ0DQo+PiAtLS0gYS94
ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRl
ci5jDQo+PiBAQCAtNTcsMTAgKzU3LDYgQEAgc3RhdGljIGludCBtYXBfcmFuZ2UodW5zaWduZWQg
bG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHZvaWQgKmRhdGEsDQo+PiAgIMKgwqDCoMKgwqDCoMKg
wqDCoCAqLw0KPj4gICDCoMKgwqDCoMKgwqDCoMKgIHN0YXJ0X2dmbiA9IGdmbl9hZGQoc3RhcnRf
Z2ZuLCBzIC0gbWZuX3goc3RhcnRfbWZuKSk7DQo+Pg0KPj4gLcKgwqDCoMKgwqDCoMKgIGdkcHJp
bnRrKFhFTkxPR19HX0RFQlVHLA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICIlc21hcCBbJWx4LCAlbHhdIC0+ICUjIlBSSV9nZm4iIGZvciAlcGRcbiIsDQo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwLT5tYXAgPyAiIiA6ICJ1biIsIHMsIGUsIGdm
bl94KHN0YXJ0X2dmbiksDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFw
LT5kKTsNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoCAvKg0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqAg
KiBBUk0gVE9ET3M6DQo+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoCAqIC0gT24gQVJNIHdoZXRoZXIg
dGhlIG1lbW9yeSBpcyBwcmVmZXRjaGFibGUgb3Igbm90IHNob3VsZCBiZSBwYXNzZWQNCj4+IEBA
IC0yNTgsNiArMjU0LDI4IEBAIHN0YXRpYyB2b2lkIGRlZmVyX21hcChzdHJ1Y3QgZG9tYWluICpk
LCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4+ICAgwqDCoMKgwqAgcmFpc2Vfc29mdGlycShTQ0hF
RFVMRV9TT0ZUSVJRKTsNCj4+ICAgwqB9DQo+Pg0KPj4gK3N0YXRpYyBpbnQgcHJpbnRfcmFuZ2Uo
dW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHZvaWQgKmRhdGEpDQo+PiArew0KPj4g
K8KgwqDCoCBjb25zdCBzdHJ1Y3QgbWFwX2RhdGEgKm1hcCA9IGRhdGE7DQo+PiArDQo+PiArwqDC
oMKgIGZvciAoIDsgOyApDQo+PiArwqDCoMKgIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBnZm5fdCBz
dGFydF9nZm4gPSBfZ2ZuKFBGTl9ET1dOKGlzX2hhcmR3YXJlX2RvbWFpbihtYXAtPmQpDQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgID8gbWFwLT5iYXItPmFkZHINCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgOiBtYXAtPmJhci0+Z3Vlc3RfcmVnKSk7DQo+PiArwqDCoMKgwqDCoMKgwqAgbWZu
X3Qgc3RhcnRfbWZuID0gX21mbihQRk5fRE9XTihtYXAtPmJhci0+YWRkcikpOw0KPj4gKw0KPj4g
K8KgwqDCoMKgwqDCoMKgIHN0YXJ0X2dmbiA9IGdmbl9hZGQoc3RhcnRfZ2ZuLCBzIC0gbWZuX3go
c3RhcnRfbWZuKSk7DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgZ2RwcmludGsoWEVOTE9HX0df
REVCVUcsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIiVzbWFwIFslbHgs
ICVseF0gLT4gJSMiUFJJX2dmbiIgZm9yICVwZFxuIiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBtYXAtPm1hcCA/ICIiIDogInVuIiwgcywgZSwgZ2ZuX3goc3RhcnRfZ2Zu
KSwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXAtPmQpOw0KPj4gK8Kg
wqDCoCB9DQo+IFRoaXMgaXMgYW4gaW5maW5pdGUgbG9vcCBBRkFJQ1QuIFdoeSBkbyB5b3UgbmVl
ZCB0aGUgZm9yIGZvcj8NCj4NCj4+ICsNCj4+ICvCoMKgwqAgcmV0dXJuIDA7DQo+PiArfQ0KPj4g
Kw0KPj4gICDCoHN0YXRpYyBpbnQgbW9kaWZ5X2JhcnMoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBk
ZXYsIHVpbnQxNl90IGNtZCwgYm9vbCByb21fb25seSkNCj4+ICAgwqB7DQo+PiAgIMKgwqDCoMKg
IHN0cnVjdCB2cGNpX2hlYWRlciAqaGVhZGVyID0gJnBkZXYtPnZwY2ktPmhlYWRlcjsNCj4+IEBA
IC00MjMsNyArNDQxLDI1IEBAIHN0YXRpYyBpbnQgbW9kaWZ5X2JhcnMoY29uc3Qgc3RydWN0IHBj
aV9kZXYgKnBkZXYsIHVpbnQxNl90IGNtZCwgYm9vbCByb21fb25seSkNCj4+ICAgwqDCoMKgwqAg
aWYgKCAhbWFwX3BlbmRpbmcgKQ0KPj4gICDCoMKgwqDCoMKgwqDCoMKgIHBjaV9jb25mX3dyaXRl
MTYocGRldi0+c2JkZiwgUENJX0NPTU1BTkQsIGNtZCk7DQo+PiAgIMKgwqDCoMKgIGVsc2UNCj4+
ICvCoMKgwqAgew0KPj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBtYXBfZGF0YSBkYXRhID0gew0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmQgPSBwZGV2LT5kb21haW4sDQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAubWFwID0gY21kICYgUENJX0NPTU1BTkRfTUVNT1JZLA0KPj4gK8Kg
wqDCoMKgwqDCoMKgIH07DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgZm9yICggaSA9IDA7IGkg
PCBBUlJBWV9TSVpFKGhlYWRlci0+YmFycyk7IGkrKyApDQo+PiArwqDCoMKgwqDCoMKgwqAgew0K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IHZwY2lfYmFyICpiYXIgPSAm
aGVhZGVyLT5iYXJzW2ldOw0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCBy
YW5nZXNldF9pc19lbXB0eShiYXItPm1lbSkgKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb250aW51ZTsNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRhdGEu
YmFyID0gYmFyOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmMgPSByYW5nZXNldF9yZXBv
cnRfcmFuZ2VzKGJhci0+bWVtLCAwLCB+MHVsLCBwcmludF9yYW5nZSwgJmRhdGEpOw0KPiBTaW5j
ZSB0aGlzIGlzIHBlci1CQVIgd2Ugc2hvdWxkIGFsc28gcHJpbnQgdGhhdCBpbmZvcm1hdGlvbiBh
bmQgdGhlDQo+IFNCREYgb2YgdGhlIGRldmljZSwgaWU6DQo+DQo+ICVwZCBTQkRGOiAoUk9NKUJB
UiV1ICVtYXAgWyVseCwgJWx4XSAtPiAuLi4NCj4NCj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+PiAr
DQo+PiAgIMKgwqDCoMKgwqDCoMKgwqAgZGVmZXJfbWFwKGRldi0+ZG9tYWluLCBkZXYsIGNtZCwg
cm9tX29ubHkpOw0KPj4gK8KgwqDCoCB9DQo+Pg0KPj4gICDCoMKgwqDCoCByZXR1cm4gMDsNCj4+
DQo+Pg0KPj4gVG8gbWUsIHRvIGltcGxlbWVudCBhIHNpbmdsZSBERUJVRyBwcmludCwgaXQgaXMg
YSBiaXQgYW4gb3ZlcmtpbGwuDQo+PiBJIGRvIHVuZGVyc3RhbmQgeW91ciBjb25jZXJucyB0aGF0
ICJ0aGF0IGZ1bmN0aW9uIGNhbiBiZQ0KPj4gcHJlZW1wdGVkIGFuZCBjYWxsZWQgbXVsdGlwbGUg
dGltZXMiLCBidXQgdGFraW5nIGxvb2sgYXQgdGhlIGNvZGUNCj4+IGFib3ZlIEkgdGhpbmsgd2Ug
Y2FuIGFjY2VwdCB0aGF0IGZvciBERUJVRyBidWlsZHMuDQo+IEl0IG1pZ2h0IGJlIGJldHRlciBp
ZiB5b3UgcHJpbnQgdGhlIHBlciBCQVIgcG9zaXRpb25zIGF0IHRoZSB0b3Agb2YNCj4gbW9kaWZ5
X2JhcnMsIHdoZXJlIGVhY2ggQkFSIGlzIGFkZGVkIHRvIHRoZSByYW5nZXNldD8gT3IgZG8geW91
IGNhcmUNCj4gYWJvdXQgcmVwb3J0aW5nIHRoZSBob2xlcyBhbHNvPw0KRmlyc3Qgb2YgYWxsIEkg
ZGlkbid0IHJ1biB0aGlzIGNvZGUsIHNvIGl0IGlzIGp1c3QgdG8gc2hvdyB0aGUgY29tcGxleGl0
eQ0KSWYgdGhlIGFwcHJvYWNoIGl0c2VsZiBpcyBvay4gSWYgaXQgaXMgdGhlbiBJJ2xsIGdldCBp
dCB3b3JraW5nOiBwbGVhc2UNCmRvIG5vdCByZXZpZXcgaXQgbGl0ZXJhbGx5IHlldC4NCg0KVGhl
IG9yaWdpbmFsIHByaW50IHdhcyB1c2VkIHRvIHNob3cgb25seSB0aG9zZSB7dW59bWFwcGluZ3Mg
dGhhdA0Kd2UgYWN0dWFsbHkgZG8sIG5vIGhvbGVzIGV0Yy4sIHNvIHdlIG5lZWQgdG8gcHJpbnQg
YXQgdGhlIGJvdHRvbSBvZg0KdGhlIGluaXRfYmFycywgZS5nLiB3aGVuIHRoZSByYW5nZXNldHMg
YXJlIGFsbCByZWFkeS4NCg0KQWdhaW4sIElNTywgYWRkaW5nIHN1Y2ggYSBiaWcgcGllY2Ugb2Yg
REVCVUcgY29kZSBpbnN0ZWFkIG9mDQpwcmludGluZyBhIHNpbmdsZSBERUJVRyBtZXNzYWdlIGNv
dWxkIGJlIGEgYml0IGV4cGFuc2l2ZS4NCkkgc3RpbGwgaGVhciB5b3VyIGNvbmNlcm5zIG9uICp3
aGVuKiBpdCBpcyBwcmludGVkLCBidXQgc3RpbGwgdGhpbmsgd2UgY2FuDQphbGxvdyB0aGF0Lg0K
Pg0KPiBUaGFua3MsIFJvZ2VyLg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

