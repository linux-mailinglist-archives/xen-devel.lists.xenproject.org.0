Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB3A4B6C8E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 13:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273112.468181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxCK-0005Zr-QT; Tue, 15 Feb 2022 12:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273112.468181; Tue, 15 Feb 2022 12:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJxCK-0005Y2-NJ; Tue, 15 Feb 2022 12:44:48 +0000
Received: by outflank-mailman (input) for mailman id 273112;
 Tue, 15 Feb 2022 12:44:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOiq=S6=epam.com=prvs=4045782cdb=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJxCJ-0005Xw-0Y
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 12:44:47 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c9b7ca1-8e5d-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 13:44:45 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FCLhJi000540;
 Tue, 15 Feb 2022 12:44:40 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e8c44g2w6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 12:44:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3970.eurprd03.prod.outlook.com (2603:10a6:208:73::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 12:44:35 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 12:44:35 +0000
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
X-Inumbo-ID: 0c9b7ca1-8e5d-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aY5GIhPUlEuQJfbGZsALbBEw4zp/rTd2GUQQ92MgaJX848N05jV0EYsxSbJp8D/IjlPkh9pGM+V7AZVnjBPJG97GlpuWVmyRTzD0AKnohD8SMYpQ9/Ozyih59L/tj8JPKon6MEjGV6ywR3QohuvAT+V8tSSvgAi+/WztVxC9qXpYwmJnQ4IbJ8I+MdHhXUPziKzt9rodTf26I+3mID6Zk9XS6E1CcGeCnSerDc+VnKBPxIRiyodV0krAkMkyAi6aOz3TIspIAVQa7PpklnvX1LwCuQb3WnIo0mOplf7hYotmkoioqGt7NfRY7L4Mj3GSwNZJc/3WoFSMLf2dqenKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/8wOfS7JIg+pQSfbhLxI/OXivap1yWICDnRSbbQeU0=;
 b=SIEDZ5uvWLBNyG3jDvYOP59ECCZdTVdF30LrLZif9O53I+WzNU0SseHLXB1zF9OW6ECMX6Za0JacU8WALHjGlFKwcaFfxvdkTmKqUkuj2YMbQMEqk5snkiiUe2ISGnILNb+4xIyktWaIms1MIGsRcLPsU551gOzJyegq6G8bxthcOMT8ZYNQaPPtYBdtEjtLBG2CU4X+YjtXSEot+78EE2crsCt+KnmIEp8sM/Wh2bZg+h7Ms4vbLHm4zfQ/TmSAhyVfWApBQB7XwceUa1w+4mf5SZzmsrPqk79ltiQ4xG1pTUKREL5jSTzDpNXMbiwHMDMhNB55V1H0lrtay1QEXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/8wOfS7JIg+pQSfbhLxI/OXivap1yWICDnRSbbQeU0=;
 b=qHMsJNnL3IdhLym3n3ddsN4XKZuqBVlCSXnC+1piJuU8dPeDcVReLdvW7rFLHEImU1Czy30UBg0CYBDl83HprNG52pwF8wpv3PXVEz+a/j1HNTpmWwV+uASL6DnOGzUxE6x1jmVq8+g/06G5NzsQfmgIKE2B2chAJkafsT6Dqwtw2zuVTVhyJ7mMedlcMmZ/aUBoC89RPk2daoaYpZGOtaZcANaGirnJ4Uhnc4luI+QC3ltcnCFDLwlZhNl6WbR7MOheF7blqBcS8rJ9g1fQOcgF0x/n50KT4hA7W24J3B1e0qe9AIdR2L+ray1ShXOfN3f5iVbsrNS38au6KbDRuw==
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
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Rahul Singh <rahul.singh@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHYIkOs9pmsZb0l5kefj1m3qdTVCayUboeAgAAGwYCAAAeVgIAAAZQAgAABlwCAAAEVAIAADewA
Date: Tue, 15 Feb 2022 12:44:35 +0000
Message-ID: <22d25499-cab0-00c1-3ad3-bddd74c97a55@epam.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
 <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
 <YguQ8wfhfYFXTWSU@Air-de-Roger>
 <70dbd7fd-3f74-d0d3-6e30-c1e1e24fc279@epam.com>
 <0d8f01b2-b015-a08e-dd49-e9c688ff7245@suse.com>
 <bbb36ebc-de66-297d-f82f-abc0e63f20a2@epam.com>
In-Reply-To: <bbb36ebc-de66-297d-f82f-abc0e63f20a2@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad176782-c802-4c33-47fe-08d9f080ebf6
x-ms-traffictypediagnostic: AM0PR03MB3970:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB3970BC7D4689A27F5AA1143CE7349@AM0PR03MB3970.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AOngDir5mKROe3f+rKbxXxTWJ6YsxrtNZTktAHYFRO6l2rapL3R0yN89+Sbc3RR7l+RWEGEgiR79H988Zr0yORXndKTw277Z88GvoQOPZ018n5Yq0a61CYpcHyQPqqQAN49tQY25tQeTsJNyiVxD+8ATOayo1PUTdaDmxf3Dhvp1eCstMM+Xjrw0xk73UvTOaqCRtvlWaKlMzVi7bU5zEMpGOAz1XlDaeThH5wkPabmHxoO6d91U6X941GEdvrDwm08atiGM20AOHCgXC8efObYPodHSI90iYfbwdsCdhv+MTrR+i9KZEqDYlpDrKVqoN1A338yQKsleofwOIRWG2oncNlT/MGcxPYR9Setqr+cJEVD9DWoRl6vBv+xwW4rGehrfvushoFI+IaO3U6stUgR97tOpd46orxKzlK60f1jvsJT9HVx0l5A4F7gnq2K0wRf7FHAUkhoEELXziwVKi/zpEmt90XmflJuSnq0w1V4d0d/QTtQOseMgUbAv30Qa0JXfS/q1fzbrHMxTaxnVcrmCO7CUPGOtNLQJ+gzbEKXnskevAGs2DfJXjDZiVvhC0XDx1SCCgY9nr2QZyh/OE5NIYbeJbjZrnAJCJtiLDp+PtB6b/udy/I9gEFqV8mlKtXXAwStcLt11zdVfYj3wE8Y2szVB2Pr9OcpqjZbpxfcFUKgptycoSWvd9l3/w2Y120J7sygPkq9k0O6wQzL7v8Ez0C63XY0+0zUSxWY6Pbp06Hsdz+50+OyQxA13Qv6O
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(31686004)(6916009)(26005)(186003)(54906003)(36756003)(316002)(31696002)(86362001)(2616005)(66556008)(5660300002)(2906002)(38070700005)(66476007)(55236004)(53546011)(91956017)(8676002)(64756008)(76116006)(6512007)(66446008)(4326008)(508600001)(6486002)(38100700002)(8936002)(66946007)(71200400001)(6506007)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NTNsQnVkZkIxT0tRSXZwb2NsbTdtQStzc2lzc3JEVmxvSmxtV1FNZ2Z4RENn?=
 =?utf-8?B?bjloRkNZTXRIY2pMclcxaEpoQXBoWjdXUTVaNDZzKzhVQUZ4UWY3OTc4RU9D?=
 =?utf-8?B?MkVYUk5zdzd3MS9xVFdaaDNuWlF4dUdzMnk0SGhxWi84OEVjV3ZoNVFJRWtH?=
 =?utf-8?B?RitYUUhkZnNvNGtNZU5KNytuSVo4SWREQWRwNm1VT0JaQXdoMyt5NHNxc2xL?=
 =?utf-8?B?eDcrN25EUjArcVdMU1c0cEU2dnBFOXJPQyt1USt4TytqcWkrcFBQc2FpSCsr?=
 =?utf-8?B?MEQzRVJhWVFYL1ZRYXU0Q2xpTDFVZWVKWXZmTTZFUmRhaG8xS2Z2eVZ3dTRu?=
 =?utf-8?B?UW5Ra1lJcXdRZHZYQ2FmVmJQWHg1TzBDVHp6NnRKc245bjAxNDhPMTQ4Q3NR?=
 =?utf-8?B?OXdPeVhRSUtMeUY5MVJVK3d1eWVlRmdISnNtajEycWMrZ0hRQnJMSVg3VndX?=
 =?utf-8?B?QjQ3RHNET2hyaW9rMUVXVVVHK0wxNDhlQ2dTOEpBUG5idFNaTE9QYkkwOVJO?=
 =?utf-8?B?OHRWMjVTY1J5ZkdQY0lyYXZsbHB6WW91Um8zL1k1LzBmeHM3YU56aGROM1JM?=
 =?utf-8?B?NTUxSjFZbWdFaU1MN1BJT1Y4U0QvVU84MkI5Yk1JN0FCNzlVQTlVR2pld0dj?=
 =?utf-8?B?b3V5SkZzanlYWEpFR1cya1A4UHJnN2FIT3VLRlJiQXRublB3YlEyUUFRWElu?=
 =?utf-8?B?dWVhUHNZT2pyYU4xZkUwcmtyVWJHenk1OTZTY1A5K2YzOE9HYkJFNGFxWmor?=
 =?utf-8?B?M3BtcWJxV2lkQVZRdndkM0pSUVRtdXVXUmphVVlqY3MwR1kxVjJabG01b3dv?=
 =?utf-8?B?QldZUGNsZEFzRGdxT29KWnpjM1dURkYybisvcjZiVDVWZXVhcjdnVjFQMmla?=
 =?utf-8?B?QjExcEhROUFnZ3ExcUdES0F6eFd2a3VFcW5BRFJ6M3cxRFNiSGxOTzRNdmZH?=
 =?utf-8?B?L1daSmZBYjBzY2RXcFQwOHdzTEthR29rMHQvRTZ4VHdiMmtsUmxwUFVuQTVG?=
 =?utf-8?B?eFdJSmk3djUzbERESWNROEU0MktXMDRoekJYTlhIZmVub0JucGJ0VFRZbW9U?=
 =?utf-8?B?dGRVVjIwYk9ueGJ6TlREeXZ4T1VLKy9lUjVNYkZ6QXl0YTQxUm5uSGtsOWV6?=
 =?utf-8?B?U1B2Vkh2TVhCbkhqd1pNdHcxbktqcHdFM0hrVVFFUitQZGhtTW1TTzlCdTJR?=
 =?utf-8?B?T2pvekNtUVhmQWtoK1dLdTBjQzJWbjJidzR3WGtqR1ZKTHVPS21CbEo0OFNB?=
 =?utf-8?B?Zy82VzRZNTRFL2RabXF2WWI2azc5bXJVby9xVFFCU085NjYwdmZjK3YyVmNS?=
 =?utf-8?B?dlVkdHdTVjdIRFRuZTQwUmNjdUd6VDVXNGRwMHNBMFZvQjM1VDFIbndRajYx?=
 =?utf-8?B?R1QwZHhtM0MzVkxGV0NzYnhoRE9JekJSMWNSNTRJSHRxNVFNYnlCNGQ0NjRU?=
 =?utf-8?B?cGZSMEZ3dkswVTFvUjV3eWhkeFZlUHd5Qmg0SEhCNEMwUjFkeDBJTUt6Uyth?=
 =?utf-8?B?ZjhlWTRaZ1hLQnhTamFZb2FzNzJVT3d5L1dqSnJsUlc5OVorMi9Ja2RySmM3?=
 =?utf-8?B?OXM4RWRlTWJ3a2lLSkNEekpKZWpnSUZwT2cwcmJmSkNhWXdWckNEOTZNSlRz?=
 =?utf-8?B?SWJtaDJKVG9PbEhoQU5ER1FSSDlxYi9sb2VNdFJlaUI5MjNRbzQ4cUdQZWcz?=
 =?utf-8?B?MldhNUwzaU5jMXI4UmxwR0NpNVQ3T1VoQyt3eVJ1WUhFVlhoa0RBZHcxN3Zo?=
 =?utf-8?B?d3VBNmFwUmZ0dk1OdHVnbVJlelBXN09sNDBaaG5HYW9HQWJRQmVYTFZqSHUx?=
 =?utf-8?B?NTF2RE9scU5jWE9KM1JmYVplSDhkY2lFYllMcWFXZWxwTkE5eVIwbzVyR0J5?=
 =?utf-8?B?SDlMU1dWcUhBelhJVzh2YXc2WTRtbGJzZzRsdnI5Uk5hSTJLek5ySTJYb3E0?=
 =?utf-8?B?ZVBTU2w5VXl4OGo3VzRrOVcxQkdMcmVFRGY1NWhlUlltK2p1L2hyamFLUFRo?=
 =?utf-8?B?NHA1NHlEUlVvYzdEbmczUk9nRERoYVJSRDhWVDFsYUhRemwwTWNEa0QydXEz?=
 =?utf-8?B?NnAzOFhialE4eGxCQmd6Z2dsUmZGV3YyVlZIOXcxeXpXQ2N6US9qNXdtVUVo?=
 =?utf-8?B?aVl1UUptUG1ibWxrRFZxdUw4cWVkVTIwOEFOVGhPTWljVDFpMjV1RUxBcjNJ?=
 =?utf-8?B?bGpwSjIwYzVCRzVveEhHaURnMXlKOTlhazN6c0ZIRzYzLzI5OVU2MmVDUzlh?=
 =?utf-8?B?V3pOU1NHN3dVZWxRaXdSTzJUUVMyMCt2eHZBZEczNTk3eTI0WlBod0tOZ1FQ?=
 =?utf-8?B?a1hOU3R4T0l2MWhLbk1DK0Nab1RSVVhDaUdXcHVXQnFpdkZnQ0tiaFpTNlAr?=
 =?utf-8?Q?9rEP+vlrPyK508yM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE3CB83E5B61814C81BEBAFF6176ED72@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad176782-c802-4c33-47fe-08d9f080ebf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 12:44:35.3808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DxwK4XHTa0q1pFMw3fnDhyT85k/h27TguXkDN6rcr1Rz3AaHv55lomZSFOZPbCcpI8kshkhUYQ2fDlmRxcuwXyQ1ORGXmUnsxMdaL0lV12MoUgJ2kbjdEYmPKjgol0eU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3970
X-Proofpoint-ORIG-GUID: tPgPBExVioJw2vdhcadGCqhqxcG3bKZ2
X-Proofpoint-GUID: tPgPBExVioJw2vdhcadGCqhqxcG3bKZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 phishscore=0 mlxlogscore=991 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150073

DQoNCk9uIDE1LjAyLjIyIDEzOjU0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4N
Cj4gT24gMTUuMDIuMjIgMTM6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMTUuMDIuMjAy
MiAxMjo0NSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gSSdtIG9uIHlvdXIg
c2lkZSwgSSBqdXN0IHdhbnQgdG8gaGVhciB0aGF0IHdlIGFsbCBhZ3JlZSBwY2lkZXZzDQo+Pj4g
bmVlZHMgdG8gYmUgY29udmVydGVkIGludG8gcndsb2NrIGFjY29yZGluZyB3aXRoIHRoZSBwbGFu
IHlvdQ0KPj4+IHN1Z2dlc3RlZCBhbmQgYXQgbGVhc3Qgbm93IGl0IHNlZW1zIHRvIGJlIGFuIGFj
Y2VwdGFibGUgc29sdXRpb24uDQo+PiBJJ2QgbGlrZSB0byBleHByZXNzIHdvcnJpZXMgdGhvdWdo
IGFib3V0IHRoZSBjb252ZXJzaW9uIG9mIHRoaXMNCj4+IHJlY3Vyc2l2ZSBsb2NrIGludG8gYW4g
ci93IG9uZS4NCj4gQ291bGQgeW91IHBsZWFzZSBlbGFib3JhdGUgbW9yZSBvbiB0aGlzPw0KV2hh
dCBpZiB3ZSBqdXN0IGRvIHRoZSBmb2xsb3dpbmc6DQoNCnN0YXRpYyBzcGlubG9ja190IF9wY2lk
ZXZzX2xvY2sgPSBTUElOX0xPQ0tfVU5MT0NLRUQ7DQpzdGF0aWMgcndsb2NrX3QgREVGSU5FX1JX
TE9DSyhfcGNpZGV2c19yd2xvY2spOw0KDQp2b2lkIHBjaWRldnNfbG9jayh2b2lkKQ0Kew0KIMKg
wqDCoCByZWFkX2xvY2soJl9wY2lkZXZzX3J3bG9jayk7DQogwqDCoMKgIHNwaW5fbG9ja19yZWN1
cnNpdmUoJl9wY2lkZXZzX2xvY2spOw0KfQ0KDQp2b2lkIHBjaWRldnNfdW5sb2NrKHZvaWQpDQp7
DQogwqDCoMKgIHNwaW5fdW5sb2NrX3JlY3Vyc2l2ZSgmX3BjaWRldnNfbG9jayk7DQogwqDCoMKg
IHJlYWRfdW5sb2NrKCZfcGNpZGV2c19yd2xvY2spOw0KfQ0KDQp2b2lkIHBjaWRldnNfcmVhZF9s
b2NrKHZvaWQpDQp7DQogwqDCoMKgIHJlYWRfbG9jaygmX3BjaWRldnNfcndsb2NrKTsNCn0NCg0K
dm9pZCBwY2lkZXZzX3JlYWRfdW5sb2NrKHZvaWQpDQp7DQogwqDCoMKgIHJlYWRfdW5sb2NrKCZf
cGNpZGV2c19yd2xvY2spOw0KfQ0KDQp2b2lkIHBjaWRldnNfd3JpdGVfbG9jayh2b2lkKQ0Kew0K
IMKgwqDCoCB3cml0ZV9sb2NrKCZfcGNpZGV2c19yd2xvY2spOw0KfQ0KDQp2b2lkIHBjaWRldnNf
d3JpdGVfdW5sb2NrKHZvaWQpDQp7DQogwqDCoMKgIHdyaXRlX3VubG9jaygmX3BjaWRldnNfcnds
b2NrKTsNCn0NCg0KMS4gVGhpcyB3YXkgbW9zdCBvZiB0aGUgY29kZSBjb250aW51ZXMgdG8gdXNl
IHBjaWRldnNfe2xvY2t8dW5sb2NrfS4NCjIuIFdlIG5lZWQgdG8gY2hhbmdlIHdyaXRlcnMsIHRo
b3NlIHdoaWNoIGNhbiBhZGQgL3JlbW92ZSBwZGV2LCB0byB1c2UNCnBjaWRldnNfd3JpdGVfe3Vu
fWxvY2sNCjMuIFRob3NlLCB3aGljaCBkbyBub3QgbW9kaWZ5IHBkZXZzICh2cGNpX3tyZWFkfHdy
aXRlfSksIHdpbGwgdXNlDQpwY2lkZXZzX3JlYWRfbG9jaw0KNC4gV2UgZG8gbm90IGludHJvZHVj
ZSBkLT52cGNpX3J3bG9jayBhbmQgdXNlIHBjaWRldnNfe3JlYWR8d3JpdGV9X2xvY2sNCmFzIHZw
Y2kgZG9lc24ndCBzZWVtIHRvIG5lZWQgdG8gYWNxdWlyZSBfcGNpZGV2c19sb2NrICsgd2UgdXNl
IHBkZXYtPnZwY2ktPmxvY2sNCmFzIGl0IGlzIG5vdw0KDQpJcyB0aGlzIHNvbWV0aGluZyB3aGlj
aCBtYXkgYWRkcmVzcyB5b3VyIHdvcnJpZXM/DQoNClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

