Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64382747965
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 23:04:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558676.873017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGnBO-00056q-04; Tue, 04 Jul 2023 21:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558676.873017; Tue, 04 Jul 2023 21:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGnBN-000544-RS; Tue, 04 Jul 2023 21:03:33 +0000
Received: by outflank-mailman (input) for mailman id 558676;
 Tue, 04 Jul 2023 21:03:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PjRJ=CW=epam.com=prvs=1549bc4864=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qGnBL-00053y-F5
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 21:03:31 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 387fa172-1aae-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 23:03:28 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 364EUTf0021326; Tue, 4 Jul 2023 21:03:18 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rmn8g8w8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jul 2023 21:03:17 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB5PR03MB10049.eurprd03.prod.outlook.com (2603:10a6:10:4a0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 21:03:12 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::10c0:3ca8:e226:2335]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::10c0:3ca8:e226:2335%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 21:03:12 +0000
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
X-Inumbo-ID: 387fa172-1aae-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bikOchGA1QKIIn4x0y+0Wub69MgW+r5DaeYgxpKXiPCNB3OXlEoR6I9BKOeAZ4J2KQQlAzbOB1GcFtqrMPPYohDXP4rPIfFHE7XQk63N6AjPbD0N3yFhoBTlJ5x+7eJR1/J0wnf6c8JU7cI7ER4+sSKP1EbnQ9OD9PI+D6DxZAVhDliN1AKhogipkZBaTZGVW+BS4FIoeIUkHTFV/7VclUAWdeyDVD43JMAYbNcnFOPJ0+jbuzBjIMmolfnuLI8nF1u9+a8Uf0L4dbvgM3siKM/VN/YnyyB0hEvNo/2eZOqiZdk3iVWq1vHmGNMzc/rn4+aBvPtn3thrEizJ24tWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQeeKVZOAR2mJnhk9tyfmSJy/ANeuIFJU7xRGovYa/Y=;
 b=Oaludud6SW24bK3SBgzL6nHAfLddyRRRC8xIsunarnvMAfTlmCjxyg/BzCfu/asPOuUJe+tuJQhfXXjbeIkm6l15XScym3J95l3whHstixywXBNElQvHP0crsIZWDx3WtRQ8p6jYaCXoUdRWh1gbYYV5kTbtq9HQnc90jRz6MYDC8ViYYjew6KJ2rob/vzikr49DN/rB9FE8/9/JpNl7BzDV1Kbw1Oo7ZH9F438xCa0Ez4Mn/zWCn8q9Mf/AIuwO2MfyBtMPtpxgU+GWR9ldlLfkVIKXb2wB5a9rYEKG5nAcTzHoDOrr0ko1i5e7DMAJTx/FH8WcD9WtUuLzeHX0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQeeKVZOAR2mJnhk9tyfmSJy/ANeuIFJU7xRGovYa/Y=;
 b=Gkp1PRzOMeL6dMqDiFdlt+DTFikK00mhCsv0VwxKzSRjKGUj0ibPhKAZvwlGuODpLAFG+zocyr0X2p3ARSxJYRLJ6XQ0DKq/UjoIr0B+7tUtKRU5arnL6vZ+ackPSB4gpdnbxOkuhqEv85Qt2irad0VIVN5kVr9Vwv/uKOGwOOm23vPr1Zsj1GeIiuFkUClvQzp1emcsnX3HSmmXWG32leBrGbbJrADHvltQDSCdkB+LRlcJK8ycF/peLjadAy247TfiCzhkGkLle/2gakH1cTWJ4az01h5IhDSkCctfZOcnJSF5mi00lhtEB08O/KtZT7zaHQY2Pvw68ca9NdyNsw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHZneJZdDE+HOoSO0y6VB9l0x1hDq+No9OAgAgqUACAALl2AIAAzUWAgADPAYCAEhJlgA==
Date: Tue, 4 Jul 2023 21:03:12 +0000
Message-ID: <87wmzfmltd.fsf@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local> <87352kpj04.fsf@epam.com>
 <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local> <87ilbfnqmo.fsf@epam.com>
 <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local>
