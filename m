Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800FC4AC55E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 17:22:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267238.460959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6mS-0002XQ-I7; Mon, 07 Feb 2022 16:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267238.460959; Mon, 07 Feb 2022 16:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6mS-0002Uq-F3; Mon, 07 Feb 2022 16:22:20 +0000
Received: by outflank-mailman (input) for mailman id 267238;
 Mon, 07 Feb 2022 16:22:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH6mR-0002Uk-6L
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 16:22:19 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d528b75-8832-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 17:22:17 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217EEgv2023710;
 Mon, 7 Feb 2022 16:22:13 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2057.outbound.protection.outlook.com [104.47.9.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e350urkm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 16:22:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6082.eurprd03.prod.outlook.com (2603:10a6:208:155::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 16:21:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:21:23 +0000
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
X-Inumbo-ID: 1d528b75-8832-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ap4HJzKyz5iHdd7mMcrUwvojqkC9/eHLGUvQtyk0X+6deh9uWmm9N0gLb6chW3w7lxSY+GUwjIObma0j4yEvPHNS07d9jtbDjrbJ+3u00yr0xS1MIf7g4RpwukH2c2jY2VB4f/91e63zK1MRQainjV5AwQuOv5BmFOq/SK2LO1YALJAaaoOGkzHUqv6daVSHj+qOs8J7Yll0Lvtb5+7CewRrp6BgdIpYbqQbKTq5LPagXjU4nlBF742m68bCE5zYRv/rHgzB1nNYEm1hEmGBDb+4Vw2fzeAc8t9HfAPiYHyefgK1CQwmCbVPwkQOxEApHQFxLple0rKvN2gPBAPdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eq+7EehcGxEh9vh0mJqI1Rybd16iu+rAMKtz8Cqgw50=;
 b=K89mmmX6D311Z87mrxgiDumL65MCTZY1u+HlCkcUpuEviSBGOSjxz2f/6coyNVO61cUFLZLoMV7Kh/lq6XDagG9jlTsYmLkZKCUOD7jVHfVcn7aSQvt3HHDSjlgz8y1fiovZhx/lLQ5nWMygKItK5IzvsRJAeMWfehVrHV3YTHBS0GZHVyy1STCP6tSG8H4GUiGBTTkFTr5fyQ4RBwA8WNF6uOXNFpQ6Yt99tWKlPDUqdJr2pfolY/0CHpDBMSmKclveIYtKqvc40+PqZk61ZcgQEn2Ar0s5DxCldLIS3Vsn+HgoupAf89VFiR4MYMUVO2kOaVUcwJDTyXBS04rpQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eq+7EehcGxEh9vh0mJqI1Rybd16iu+rAMKtz8Cqgw50=;
 b=BLSA3E1jk58hotGL81AI+yzJOllnspRDTiaPcp8lSrXMU/d/vAuV2avWYKyxfTxhNOnhlqxnkbPfTIoqWBeLISYHfBstCB4rfuZNOKnrXNTWGoc5ad96T2JNDi/BcAznoufa1bEn3hoFVFAdwrmYHdKa1sLLOW+pqWNN7xjQEk+MF/JXuCTJAYLQjHzxcLdRzyiOY0ljaivT1ZQ4X//+9062rHfc4/NuWFSPltYL6JWATZzfe6/jAkgFhE+NkpOWyfV+uK/DOGWgAp750d+aJPejo0WIgoE7nIITl6QkDIURw755Vz+nezec5ujuTXtP84efVqJgvnUPS/Nvw5nleg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
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
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuAgAAE5ICAAASKAIAAAiiAgAAKNYCAAARNAIAAC1wAgAACRYCAAAGVgA==
Date: Mon, 7 Feb 2022 16:21:23 +0000
Message-ID: <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
References: <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <YgEUwTxhnWVMGMJK@Air-de-Roger>
 <9ce90193-74a0-5642-d22b-6b8c3340c3cf@epam.com>
 <1f65ae7a-898d-2c27-0ada-d71d778b0627@suse.com>
 <YgEsRuckQJIQlkzf@Air-de-Roger>
 <a2a42c1d-d379-00cd-5d55-f443cdb02e97@epam.com>
 <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
 <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
In-Reply-To: <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03fac357-e402-45ed-e467-08d9ea55e24a
x-ms-traffictypediagnostic: AM0PR03MB6082:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6082128110C0D3512F361604E72C9@AM0PR03MB6082.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 maoRQI+8U242d38gBI8ZUvLpl2acEuPFvSXg6fzbv+AeiVCR9R5zxSmY4jj4lnahTOQOvd4Ix+DdYR+6ZT1cRP/etSgvModMxdna43U/NFOBR7DSHWqEBgqNp+WM49ZkuhuDmUGJj03cL69+2d5uRcb08Gpt0CZ8+MgqAg0W5KrYuUQILVC7wvt9C7S/IcJivCFae50mgbDDFmhTGEuCAEue+JmOihrOJrUa6MCETCxseJCTsHK/p7ZY9eQS+SrnxABWIqjJ3QPr7IDf9Znk0MfmgeT+OcKR9yKyS7wVQmj7fzPo+icDGDFb4EeLtB5KwEJvmcloQ6M6HBFX9f+cUS/lvv5HiXIWmHr6Ke4wgGY/Gna1Vt0MSfBgI9RRe7btZnphU89BbH5Pv9d+GkTOnJOXkMniQj6v3GDBC7EAccGFFnNzjBw/DnTs9r/xQw+qhwD6I9F3/JGMa2lLeZLxQlDviWH/HVGndNrgBaNIv5v++0+liVrYc7LPdBhPkAyTjXgGj74qr0xYzA/Q5Qsk59Vqw0DO2Hefag2m/ioxUtij1pyABwxxiw17CYEH4jeQD3m3RtSnP6iGc7xnF64Ed0V7BUMFEuRsvkp89K8ZIVbxdAJSNpD+d/wiG1s74awhnwv4a7DIGvykSCPho9p19SShsGDMDo7VDdpQ4GGGbhhRhq+td2KE16T03MW7/NdT/9QDOFDOK7Ntvh3i2JuSW1mGaEd/rdE3lsk4Y25bcK7KN4PrTfJvMLu7WoAL35Ks
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(64756008)(83380400001)(53546011)(36756003)(6512007)(55236004)(31686004)(8936002)(76116006)(91956017)(66946007)(26005)(6506007)(107886003)(508600001)(71200400001)(66446008)(186003)(66476007)(66556008)(38100700002)(4326008)(54906003)(7416002)(2906002)(2616005)(316002)(6486002)(31696002)(5660300002)(38070700005)(110136005)(122000001)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ekhCeU1CbXgxVndlTXp6ZUdZU0V2bzBCRkxRTTRpbUEyN0tRSUtHa0laK01u?=
 =?utf-8?B?ZXNFenBDajVLZWUwSHl2TG1SeUpOcmU3RFdEd0NjRnV5Y0dkRmR6eks0WkJF?=
 =?utf-8?B?ZGFXSVdsbWFMbmM2VWFSUVI4clJWK0ptT2NuMXVaRGswOExqQ2RlZmF2V0FD?=
 =?utf-8?B?U2Qya3llUzB3bm5EUkg1cTJqLzF5ZTBvYms0RU41KzdKUmNMRGt1TmkwZGdh?=
 =?utf-8?B?UTY3Z014MW1LcXVaYnhGaXJnWmxLdFQ3b28vME5WRjFhZWtSL3pFVlNkMGIx?=
 =?utf-8?B?bFBSZUk4bGVreXdRdEFiSEY0NXYrbE5ET2h4c0pBSEwxbkhPQmdhMGdUTWt3?=
 =?utf-8?B?QThvVFBveE9VcXhGU29Lc1BTeDBwVm9qTWtOYU9Ya1pTRUZoYVJCU05EOEFK?=
 =?utf-8?B?aTNoZllISnZ6bmp2clhEa0IralVobzFiUEI5cXphbUx3OGJLWktCMFFCazM3?=
 =?utf-8?B?YzhBVlJnZGQwdFgxT0NDR3JVQm9kalZxMXdIUE10RmtGQU16NWV5dXFRVmln?=
 =?utf-8?B?TERFQTRZeHFQOTFsell2bWNNTU0vc1h2MTJnZVRad3ZlSGJrVkJ3dm0rUDg3?=
 =?utf-8?B?NVhFNHY5dytNR3RXT2ZScHVXZkU5d203WnlxSnVFLzlydEtTOUEvVk9wNGFQ?=
 =?utf-8?B?UTNjMlV5QVBBS1gxQjNIcFdHMEV1cVNZWnZkS0orb0lYSUVsK0d1VDl5Z3lM?=
 =?utf-8?B?OHJ0b2U3SWpyL2pRcUh3eldjUjh1SUx4YS9aZUJnQmRLcTRmK1dIUTlqNVIy?=
 =?utf-8?B?OVRiYy93TnFwUFN1bnR2NC94MEVxVU5FOEJ5YXRySXk0YXZOREwzVmg4TnFF?=
 =?utf-8?B?TVpGeXVVSlhjZ3NjNDIvK1JFbDJCVmRKY1ZmWHRNOVlsRG1rOVI5WVd2Qmlw?=
 =?utf-8?B?OEdvbGpoWnM1VlYyME5HcDJoVi81QlR4OU9ROEtDS2NzcUczdllQdlZUYk81?=
 =?utf-8?B?aUFhc2tyOGhxNUpQNUVsSEJqMkpqaWJhcXh4N296RHArM3ZkL3d4SURCWjNk?=
 =?utf-8?B?d1RiVWhPbkRLOXlOdUh2R01UYUFvL2I2OGw1SlBkdHdtci9yUnR6U2lnVG44?=
 =?utf-8?B?SVF6ZVdBZStiWkUzZFZvYUpVVEpDb3B5V1pIN1lkYWZTVmtmY1V3Q3JuT29M?=
 =?utf-8?B?dWhkbzRSVWdNQ0swTE5BbEZpN3dycHIrcjQyeWFoeU9qZUxjd0h1aW1hN21w?=
 =?utf-8?B?NG9IOUNLWlkxZnQ2VFg1cElrbldpYys5blF3M0ZVOS8rRmdJeStlNUZpYjA0?=
 =?utf-8?B?NFR4VUFObTM4OUJPL3JuVzdrMTZ1MlBHSHc4NnBsWTBBY1BINzRtTTlLMGVW?=
 =?utf-8?B?OC8xWFdKcjFVazBuOUJMOEFVZTgyQytPdUR3RzJVUDc1ZXZ4bUJ2OVJSa1Vw?=
 =?utf-8?B?UGMzRTZBaGZ1aU5jZG1qck41V3VUVkxBRE5TamFoRWFrSGhBWDEzUmloYmNr?=
 =?utf-8?B?ZzR2V1BFL3gzZUd1eWxZRGd1Z0ZZbXNoVmk1S0o4R0xHQ1lEeHlnbDUxc0NW?=
 =?utf-8?B?alM3RWFoT0RBWU9QZkpzeUM3NDR4dXcrK0w1NTcrdVg5V0RPT2ZzZmVmREZr?=
 =?utf-8?B?cmtnMy9JVWVJdGNJa3oySlM4VkNWdU1UajJvYjZpdjc0QzB6d2ZhdUNIRVdz?=
 =?utf-8?B?UG5hcllybjB4cTg2dVdLOVR2T2JhalpySFlFbkQ1ejZFc2FTQXlpS2ZmWjU4?=
 =?utf-8?B?Y3YrYVNTS2lVK1hlby9SL296NXQwWDZVVVFNaEpHL3lxcWZlYS94bFhQTXdu?=
 =?utf-8?B?ayttN01LcVMrOHBJQklzdDkxZ0hRdElJaWF5YzI5RkFneTBNQ0ZMbGhsdmRS?=
 =?utf-8?B?d1lSNWVwSzZIUWpNZ2phbFFMdGczTTJwWmUzUnAxMjZ6MzhKazhjVFBtOGdz?=
 =?utf-8?B?aUU5QWMxVGx2YTMxMjQwVlZpVWsvdThNbDd2RVZaZjljVmQ2UkhSUkgvMU5u?=
 =?utf-8?B?cWRxZ2pwQ2wvazhELzlRNVIvQVluRzFjejVibEJ3VGNKR1pJYUV4OXJ5eXl2?=
 =?utf-8?B?bGpha2QxckNQeGhRTDQ5bEN5cXlLdkxydTZVUFp6TTAxTXI4bjBjaVBLQS9Q?=
 =?utf-8?B?RlMzRlkwT2IwU2tMTXRtUVNsVFhFd2xlK1hoVDNzejRNTjBMbXk1UXptM2hC?=
 =?utf-8?B?NWI4QTFaOGcyTjVMREhkb3hCb1FHTno4QVc0V0RSelYzam5WRmVQaUF5a2ph?=
 =?utf-8?B?eUlxV3B0Wk5xTUcyZ0NwUzZNOGZFa0lOcy9hV2VZNDkyR080U0RxSTAyMVh6?=
 =?utf-8?B?V3k4RnJxMmRUZHp6bVloRHpGQ2J5bUpyS1dVTWdMb2daUkN1Z3NBM1lnVmgy?=
 =?utf-8?B?cXcxM21FSUFRakplOGpQTWNYUnFZSDdSSWdHUDRVa01HNU16UFpFeVlvcU9Z?=
 =?utf-8?Q?qrPNGvgkCZYReM4k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB8602DEC795FA42AA9F80F782552A25@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fac357-e402-45ed-e467-08d9ea55e24a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 16:21:23.8220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wi7cu1mRvqw6hc3AVuFsR14aLeUM857u8CcxLHAh6GBpneA1p/WDC6BYYmyT2yJMtaAd+mzCtTwCur59NHbU+hta3b2qDQSbKBuLzXr5Zh4OAf7jLoQqWB6JW2cIqM+7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6082
X-Proofpoint-GUID: d-zq-QY_VO3LVTayeY9Ly1wliB1R0Zjn
X-Proofpoint-ORIG-GUID: d-zq-QY_VO3LVTayeY9Ly1wliB1R0Zjn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=978 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070102

DQoNCk9uIDA3LjAyLjIyIDE4OjE1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxNzowNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwNy4wMi4yMiAx
NzoyNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gMWIuIE1ha2UgdnBjaV93cml0ZSB1c2Ugd3Jp
dGUgbG9jayBmb3Igd3JpdGVzIHRvIGNvbW1hbmQgcmVnaXN0ZXIgYW5kIEJBUnMNCj4+PiBvbmx5
OyBrZWVwIHVzaW5nIHRoZSByZWFkIGxvY2sgZm9yIGFsbCBvdGhlciB3cml0ZXMuDQo+PiBJIGFt
IG5vdCBxdWl0ZSBzdXJlIGhvdyB0byBkbyB0aGF0LiBEbyB5b3UgbWVhbiBzb21ldGhpbmcgbGlr
ZToNCj4+IHZvaWQgdnBjaV93cml0ZShwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcs
IHVuc2lnbmVkIGludCBzaXplLA0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dWludDMyX3QgZGF0YSkNCj4+IFtzbmlwXQ0KPj4gICDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRy
eSAoIHIsICZwZGV2LT52cGNpLT5oYW5kbGVycywgbm9kZSApDQo+PiB7DQo+PiBbc25pcF0NCj4+
ICAgwqDCoMKgIGlmICggci0+bmVlZHNfd3JpdGVfbG9jaykNCj4+ICAgwqDCoMKgIMKgwqDCoCB3
cml0ZV9sb2NrKGQtPnZwY2lfbG9jaykNCj4+ICAgwqDCoMKgIGVsc2UNCj4+ICAgwqDCoMKgIMKg
wqDCoCByZWFkX2xvY2soZC0+dnBjaV9sb2NrKQ0KPj4gLi4uLg0KPj4NCj4+IEFuZCBwcm92aWRl
IHJ3IGFzIGFuIGFyZ3VtZW50IHRvOg0KPj4NCj4+IGludCB2cGNpX2FkZF9yZWdpc3RlcihzdHJ1
Y3QgdnBjaSAqdnBjaSwgdnBjaV9yZWFkX3QgKnJlYWRfaGFuZGxlciwNCj4+ICAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZwY2lfd3JpdGVfdCAqd3JpdGVfaGFu
ZGxlciwgdW5zaWduZWQgaW50IG9mZnNldCwNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBzaXplLCB2b2lkICpkYXRhLCAtLS0+Pj4g
Ym9vbCB3cml0ZV9wYXRoIDw8PC0tLS0tKQ0KPj4NCj4+IElzIHRoaXMgd2hhdCB5b3UgbWVhbj8N
Cj4gVGhpcyBzb3VuZHMgb3Zlcmx5IGNvbXBsaWNhdGVkLiBZb3UgY2FuIGRlcml2ZSBsb2NhbGx5
IGluIHZwY2lfd3JpdGUoKSwNCj4gZnJvbSBqdXN0IGl0cyAicmVnIiBhbmQgInNpemUiIHBhcmFt
ZXRlcnMsIHdoZXRoZXIgdGhlIGxvY2sgbmVlZHMgdGFraW5nDQo+IGluIHdyaXRlIG1vZGUuDQpZ
ZXMsIEkgc3RhcnRlZCB3cml0aW5nIGEgcmVwbHkgd2l0aCB0aGF0LiBTbywgdGhlIHN1bW1hcnkg
KFJPTQ0KcG9zaXRpb24gZGVwZW5kcyBvbiBoZWFkZXIgdHlwZSk6DQppZiAoIChyZWcgPT0gUENJ
X0NPTU1BTkQpIHx8IChyZWcgPT0gUk9NKSApDQp7DQogwqDCoMKgIHJlYWQgUENJX0NPTU1BTkQg
YW5kIHNlZSBpZiBtZW1vcnkgb3IgSU8gZGVjb2RpbmcgYXJlIGVuYWJsZWQuDQogwqDCoMKgIGlm
ICggZW5hYmxlZCApDQogwqDCoMKgIMKgwqDCoCB3cml0ZV9sb2NrKGQtPnZwY2lfbG9jaykNCiDC
oMKgwqAgZWxzZQ0KIMKgwqDCoCDCoMKgwqAgcmVhZF9sb2NrKGQtPnZwY2lfbG9jaykNCn0NCg0K
RG8geW91IGFsc28gdGhpbmsgd2UgY2FuIGRyb3AgcGRldi0+dnBjaSAob3IgY3VycmVudGx5IHBk
ZXYtPnZwY2ktPmxvY2spDQphdCBhbGwgdGhlbj8NCj4gSmFuDQo+DQo+DQpUaGFuayB5b3UsDQpP
bGVrc2FuZHI=

