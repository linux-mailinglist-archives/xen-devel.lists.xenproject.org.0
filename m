Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A8C459C5E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 07:32:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229127.396546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpPL6-0003lp-Rg; Tue, 23 Nov 2021 06:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229127.396546; Tue, 23 Nov 2021 06:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpPL6-0003jx-OV; Tue, 23 Nov 2021 06:31:36 +0000
Received: by outflank-mailman (input) for mailman id 229127;
 Tue, 23 Nov 2021 06:31:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRmA=QK=epam.com=prvs=19611c0f38=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpPL5-0003jp-PN
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 06:31:35 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fede887b-4c26-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 07:31:34 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AN6ScuD025373;
 Tue, 23 Nov 2021 06:31:25 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cgtck04v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 06:31:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5796.eurprd03.prod.outlook.com (2603:10a6:208:156::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 06:31:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 06:31:21 +0000
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
X-Inumbo-ID: fede887b-4c26-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTAmGdUUQztJCWnz8MKQNqzA5fdXliYnJDidnbL+y62wWBg9D6+AumncKfb7j5t0emqFzH/GqLE/s+YgT6LsuEYrdtQ+8U4WUBILODbrs2CR4KkP9Bpv3IXcaLogP1gLlOHN+Ez86+KvKM0vpG6SiGSIFrGy6X8Q8fj4iNANIQYPjm9vdZDFIpA8L8zH1QCsU1ckAx/Wv4w68mQAoRygAjL9zH3NbGJ82oq7/b5UQ5+C7An82ICZh+0z6oikiweKP/0dQPjJG9PAMf6MC79suPyiEE8BI+PfIDFMszpZF9Hp4c2sFr1+DyIx26YGqCAyCtzTPnFhBd/NFMmiaM3Tug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QZKKAAuuYqgyE0bopJIBTWg8TVr7KugEh4CsCa8GNM=;
 b=gb/MsEYJiNV/Hti1QqkZxhchSe9AOhpNWolk5mY5ojhyI35de6/f0Umkfp+ScJo4BeLi4qtGKtn8Y+Ozxb9U07F7lh1D1jS8UWgoFDGx7Updsex1fJXTCk9+HVPfxkJ9+4JdNxhoFri6cSAfzcOEITgfQtNw+/Ygu4t+FwVUZevQ/ZKKKt2z/l3gCugvLFvexgLbeiloataGlQ+m16QLDyt9XII+vLthAhhr/PSF2xvi8fIsIA5G0PMWwRz7ROLheB9KqNloE6OAuVR4GJxc75h/l90jyXaLJVInsXkuRFuqgEegMl7peojOaYJPiJ8HaCIHolUVqLvYD0tbaWnMVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QZKKAAuuYqgyE0bopJIBTWg8TVr7KugEh4CsCa8GNM=;
 b=rSSXk8dMBNnTyzBc6Ffd6R+ip3PH9Bw7YR+KPvqVnrOg28fR6at5EN4FpEI5nulZXpTsW+QOTvelfdzM6kwNbiTOB5YEvO6yx3xztmjlbjjM2Rwj+0LJMxyzJO3JIT/eiB6vevrnE+hka1FtvKyuOBGdCBb64oC/ZjQ4gbtjzJkFjxsH7Zby1WQbRNi3ZvjIAV6mGDNHoYZmwnWSWBbLVmoFwJ16wNpD1f6O6LjmcWI+inYHqfWJvEYHa9VMI4hkPUGLmqGeN0saTs+B7slRIQc7STyh8Cd4BnADDLgZytBmLRyb5ltH5bI9VJRLxkxte4iGdbEEntnx5hkm7BR4xA==
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
Subject: Re: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Thread-Topic: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Thread-Index: 
 AQHX0g8QVTbfP59mVU+LM2unTUGOtawGkRQAgADLYgCAAPUEgIAAofWAgAbUDQCAAA7WAIAADxaAgADd7IA=
Date: Tue, 23 Nov 2021 06:31:21 +0000
Message-ID: <0aff1bbb-eaf8-4deb-0808-d7db5f1ba8f5@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-3-andr2000@gmail.com>
 <86cabc8a-cbf2-84d4-4162-7d5591d127c5@xen.org>
 <de155886-d039-4c45-0407-47f38f8cd75d@epam.com>
 <ab95fc39-d1b2-be80-8245-85161a8271e1@xen.org>
 <072848c8-54da-cb73-3b8a-0c35826cc812@epam.com>
 <e66c4189-acdf-c32f-4b50-51c8aaab4efd@xen.org>
 <315b1308-5adc-c4f3-6150-1060dbac5f4f@epam.com>
 <9f8e424d-ad1c-2d32-a470-68b275adf22c@xen.org>
In-Reply-To: <9f8e424d-ad1c-2d32-a470-68b275adf22c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a06cb7a1-7442-45df-3903-08d9ae4add9c
x-ms-traffictypediagnostic: AM0PR03MB5796:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5796939C5ED0E27C4A9776F0E7609@AM0PR03MB5796.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EgqR0KePQrtr+oQu1C03r1Wz3RD58d0G8EiN626KuhhQ3seMv5d2s5CooridT8e0VGAz0krIyQfVRH714VCSa8eyCezXoYouzgWkttXipLGaBEkpOhFFaFjkJdFnJOccAYH9/PGaQo1tuDWCT4wyvE4rDVpmDEooFoKFChWGudNAVEyVXJGwMLrFJlyq0n6AB9Bobb1yVRlxKyqp/N5u0fiaLasXSlwsfw7eT+0Lf48YOC/rk2jsal3og56paSDSEJYacaaOr+B353jRM2PVxdW3oZCXwJiKINgFx69B/m4ITJ0EFGfZlo+t7iodwCqW7ojTKK2SS2nvIrtHMSfJc+GiTUIacrLXon3QdQVqk5kTKxI9cQRQoo/ON9ZsteCDc7IJXfgIeSdkiEVoRj3K74TyIbsT0sbtvhkGoSDdzOVUUgVvx9cTkEQ/zfubg+XqSPdaeZfbmbGH72xr4enXK9HXE2aM6umDU32EJWSEENJKeFsryXU0eOWQPcNKClO/AnIWppnMV7Cd/tg8YOXRgdeQNS7oLa7ZthCVNhbhK0K0hAHRxEIN/9qr+CGBC8IrOfNrRi4m16rlfzJLv9XluECFBuRUF/evkNTJkbjvLMXz7KfeaLm50FmUTealVUIe8c/q5gQDr0IkzrceHZf6FHSBz5efdSxI3A9JjTMDrVroqIVM0FMp5Ov5mEZTxgf1Rvo5izkERa6CgwBm2vea+CEEr8LgkUlEefRTPEhCyTpDoKjs1B082/G1JhOIC0N6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(107886003)(7416002)(54906003)(2616005)(110136005)(8936002)(6506007)(122000001)(53546011)(6512007)(31686004)(8676002)(36756003)(64756008)(186003)(38070700005)(91956017)(71200400001)(4326008)(31696002)(38100700002)(316002)(86362001)(6486002)(2906002)(76116006)(66476007)(66556008)(66446008)(66946007)(26005)(4744005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bTdiSWZHMVRMbmFjRWtaTm12ZmFOY25obkc4MGtEaTYrNkNJbitFU2VHT1Uw?=
 =?utf-8?B?L2F6YisxNklXZzFVQXI3TCtnTkIwVVdsUzRaUzVRVHNXRzBvMWRHTklRQksx?=
 =?utf-8?B?KzhrdUFXZDJTclR4M2MvSHZqZDl2ZW1FN1RyOTlDVDZ5bXNPNjhjbDBwSXFD?=
 =?utf-8?B?SWIzN2ZQSzc0U3E5bXdkTTFNRFQrNTViMS96cXhNMVhCY2RFUk9iVGliYkt1?=
 =?utf-8?B?R2pYS1I4c0RLMkZpTFRpNmYwRS9PNDc5WEdoMFBuRWp0MFFqbVhRbkFBQytG?=
 =?utf-8?B?TGE5TGRUcUdJUDlBbjB4QXlMWTgySVFNbnBRekkwVStJbjdHWGJNMUM1RFUv?=
 =?utf-8?B?SUk0SFFKR0ZscVZxc1RtejFGblpOOFZJOUR1MlB4bjd0YnJQOTZjd0JBVmp2?=
 =?utf-8?B?S2xJcGl3SVRRV1I1L3pNcTQ5MmNTOGZMb0xHYnBvaDdRbWZXZldLb3VyUHNp?=
 =?utf-8?B?dGEvQlRUaXR2M0VLTnFIbWk0cUJaTHZXNFk4ZXRPOUkxcXNCMU1ZZlVJYUhZ?=
 =?utf-8?B?bllDamliQ1MvVUtWL1RLakQwNkhVNXFkQUU0VkszOGZvTU82N1NuTnY3RDVC?=
 =?utf-8?B?OWI3anF3ZGpuVHZpM0F0V2VrZXJKSkFtNno2eDRKNUlad0tmOGNlZzVDczBy?=
 =?utf-8?B?TC8zOVNXRTE3RnZKWU05YW1zOTdCUXpRaFBoa2JNWmJMQ1Jnc1JGVXlmVWtw?=
 =?utf-8?B?SlhlQ1pVTUducWV2YS94NDREVnFrcm12N1BQdE1pZWxMYndSanRjZEF4YU1j?=
 =?utf-8?B?eTBHMm5rbGRJalpJU0Y4Y1p4NitYMGF4cU54RHgvcGJFRUtveDVvN1IrWVEy?=
 =?utf-8?B?MndxWHdBS05MUmtvM004dlVaNUM2bXNtR09xWVJCWHlxbkFaVW1YWWlYd0to?=
 =?utf-8?B?TEtCTmUwVG1hSVVvUkM3NWhoUEpTZlJGOWhON0M2Y1paNmlwdFphZmFyazdz?=
 =?utf-8?B?aVdubzRUMU83Uks5aEVDa1JVOERDdWFjTnJsbmdsaHJnT25ESXZza1hVZW40?=
 =?utf-8?B?dExjSi9mTitRQUMwOGRIa0xoNDh3cUpIWmg2T1lZL2Z5OFV2cFA4Qk16bW1z?=
 =?utf-8?B?TzRkWkVjS1lpMWxyaC80Z3ZxQWNTcndxdDg1a3BLejRGNFluWUYzSzhHOEtl?=
 =?utf-8?B?WEZ4aEp5WlFkRmxjTUdTMG1Pa2RFTUdyYkx1WjZMcERyZ0ZVbnM3VGd3d0Mr?=
 =?utf-8?B?QSt1cGdHRkVObkI3TkxDVzJ3bWdoY3NxeFNnbTZIUm1KeGpzd3d4VzlIVldS?=
 =?utf-8?B?clZGalFsSzhwNEN1U0ROcWhUVkdmeEhuOGdhNWprNHMvSU51eEtIelgwcFRU?=
 =?utf-8?B?T3RRb05YU1RGalFRcVhXT0RzMzZOampvWlFtK1k1YVprU1lUYlBvbExnYUFs?=
 =?utf-8?B?R2d1SG8rTG0xdVczVE96bVRqUnoydXdDbDJMZGhCaVlTNkZPeDhGRis4a2hi?=
 =?utf-8?B?RlVtdUt4NEYrY0JzT0cxZXk5Vll0TjVWUVRSL0pTdm50ZnFLa0Rac3JtRk91?=
 =?utf-8?B?UEF5SmQ4aUpWV3h4NnFLNy9MVGJyaSt6YmNVL2J1ZjZnTGxxT3dvcWIwVkxB?=
 =?utf-8?B?ZThRZlU0dkhhOVFVNk5DS0tTN3lMdUhDZkdwWCtvWGdzWkJDcmZqYWZBc25B?=
 =?utf-8?B?czBJM0pBR3JWODlKVlVzdVRPTEN4aldFSHVOZzVXSERnamV2Ky9DMU84R1do?=
 =?utf-8?B?aWNjY2xoVVEwcW0zeFc1Z0V1TnF3UXd5NC81YStyMU81a3FyOERNTzdXdUhu?=
 =?utf-8?B?T2tOU2xzcjF2aVo0UXFodGJiVGNkaWxjeGRyQTFoQ2MwQUl2T1M0aXJjbVdN?=
 =?utf-8?B?bTJvc3RoUExoOGw2NTRDalVLTHhPNnNTUkV2S1BLQnlObGsyYUFOczRsSUtR?=
 =?utf-8?B?RWxzSXRqVno1UVhqRmZBblJzSDZkaDJrMlRDWGJTNDgxclVORVVnelJwanI3?=
 =?utf-8?B?eXp6QnNWazFydTVDVFZWZGdLWmowQm1JWUdqVXBiRmJacFJOT2FTc0FHWkdN?=
 =?utf-8?B?ek52MThheGZUN0c4bm4vMzBUaDIvQjNUcVJPMkR1Sy95V1MyRWlVSXdISzVC?=
 =?utf-8?B?ZnF2ejdzTnhqWE5yQm1tZkVSa3NBcUJSMzhGZDh3d2xNR3NtZHFOL2JJKy9S?=
 =?utf-8?B?SVlUWjhOeDJ3RGVRdXFYSzVVbzdUTzI3eVlOUXB2V3RZMVB1Q3ZQZDNSMWJI?=
 =?utf-8?B?aVVjTHgybGNxeWJJY1lHQ05OYSt5MFBnR3FIdFBON2R5dlJrK01waXl0YzNo?=
 =?utf-8?B?VllFWUhRaUc3TVFUZHhmYWdIMFh0amIvSlBNZTh4RWFsN2hNNHU2MzhES3ZL?=
 =?utf-8?B?b3hjSDhPSm5qTzdSY1I1c3V2Rllsd0NlWVdtb2I5V3JmYWZ2c1pnZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C8FEE47D69AF84BB1539FA77C88688A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a06cb7a1-7442-45df-3903-08d9ae4add9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 06:31:21.4280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tExgzEB70M4DKpfkogNtdcNnhcQAr15qoVEg5IM07YOKcmcW5y08FdrbsdCbWLRqkLPRqZCVMZupIb4MnYKwHJjleJ/QqacnRnFy2H55b3xxiwZfEgtqiPzeLw7jPHBr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5796
X-Proofpoint-GUID: D2-WdrkPZlSjsMr2YCdyVyMGy-Q7lbsh
X-Proofpoint-ORIG-GUID: D2-WdrkPZlSjsMr2YCdyVyMGy-Q7lbsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_02,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=668 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230030

DQoNCk9uIDIyLjExLjIxIDE5OjE3LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpLA0KPg0KPiBP
biAyMi8xMS8yMDIxIDE2OjIzLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IE9u
IDIyLjExLjIxIDE3OjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gSSB3b3VsZCBwcmVmZXIg
dG8gZ28gd2l0aCBteSB3YXkuIFRoaXMgY2FuIGJlIHJlZmluZWQgaW4gdGhlIGZ1dHVyZSBpZiB3
ZSBmaW5kIERldmljZS1UcmVlIHRoYXQgbWF0Y2hlcyB3aGF0IHlvdSB3cm90ZS4NCj4+IE9rLCBz
byBqdXN0IHRvIG1ha2UgaXQgY2xlYXI6DQo+PiDCoCA+YSBQQ0kgZGV2aWNlIHdvdWxkIGFsd2F5
cyBiZSBkZXNjcmliZWQgYXMgYSBjaGlsZCBvZiB0aGUgaG9zdGJyaWRnZXMuIFNvIEkgd291bGQg
cmV3b3JrIHRoZSAnaWYnIHRvIGFsc28gY2hlY2sgaWYgdGhlwqBwYXJlbnTCoHR5cGXCoGlzwqBu
b3TCoCJwY2kiDQo+DQo+IFRoYXQncyBjb3JyZWN0LiBUaGFuayB5b3UhDQpPaywgc28gaG93IGFi
b3V0DQogwqDCoMKgIGlmICggaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQoKSAmJiBkdF9kZXZp
Y2VfdHlwZV9pc19lcXVhbChub2RlLCAicGNpIikgKQ0KIMKgwqDCoCB7DQogwqDCoMKgwqDCoMKg
wqAgYm9vbCBza2lwID0gZmFsc2U7DQoNCiDCoMKgwqDCoMKgwqDCoCAvKg0KIMKgwqDCoMKgwqDC
oMKgwqAgKiBJZiB0aGUgcGFyZW50IGlzIGFsc28gYSAicGNpIiBkZXZpY2UsIHRoZW4gImxpbnV4
LHBjaS1kb21haW4iDQogwqDCoMKgwqDCoMKgwqDCoCAqIHNob3VsZCBhbHJlYWR5IGJlIHRoZXJl
LCBzbyBub3RoaW5nIHRvIGRvIHRoZW4uDQogwqDCoMKgwqDCoMKgwqDCoCAqLw0KIMKgwqDCoMKg
wqDCoMKgIGlmICggbm9kZS0+cGFyZW50ICYmIGR0X2RldmljZV90eXBlX2lzX2VxdWFsKG5vZGUt
PnBhcmVudCwgInBjaSIpICkNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNraXAgPSB0cnVlOw0K
DQogwqDCoMKgwqDCoMKgwqAgaWYgKCAhc2tpcCAmJiAhZHRfZmluZF9wcm9wZXJ0eShub2RlLCAi
bGludXgscGNpLWRvbWFpbiIsIE5VTEwpICkNCiDCoMKgwqDCoMKgwqDCoCB7DQpJIHBsYXllZCB3
aXRoIGEgc2luZ2xlIGlmIGFuZCBpdCBsb29rcyBzY2FyeS4uLg0KPg0KPiBDaGVlcnMsDQo+DQpU
aGFuayB5b3UsDQpPbGVrc2FuZHI=