In-Reply-To: <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB5PR03MB10049:EE_
x-ms-office365-filtering-correlation-id: b27b6351-aec6-4993-6adf-08db7cd213f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 fZfLqhMkhXWf+LLaGkhhL2nL3zo+qLDeImhJUl6MU58UOTZRWfyizpzuBDZlp5bi4zzMijKf/ebR4XarZuJmKYchFVKGdL1CixMhw2MWHNnQeu5apq6Nw9ZChKKO3A+391EliEVmLWZGikE+0p2A5tGuUCYyDvyKHDBpORLW89oCgawqCFtkpEcLH1oBbwTATjfRzBY9yaYSaah+7c4ibqiySt6ZCTZX7QnSkb9nBMdhbPplsJ4Sje9CocQ0LxNLswI9XS8u5qAkO3Mg3uO+CgPgZBmBNNuHJqriwY5lKbMupRB98ZXsOC80hEPUepzGX0bJznS0MNPH0pTwvu9vdFwcpGRzyIgnGvE/sZaJvzjeO+HsJu6hPX6kTinWLr/jx3O+n9brcAd0DCId/xEz2grFFeQKOs4AKg0GoKZo9KiZuOMh5romJoCNdtmubX4aefPKxdvvkMn8dlY8FvT/uBf5lHajg6cRm03YVERB7KzsS/T5GhH7y0yQXb2AuRHE3hd9C9dkcW0M/z4C95+5kYywsiKeTOnaVkH3xeZvqbpKSalJ0WnulagPWZrC0l7pqWG0m54goptg66E9EDOj7YiMO8tAK4l2b9//eL8eZbY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(54906003)(2906002)(478600001)(26005)(41300700001)(86362001)(966005)(6486002)(8936002)(8676002)(71200400001)(5660300002)(36756003)(38100700002)(316002)(66446008)(66946007)(66476007)(64756008)(4326008)(6916009)(122000001)(66556008)(38070700005)(6512007)(6506007)(91956017)(55236004)(76116006)(2616005)(186003)(83380400001)(66899021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dHhvbGRhYWNGdTc1ZzRwYm9YejZ3MmFxd0Y5WUNtZnVxbnlSZVlEdmhDdXNX?=
 =?utf-8?B?REVhTUdEQ0lLV1Z3ZzU1cU9rZUlKUTZtNkFsUTJkQWoxRWIxUzRFMldSM3hZ?=
 =?utf-8?B?d0xiald3aWMwcEU3TTJCMXdtTXFQQXNiSDlaWlo1M3c1TmFLdUlFL0NwM3hl?=
 =?utf-8?B?Y3dpbytObFRyNFQ4Ni8xS2Z1eU9Zdkh2L1A5TkZWN2JDNlV2eXhhOHJLSkJU?=
 =?utf-8?B?czI2ZXkrZnFHZklBTXZOOE5GdjJVQ0U0RVhhTVF5SEx5VjZ5YUhzcnNOMWly?=
 =?utf-8?B?d0pLT3lGL0NlZ3RocmJPMzZKR2Uwa2RmOUoyeGx6N01WMFl4NzB2eW1Jb3BR?=
 =?utf-8?B?QVRrWTNIVTBBeU9PZmNDemZLVnM3d1o4OVZ6OExwZkU4RitRdktiOEpnaUFi?=
 =?utf-8?B?enVCTnlXTVk0WTlIRTBkUHlwaG8xSDhkdXMyR2JCYlJHU3VsSllaNG1venJm?=
 =?utf-8?B?eWJ0aFllMnRCOU11cUtZanB3Z2x2cTdmUXdtV3lOblh3ZXJtQTN1cGRxOGZv?=
 =?utf-8?B?V0t3V2lGTG9sdjZJblZnVUFXUW00UDVsYjFBdkZvSXR0bzViMkFkM3BYcHRZ?=
 =?utf-8?B?Q0V5WjgxRkUzNktUMWhtK25HampPRmk5enY5RUR4bjJkZGdIZHJ6NVB2Nlh1?=
 =?utf-8?B?alNjU3NySGJQak9tOGg0ODlFYldnMXJpSDRNRlVvdWxZdFNRbm14ZnhOeG1i?=
 =?utf-8?B?WEs5OSthUWdFV1N4NTM5c3pYSjBqWFl3SVVJWTRCQkJpc0RYRUpEYjUyYUJL?=
 =?utf-8?B?bmoxd21YTFY3YXNPTVB5cVNGRG5QZk5QVnFrbTNjeWkxZ25zN3kvK1JxS0lS?=
 =?utf-8?B?K0l6a1NSdzZlNjNkOVJWN2ozMjRhejYzNmRaV2VFd1REV3FUSEtJbUJicFR2?=
 =?utf-8?B?WHRnczY2aDBPNWZ6SENPdWpjVmZiRktWa0N3UFBxTElpMDBmMzdzTXZ6T3JJ?=
 =?utf-8?B?UkxQajN3MVBabHJaSnNCSWduTk9tbkM0SEJ0S3lLWEw3Sno0RElObVRrdWsz?=
 =?utf-8?B?OUp3VGtaYzVjSHhNdUhUUm9DVUFBR2VFV0E5dkROUHkwSDR6TGZwSXVpNHhP?=
 =?utf-8?B?Q21LeG42Zmx0S0hxWlJlcUFRMER4THRNVmp3SVdkMjFkeTEwQXlNTDFiZ01v?=
 =?utf-8?B?UzF2VHBTMGhsWWM0SDcxdithbkV2cFJiOFl6dEc0UURjQjRvcC83bSs2N1ow?=
 =?utf-8?B?OE45TStwTmlwcmdNMTNiWDJPRGJQMDY5aVY1clg1Q2wrcm4wcVRiUk0xRmZP?=
 =?utf-8?B?a0hNM3hxL2FPOVRDRHpDdXFEaFlBTVR5QWFTc1QzazJlMTJTOU11cVM2UzUv?=
 =?utf-8?B?QkQ5QnZqenZyakpwS3IzNWRCY0YvZGpMUGMxKy93MFExY1BxUUhwU0dQcVYv?=
 =?utf-8?B?cERzUzJqamlEeWRIVEVxWmhwbjhjOHN6MFl2Nm5TQmxsZ3JQQ0luR01qMHFo?=
 =?utf-8?B?cXZNV2JPZGFQTlI5aWQ2a0VWeWhENkZXYk90dmN5dGQyMFhBeGdVWHVRN3dE?=
 =?utf-8?B?eWdydDdSa21jV3YybjdwV3ZxNkJ4UGdaQ0I1Z1o3c2Y2ZXRBK1hSVWNQbzZJ?=
 =?utf-8?B?Wm9oeVc0bm9SVzhFTUNDODQ4ZDhnWHdsajhGd1NUQmphc2l2WmpiVVUrN0E5?=
 =?utf-8?B?alkveXM4cko3RU4xYkJneitTQTErRXZWRm9pVFFzZTZMYWhncDBDcXZHaWs3?=
 =?utf-8?B?cGxHTGR0emptdkRvbUF4LzFVTVRiUFIwaTdYbVFkYXQvVWlmRUVJNXVhbWZv?=
 =?utf-8?B?ZXpZVzd2ZGRFS0xpR0JzR3gva0MxT0VrQmpiaDU3MURDNVRpc0J0QTk4R2VW?=
 =?utf-8?B?U2R4Rmh5WFBSRDRvNzVWd1ZrTXBjN0xKMWxjRVArYlZDMjVLc2Z6OXZnZml2?=
 =?utf-8?B?VUVzaHpES21WcEpjamFkdHhGa3JaVU5TWXZpUndJK0lNeTEvTitTMnVBSkdl?=
 =?utf-8?B?enQyMVhydGE4a3k1OTdMdEEwSzJHRmV0eUt0S3RQTjV0K1Q5MnZvZlY0bDlu?=
 =?utf-8?B?MmFBYTZpQ3VHL1BuWWFtbjF0NnNKdUxKQ2xMbHQ0dGV5cCtlZzJTZnJ4cXEz?=
 =?utf-8?B?ZHRWSWI3eXJJeUswVTV6OGxGM3kvbmZHZ3E5N00yZjNDUG5iOUNuZVhyY0sy?=
 =?utf-8?B?S2lQQ2czQjQrbHc3Qm9YQ2R3dEtFLzJrRloxN0I2UTFIWU9QT0dtbkY1bTEz?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AF3DCBDA17A42408E2A224766D037A4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27b6351-aec6-4993-6adf-08db7cd213f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 21:03:12.2716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CqpVaw0KYWv0qKwa0TMj5j1v+JeJppPGgXu6D+wZybA3YfmmgjUH3CjiMihR1bp8FG6AIHXBYVW60QDMrbijrfPX7L55X0lrxk0KSiHO3Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR03MB10049
X-Proofpoint-GUID: KcyvXOXqydYIlfBy_wyekcmZlzK2zwFM
X-Proofpoint-ORIG-GUID: KcyvXOXqydYIlfBy_wyekcmZlzK2zwFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_14,2023-07-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0 mlxscore=0
 mlxlogscore=950 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040184

DQpIaSBSb2dlciwNCg0KUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
aXRlczoNCg0KPiBPbiBUaHUsIEp1biAyMiwgMjAyMyBhdCAwOToxNzozNlBNICswMDAwLCBWb2xv
ZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IA0KPj4gSGkgUm9nZXIsDQo+PiANCj4+IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cml0ZXM6DQo+PiANCj4+ID4gT24gV2Vk
LCBKdW4gMjEsIDIwMjMgYXQgMTA6MDc6MjBQTSArMDAwMCwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6DQo+PiA+PiANCj4+ID4+IEhpIFJvZ2VyLA0KPj4gPj4gDQo+PiA+PiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JpdGVzOg0KPj4gPj4gDQo+PiA+PiA+IE9uIFR1
ZSwgSnVuIDEzLCAyMDIzIGF0IDEwOjMyOjI2QU0gKzAwMDAsIFZvbG9keW15ciBCYWJjaHVrIHdy
b3RlOg0KPj4gPj4gPj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9h
bmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4gPj4gPj4gDQo+PiA+PiA+PiBJbnRyb2R1Y2UgYSBw
ZXItZG9tYWluIHJlYWQvd3JpdGUgbG9jayB0byBjaGVjayB3aGV0aGVyIHZwY2kgaXMgcHJlc2Vu
dCwNCj4+ID4+ID4+IHNvIHdlIGFyZSBzdXJlIHRoZXJlIGFyZSBubyBhY2Nlc3NlcyB0byB0aGUg
Y29udGVudHMgb2YgdGhlIHZwY2kgc3RydWN0DQo+PiA+PiA+PiBpZiBub3QuIFRoaXMgbG9jayBj
YW4gYmUgdXNlZCAoYW5kIGluIGEgZmV3IGNhc2VzIGlzIHVzZWQgcmlnaHQgYXdheSkNCj4+ID4+
ID4+IHNvIHRoYXQgdnBjaSByZW1vdmFsIGNhbiBiZSBwZXJmb3JtZWQgd2hpbGUgaG9sZGluZyB0
aGUgbG9jayBpbiB3cml0ZQ0KPj4gPj4gPj4gbW9kZS4gUHJldmlvdXNseSBzdWNoIHJlbW92YWwg
Y291bGQgcmFjZSB3aXRoIHZwY2lfcmVhZCBmb3IgZXhhbXBsZS4NCj4+ID4+ID4+IA0KPj4gPj4g
Pj4gMS4gUGVyLWRvbWFpbidzIHZwY2lfcndsb2NrIGlzIHVzZWQgdG8gcHJvdGVjdCBwZGV2LT52
cGNpIHN0cnVjdHVyZQ0KPj4gPj4gPj4gZnJvbSBiZWluZyByZW1vdmVkLg0KPj4gPj4gPj4gDQo+
PiA+PiA+PiAyLiBXcml0aW5nIHRoZSBjb21tYW5kIHJlZ2lzdGVyIGFuZCBST00gQkFSIHJlZ2lz
dGVyIG1heSB0cmlnZ2VyDQo+PiA+PiA+PiBtb2RpZnlfYmFycyB0byBydW4sIHdoaWNoIGluIHR1
cm4gbWF5IGFjY2VzcyBtdWx0aXBsZSBwZGV2cyB3aGlsZQ0KPj4gPj4gPj4gY2hlY2tpbmcgZm9y
IHRoZSBleGlzdGluZyBCQVIncyBvdmVybGFwLiBUaGUgb3ZlcmxhcHBpbmcgY2hlY2ssIGlmIGRv
bmUNCj4+ID4+ID4+IHVuZGVyIHRoZSByZWFkIGxvY2ssIHJlcXVpcmVzIHZwY2ktPmxvY2sgdG8g
YmUgYWNxdWlyZWQgb24gYm90aCBkZXZpY2VzDQo+PiA+PiA+PiBiZWluZyBjb21wYXJlZCwgd2hp
Y2ggbWF5IHByb2R1Y2UgYSBkZWFkbG9jay4gSXQgaXMgbm90IHBvc3NpYmxlIHRvDQo+PiA+PiA+
PiB1cGdyYWRlIHJlYWQgbG9jayB0byB3cml0ZSBsb2NrIGluIHN1Y2ggYSBjYXNlLiBTbywgaW4g
b3JkZXIgdG8gcHJldmVudA0KPj4gPj4gPj4gdGhlIGRlYWRsb2NrLCBjaGVjayB3aGljaCByZWdp
c3RlcnMgYXJlIGdvaW5nIHRvIGJlIHdyaXR0ZW4gYW5kIGFjcXVpcmUNCj4+ID4+ID4+IHRoZSBs
b2NrIGluIHRoZSBhcHByb3ByaWF0ZSBtb2RlIGZyb20gdGhlIGJlZ2lubmluZy4NCj4+ID4+ID4+
IA0KPj4gPj4gPj4gQWxsIG90aGVyIGNvZGUsIHdoaWNoIGRvZXNuJ3QgbGVhZCB0byBwZGV2LT52
cGNpIGRlc3RydWN0aW9uIGFuZCBkb2VzIG5vdA0KPj4gPj4gPj4gYWNjZXNzIG11bHRpcGxlIHBk
ZXZzIGF0IHRoZSBzYW1lIHRpbWUsIGNhbiBzdGlsbCB1c2UgYSBjb21iaW5hdGlvbiBvZiB0aGUN
Cj4+ID4+ID4+IHJlYWQgbG9jayBhbmQgcGRldi0+dnBjaS0+bG9jay4NCj4+ID4+ID4+IA0KPj4g
Pj4gPj4gMy4gT3B0aW1pemUgaWYgUk9NIEJBUiB3cml0ZSBsb2NrIHJlcXVpcmVkIGRldGVjdGlv
biBieSBjYWNoaW5nIG9mZnNldA0KPj4gPj4gPj4gb2YgdGhlIFJPTSBCQVIgcmVnaXN0ZXIgaW4g
dnBjaS0+aGVhZGVyLT5yb21fcmVnIHdoaWNoIGRlcGVuZHMgb24NCj4+ID4+ID4+IGhlYWRlcidz
IHR5cGUuDQo+PiA+PiA+PiANCj4+ID4+ID4+IDQuIFJlZHVjZSBsb2NrZWQgcmVnaW9uIGluIHZw
Y2lfcmVtb3ZlX2RldmljZSBhcyBpdCBpcyBub3cgcG9zc2libGUNCj4+ID4+ID4+IHRvIHNldCBw
ZGV2LT52cGNpIHRvIE5VTEwgZWFybHkgcmlnaHQgYWZ0ZXIgdGhlIHdyaXRlIGxvY2sgaXMgYWNx
dWlyZWQuDQo+PiA+PiA+PiANCj4+ID4+ID4+IDUuIFJlZHVjZSBsb2NrZWQgcmVnaW9uIGluIHZw
Y2lfYWRkX2hhbmRsZXJzIGFzIGl0IGlzIHBvc3NpYmxlIHRvDQo+PiA+PiA+PiBpbml0aWFsaXpl
IG1hbnkgbW9yZSBmaWVsZHMgb2YgdGhlIHN0cnVjdCB2cGNpIGJlZm9yZSBhc3NpZ25pbmcgaXQg
dG8NCj4+ID4+ID4+IHBkZXYtPnZwY2kuDQo+PiA+PiA+PiANCj4+ID4+ID4+IDYuIHZwY2lfe2Fk
ZHxyZW1vdmV9X3JlZ2lzdGVyIGFyZSByZXF1aXJlZCB0byBiZSBjYWxsZWQgd2l0aCB0aGUgd3Jp
dGUgbG9jaw0KPj4gPj4gPj4gaGVsZCwgYnV0IGl0IGlzIG5vdCBmZWFzaWJsZSB0byBhZGQgYW4g
YXNzZXJ0IHRoZXJlIGFzIGl0IHJlcXVpcmVzDQo+PiA+PiA+PiBzdHJ1Y3QgZG9tYWluIHRvIGJl
IHBhc3NlZCBmb3IgdGhhdC4gU28sIGFkZCBhIGNvbW1lbnQgYWJvdXQgdGhpcyByZXF1aXJlbWVu
dA0KPj4gPj4gPj4gdG8gdGhlc2UgYW5kIG90aGVyIGZ1bmN0aW9ucyB3aXRoIHRoZSBlcXVpdmFs
ZW50IGNvbnN0cmFpbnRzLg0KPj4gPj4gPj4gDQo+PiA+PiA+PiA3LiBEcm9wIGNvbnN0IHF1YWxp
ZmllciB3aGVyZSB0aGUgbmV3IHJ3bG9jayBpcyB1c2VkIGFuZCB0aGlzIGlzIGFwcHJvcHJpYXRl
Lg0KPj4gPj4gPj4gDQo+PiA+PiA+PiA4LiBEbyBub3QgY2FsbCBwcm9jZXNzX3BlbmRpbmdfc29m
dGlycXMgd2l0aCBhbnkgbG9ja3MgaGVsZC4gRm9yIHRoYXQgdW5sb2NrDQo+PiA+PiA+PiBwcmlv
ciB0aGUgY2FsbCBhbmQgcmUtYWNxdWlyZSB0aGUgbG9ja3MgYWZ0ZXIuIEFmdGVyIHJlLWFjcXVp
cmluZyB0aGUNCj4+ID4+ID4+IGxvY2sgdGhlcmUgaXMgbm8gbmVlZCB0byBjaGVjayBpZiBwZGV2
LT52cGNpIGV4aXN0czoNCj4+ID4+ID4+ICAtIGluIGFwcGx5X21hcCBiZWNhdXNlIG9mIHRoZSBj
b250ZXh0IGl0IGlzIGNhbGxlZCAobm8gcmFjZSBjb25kaXRpb24NCj4+ID4+ID4+ICAgIHBvc3Np
YmxlKQ0KPj4gPj4gPj4gIC0gZm9yIE1TSS9NU0ktWCBkZWJ1ZyBjb2RlIGJlY2F1c2UgaXQgaXMg
Y2FsbGVkIGF0IHRoZSBlbmQgb2YNCj4+ID4+ID4+ICAgIHBkZXYtPnZwY2kgYWNjZXNzIGFuZCBu
byBmdXJ0aGVyIGFjY2VzcyB0byBwZGV2LT52cGNpIGlzIG1hZGUNCj4+ID4+ID4+IA0KPj4gPj4g
Pj4gOS4gQ2hlY2sgZm9yICFwZGV2LT52cGNpIGluIHZwY2lfe3JlYWR8d3JpdGV9IGFmdGVyIGFj
cXVpcmluZyB0aGUgbG9jaw0KPj4gPj4gPj4gYW5kIGlmIHNvLCBhbGxvdyByZWFkaW5nIG9yIHdy
aXRpbmcgdGhlIGhhcmR3YXJlIHJlZ2lzdGVyIGRpcmVjdGx5LiBUaGlzIGlzDQo+PiA+PiA+PiBh
Y2NlcHRhYmxlIGFzIHdlIG9ubHkgZGVhbCB3aXRoIERvbTAgYXMgb2Ygbm93LiBPbmNlIERvbVUg
c3VwcG9ydCBpcw0KPj4gPj4gPj4gYWRkZWQgdGhlIHdyaXRlIHdpbGwgbmVlZCB0byBiZSBpZ25v
cmVkIGFuZCByZWFkIHJldHVybiBhbGwgMCdzIGZvciB0aGUNCj4+ID4+ID4+IGd1ZXN0cywgd2hp
bGUgRG9tMCBjYW4gc3RpbGwgYWNjZXNzIHRoZSByZWdpc3RlcnMgZGlyZWN0bHkuDQo+PiA+PiA+
PiANCj4+ID4+ID4+IDEwLiBJbnRyb2R1Y2UgcGNpZGV2c190cnlsb2NrLCBzbyB0aGVyZSBpcyBh
IHBvc3NpYmlsaXR5IHRvIHRyeSBsb2NraW5nDQo+PiA+PiA+PiB0aGUgcGNpZGV2J3MgbG9jay4N
Cj4+ID4+ID4+IA0KPj4gPj4gPj4gMTEuIFVzZSBwY2lkZXYncyBsb2NrIGFyb3VuZCBmb3JfZWFj
aF9wZGV2IGFuZCBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluDQo+PiA+PiA+PiB3aGlsZSBhY2Nlc3Np
bmcgcGRldnMgaW4gdnBjaSBjb2RlLg0KPj4gPj4gPj4gDQo+PiA+PiA+PiAxMi4gVGhpcyBpcyBi
YXNlZCBvbiB0aGUgZGlzY3Vzc2lvbiBhdCBbMV0uDQo+PiA+PiA+PiANCj4+ID4+ID4+IFsxXSBo
dHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjIwMjA0MDYzNDU5LjY4MDk2MS00LWFuZHIyMDAwQGdtYWlsLmNvbS9fXzshIUdGXzI5ZGJjUUlV
QlBBIXpQeTMxQ1dGV2x5QzB4aEVIaVNqNnJPUGU3UkRTakxyYW5JOUtacWhHNHNzbUNoSk1XdnNQ
TEpQUUdUY1Zzbm5vd1pwUDgtTGFLSmtJV0l6Yjh1ZTBEb1loZyQgW2xvcmVbLl1rZXJuZWxbLl1v
cmddDQo+PiA+PiA+PiANCj4+ID4+ID4+IFN1Z2dlc3RlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiA+PiA+PiBTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+ID4+ID4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+ID4+ID4N
Cj4+ID4+ID4gVGhhbmtzLg0KPj4gPj4gPg0KPj4gPj4gPiBJIGhhdmVuJ3QgbG9va2VkIGluIGZ1
bGwgZGV0YWlsLCBidXQgSSdtIGFmcmFpZCB0aGVyZSdzIGFuIEFCQkENCj4+ID4+ID4gZGVhZGxv
Y2sgd2l0aCB0aGUgcGVyLWRvbWFpbiB2cGNpIGxvY2sgYW5kIHRoZSBwY2lkZXZzIGxvY2sgaW4N
Cj4+ID4+ID4gbW9kaWZ5X2JhcnMoKSB2cyAgdnBjaV9hZGRfaGFuZGxlcnMoKSBhbmQgdnBjaV9y
ZW1vdmVfZGV2aWNlKCkuDQo+PiA+PiA+DQo+PiA+PiA+IEkndmUgbWFkZSBzb21lIGNvbW1lbnRz
IGJlbG93Lg0KPj4gPj4gDQo+PiA+PiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuIEkgYmVsaWV2
ZSB0aGF0IGl0IGlzIGEgZ29vZCBpZGVhIHRvIGhhdmUgYQ0KPj4gPj4gcGVyLWRvbWFpbiBwZGV2
X2xpc3QgbG9jay4gU2VlIG15IGFuc3dlcnMgYmVsb3cuDQo+PiA+DQo+PiA+IEkgdGhpbmsgaXQn
cyBpbXBvcnRhbnQgdGhhdCB0aGUgbG9jayB0aGF0IHByb3RlY3RzIGRvbWFpbi0+cGRldl9saXN0
DQo+PiA+IG11c3QgYmUgdGhlIHNhbWUgdGhhdCBhbHNvIHByb3RlY3RzIHBkZXYtPnZwY2ksIG9y
IGVsc2UgeW91IG1pZ2h0IHJ1bg0KPj4gPiBpbnRvIHNpbWlsYXIgQUJCQSBkZWFkbG9jayBzaXR1
YXRpb25zLg0KPj4gPg0KPj4gPiBUaGUgcHJvYmxlbSB0aGVuIGNvdWxkIGJlIHRoYXQgaW4gdnBj
aV97cmVhZCx3cml0ZX0geW91IHdpbGwgdGFrZSB0aGUNCj4+ID4gcGVyLWRvbWFpbiBwZGV2IGxv
Y2sgaW4gcmVhZCBtb2RlIGluIG9yZGVyIHRvIGdldCB0aGUgcGRldiwgYW5kIGZvcg0KPj4gPiB3
cml0ZXMgdG8gdGhlIGNvbW1hbmQgcmVnaXN0ZXIgb3IgdGhlIFJPTSBCQVIgeW91IHdvdWxkIGhh
dmUgdG8NCj4+ID4gdXBncmFkZSBzdWNoIGxvY2sgdG8gYSB3cml0ZSBsb2NrIHdpdGhvdXQgZHJv
cHBpbmcgaXQsIGFuZCB3ZSBkb24ndA0KPj4gPiBoYXZlIHN1Y2ggZnVuY3Rpb25hbGl0eSBmb3Ig
cncgbG9ja3MgQVRNLg0KPj4gPg0KPj4gPiBNYXliZSBqdXN0IHJlLXN0YXJ0aW5nIHRoZSBmdW5j
dGlvbiBrbm93aW5nIHRoYXQgdGhlIGxvY2sgbXVzdCBiZQ0KPj4gPiB0YWtlbiBpbiB3cml0ZSBt
b2RlIHdvdWxkIGJlIGEgZ29vZCBzb2x1dGlvbjogd3JpdGVzIHRvIHRoZSBjb21tYW5kDQo+PiA+
IHJlZ2lzdGVyIHdpbGwgYWxyZWFkeSBiZSBzbG93IHNpbmNlIHRoZXkgYXJlIGxpa2VseSB0byBp
bnZvbHZlDQo+PiA+IG1vZGlmaWNhdGlvbnMgdG8gdGhlIHAybS4NCj4+IA0KPj4gTG9va3MgbGlr
ZSBtb2RpZnlfYmFycygpIGlzIHRoZSBvbmx5IGNhdXNlIGZvciB0aGlzIGV4dGVuZGVkIGxvY2su
IEkNCj4+IGtub3cgdGhhdCB0aGlzIHdhcyBkaXNjdXNzZWQgZWFybGllciwgYnV0IGNhbiB3ZSBy
ZXdvcmsgbW9kaWZ5X2JhcnMgdG8NCj4+IG5vdCBpdGVyYXRlIG92ZXIgYWxsIHRoZSBwZGV2cz8g
V2UgY2FuIHN0b3JlIGNvcHkgb2YgYWxsIGVuYWJsZWQgQkFScyBpbg0KPj4gYSBkb21haW4gc3Ry
dWN0dXJlLCBwcm90ZWN0ZWQgYnkgZG9tYWluLT52cGNpX2xvY2suIFNvbWV0aGluZyBha2luIHRv
DQo+PiANCj4+IHN0cnVjdCB2cGNpX2JhciB7DQo+PiAgICAgICAgIGxpc3RfaGVhZCBsaXN0Ow0K
Pj4gICAgICAgICBzdHJ1Y3QgdnBjaSAqdnBjaTsNCj4+ICAgICAgICAgdW5zaWduZWQgbG9uZyBz
dGFydDsNCj4+ICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQ7DQo+PiAgICAgICAgIGJvb2wgaXNf
cm9tOw0KPj4gfTsNCj4NCj4gVGhpcyBJTU8gbWFrZXMgdGhlIGxvZ2ljIG1vcmUgY29tcGxpY2F0
ZWQsIGFzIGVhY2ggdGltZSBhIEJBUiBpcw0KPiB1cGRhdGVkIHdlIHdvdWxkIGhhdmUgdG8gY2hh
bmdlIHRoZSBjYWNoZWQgYWRkcmVzcyBhbmQgc2l6ZSBpbiB0d28NCj4gZGlmZmVyZW50IHBsYWNl
cy4gIEl0J3MgYWxzbyBkdXBsaWNhdGVkIGRhdGEgdGhhdCB0YWtlcyB1cCBtZW1vcnksIGFuZA0K
PiB0aGVyZSBhcmUgc3lzdGVtIHdpdGggYSBub24tdHJpdmlhbCBhbW91bnQgb2YgUENJIGRldmlj
ZXMgYW5kIHRodXMNCj4gQkFScyB0byB0cmFjay4NCj4NCj4gSSB0aGluayBpdCdzIGVhc2llciB0
byBqdXN0IG1ha2UgdGhlIG5ld2x5IGludHJvZHVjZWQgcGVyLWRvbWFpbg0KPiByd2xvY2sgYWxz
byBwcm90ZWN0IHRoZSBkb21haW4ncyBwZGV2X2xpc3QgKHVubGVzcyBJJ20gbWlzc2luZw0KPiBz
b21ldGhpbmcpLiAgQUZBSUNUIGl0IHdvdWxkIGFsc28gc2ltcGxpZnkgbG9ja2luZywgYXMgc3Vj
aCByd2xvY2sNCj4gcHJvdGVjdGluZyB0aGUgZG9tYWluLT5wZGV2X2xpc3Qgd2lsbCBhdm9pZCB5
b3UgZnJvbSBoYXZpbmcgdG8gdGFrZQ0KPiB0aGUgcGNpZGV2cyBsb2NrIGluIHZwY2lfe3JlYWQs
d3JpdGV9IGluIG9yZGVyIHRvIGZpbmQgdGhlIGRldmljZSB0aGUNCj4gYWNjZXNzIGJlbG9uZ3Mg
dG8uDQoNCkkgYW0gY3VycmVudGx5IGltcGxlbWVudGluZyB5b3VyIHByb3Bvc2FsIChhbG9uZyB3
aXRoIEphbidzDQpzdWdnZXN0aW9ucyksIGJ1dCBJIGFtIGZhY2luZyBBQkJBIGRlYWRsb2NrIHdp
dGggSU9NTVUncw0KcmVhc3NpZ25fZGV2aWNlKCkgY2FsbCwgd2hpY2ggaGFzIHRoaXMgcGllY2Ug
b2YgY29kZToNCg0KICAgICAgICBsaXN0X21vdmUoJnBkZXYtPmRvbWFpbl9saXN0LCAmdGFyZ2V0
LT5wZGV2X2xpc3QpOw0KDQpNeSBpbW1lZGlhdGUgY2hhbmdlIHdhczoNCg0KICAgICAgICB3cml0
ZV9sb2NrKCZwZGV2LT5kb21haW4tPnBjaV9sb2NrKTsNCiAgICAgICAgbGlzdF9kZWwoJnBkZXYt
PmRvbWFpbl9saXN0KTsNCiAgICAgICAgd3JpdGVfdW5sb2NrKCZwZGV2LT5kb21haW4tPnBjaV9s
b2NrKTsNCg0KICAgICAgICB3cml0ZV9sb2NrKCZ0YXJnZXQtPnBjaV9sb2NrKTsNCiAgICAgICAg
bGlzdF9hZGQoJnBkZXYtPmRvbWFpbl9saXN0LCAmdGFyZ2V0LT5wZGV2X2xpc3QpOw0KICAgICAg
ICB3cml0ZV91bmxvY2soJnRhcmdldC0+cGNpX2xvY2spOw0KDQpCdXQgdGhpcyB3aWxsIG5vdCB3
b3JrIGJlY2F1c2UgcmVhc3NpZ25fZGV2aWNlIGlzIGNhbGxlZCBmcm9tDQpwY2lfcmVsZWFzZV9k
ZXZpY2VzKCkgd2hpY2ggaXRlcmF0ZXMgb3ZlciBkLT5wZGV2X2xpc3QsIHNvIHdlIG5lZWQgdG8N
CnRha2UgYSBkLT5wY2lfbG9jayBlYXJseS4NCg0KQW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBm
aXggdGhpcz8gTXkgaWRlYSBpcyB0byByZW1vdmUgYSBkZXZpY2UgZnJvbSBhDQpsaXN0IG9uZSBh
dCB0aW1lOg0KDQppbnQgcGNpX3JlbGVhc2VfZGV2aWNlcyhzdHJ1Y3QgZG9tYWluICpkKQ0Kew0K
ICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KICAgIHU4IGJ1cywgZGV2Zm47DQogICAgaW50IHJl
dDsNCg0KICAgIHBjaWRldnNfbG9jaygpOw0KICAgIHdyaXRlX2xvY2soJmQtPnBjaV9sb2NrKTsN
CiAgICByZXQgPSBhcmNoX3BjaV9jbGVhbl9waXJxcyhkKTsNCiAgICBpZiAoIHJldCApDQogICAg
ew0KICAgICAgICBwY2lkZXZzX3VubG9jaygpOw0KICAgICAgICB3cml0ZV91bmxvY2soJmQtPnBj
aV9sb2NrKTsNCiAgICAgICAgcmV0dXJuIHJldDsNCiAgICB9DQoNCiAgICB3aGlsZSAoICFsaXN0
X2VtcHR5KCZkLT5wZGV2X2xpc3QpICkNCiAgICB7DQogICAgICAgIHBkZXYgPSBsaXN0X2VudHJ5
KCZkLT5wZGV2X2xpc3QsIHN0cnVjdCBwY2lfZGV2LCBkb21haW5fbGlzdCk7DQogICAgICAgIGJ1
cyA9IHBkZXYtPmJ1czsNCiAgICAgICAgZGV2Zm4gPSBwZGV2LT5kZXZmbjsNCiAgICAgICAgbGlz
dF9kZWwoJnBkZXYtPmRvbWFpbl9saXN0KTsNCiAgICAgICAgd3JpdGVfdW5sb2NrKCZkLT5wY2lf
bG9jayk7DQogICAgICAgIHJldCA9IGRlYXNzaWduX2RldmljZShkLCBwZGV2LT5zZWcsIGJ1cywg
ZGV2Zm4pID86IHJldDsNCiAgICAgICAgd3JpdGVfbG9jaygmZC0+cGNpX2xvY2spOw0KICAgIH0N
CiAgICB3cml0ZV91bmxvY2soJmQtPnBjaV9sb2NrKTsNCiAgICBwY2lkZXZzX3VubG9jaygpOw0K
DQogICAgcmV0dXJuIHJldDsNCn0NCg0KQnV0IGl0IGlzIHVnbHkgc29tZXdoYXQuDQoNCg0KLS0g
DQpXQlIsIFZvbG9keW15cg==

