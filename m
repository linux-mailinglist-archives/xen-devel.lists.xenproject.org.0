Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A47B74AC6C
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 10:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560246.876018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHgOb-0000YD-HJ; Fri, 07 Jul 2023 08:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560246.876018; Fri, 07 Jul 2023 08:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHgOb-0000Vi-ED; Fri, 07 Jul 2023 08:00:53 +0000
Received: by outflank-mailman (input) for mailman id 560246;
 Fri, 07 Jul 2023 08:00:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfp+=CZ=epam.com=prvs=15521292a4=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1qHgOa-0000El-A2
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 08:00:52 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 626b7b39-1c9c-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 10:00:49 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 366MUb22014628; Fri, 7 Jul 2023 08:00:45 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3rp6fh93jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 08:00:44 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by VI1PR0301MB6671.eurprd03.prod.outlook.com (2603:10a6:800:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 08:00:41 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::11f9:615a:4d9a:a5d2]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::11f9:615a:4d9a:a5d2%6]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 08:00:41 +0000
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
X-Inumbo-ID: 626b7b39-1c9c-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqO5oKOlHtaZb8bjfX4GANMHKcnbDCKjDuDYHYbaV4DA2Ihc5Cu4PAIYQfZ6Da1pqodoyts0Jh/A1Hbq8Xd4Iu6cbv6QGyYsQ8k0HF+FBC1PUXvFd7vPW4EI/TgQ6ryZBpj/wn2YjIWRTf0lMhLoKc+mToUr+cMExTtCgGsvOHHvLRsEdlL+32vPlxSxImddkjh4rncrKF/r8H5HfYVmkhHFKF7yAGiYxZGrNTNXvI1MzijHR6JQr8nqzs04ErzAYgupX3qAxXZZi4exMlHFohhw/sQW1JAfXWgKCgb4OIPDwbmHR6zq1ola7xDLNNuvi/OsZ1c02PZcgxM/Afxc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zgH9T+yLCN0URgEb7qKrkWpt1fvAqfJr5fCr9Mcznc=;
 b=aFDuNBKFVYIyRIKsx4r9zByVi0zQ3Y0d+EvM7ik0EZQSOF2ILhsaUTshaz2+W2bz8E1NZOMcugEVhVk+uUTPi52rtHDn3ewkrRmsybQGWFvSqDevbZDlFuhaxNo0fCLrRYUed1DSWSjXU0Xd5ALbdo7DPvWu+o92URlWvO2+i3nha8EX5kwyN+lnm503KEbIEAVhs5T+EzhJAlB1dai1BEpbsR8m+ejX4VXXoKo127C57hBhQgE9JeMTwcB/Q//N24Xcr/wGSnSuSY3ejby5OBJl/9jvLV3wpB/ikutfh8BybFgKUlJRz0Kua88qxctLYpNM5ussMGU0jLaFfcEaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zgH9T+yLCN0URgEb7qKrkWpt1fvAqfJr5fCr9Mcznc=;
 b=RHLm1NX9RRf2C36E0fO9yB70zO3No3mH4Phu+CrAYmXPZN5zpGerxMSNYZptWjrsPnjj/kL8xPhB593w5HALxbrbUp3c56OAff6RQikr6d1JajIJW7ZdF4MIJdWDgdZ60Hvxa8DBDB3+zp7yE4UtegOcXNaRr91pzDUErylvt2saoZIleQo/Kttt9Ya9INzde1qypazZuvULSTGvFNfydIAlPS5HG0WTx9fBfgFAZuoIu3J++2hDeroPM9Qwx/m5wFeVPR3njoeK7VBx+N8QZxEQuL5ih6BUyQ8o6n2MtIkRrX0kn5ZBsEQNkaBU8cfd7f26T40PVHiCT6c4vq4uyg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
CC: Petr Pavlu <petr.pavlu@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] xen/virtio: Avoid use of the dom0 backend in dom0
Thread-Topic: [PATCH 2/2] xen/virtio: Avoid use of the dom0 backend in dom0
Thread-Index: AQHZpEL/jQILjif4TEa2QZqecjVVUK+Vi2cAgAt2NQCADPhOAIAAD7yA
Date: Fri, 7 Jul 2023 08:00:41 +0000
Message-ID: <d5d6caa5-6ca6-b4b8-5334-fc156eeeb21d@epam.com>
References: <20230621131214.9398-1-petr.pavlu@suse.com>
 <20230621131214.9398-3-petr.pavlu@suse.com>
 <15e31609-6c45-7372-76ee-0adf7a64fe88@epam.com>
 <alpine.DEB.2.22.394.2306281745010.3936094@ubuntu-linux-20-04-desktop>
 <f1a81ac1-5b9a-6d19-1a11-b98685bd2430@suse.com>
In-Reply-To: <f1a81ac1-5b9a-6d19-1a11-b98685bd2430@suse.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|VI1PR0301MB6671:EE_
x-ms-office365-filtering-correlation-id: 3e833c3a-9945-4489-73d0-08db7ec04223
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OtWKG88qQhs+0225kHNTpILhhZATKaiYEMerIhzcDHU9Yib6DBrN0b4lcAuP6XBjS4LMCoGTEjCMvTPNgQLB79igCrhul45JXEm3E/HsCfeHlXluwy2k961r3OMuxjK0z1yVgjsQjY12kNoQSBpVEVsky2MU0fsx4c7og4oERt+049afNP1rEye710zaRh4tltM9kjgeD6hhscPT3JrRox96ezwn9SPPYzx51Fq21S7grYFiVvd9l9d5uK5X6Nyn6hC5syfdHxNuoIYHtuMXMZR/2ogviRjF/p2sHyTDQtn1bxBPLBITNNgPTC3IXvyqWXnNCHzLQWuq5Xr4Y7zGzNVPn+p6YVBLRwm0BcnKuNJL8mhLyqoTv/4ZRsRGMThy3ooHJ+H1Y8xj8XyRLPqy6rPy/qhIloZp6gvLcnAML8slR8Q0hhbsEvjuruSBSp64XwVbo0VP+C2A2NqumEC6hLQwK9jUuyxN9vj9LfZfPQB4DjXV0Yp1xRGTGUacUkRq2y+3nSgI8jpvpHwnHCAwOR4m5Y0ZdB2cDiE4eirgq7ENs9Mgpt2H/FzrbY3d0RUh2qnVEhTdeYgtQiN9VmS1yex5yzrols89vScwiUae5u6uAMSP4fRtJtzuD4+SqHcKIGIDfPMMx67jq7WGOgrdMA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(31686004)(6486002)(71200400001)(478600001)(110136005)(76116006)(91956017)(54906003)(38100700002)(122000001)(83380400001)(86362001)(38070700005)(36756003)(31696002)(2906002)(66946007)(6512007)(2616005)(53546011)(6506007)(186003)(4326008)(26005)(41300700001)(64756008)(66476007)(316002)(8936002)(66556008)(66446008)(8676002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S3RwcnVlMWFSTDdSQmtpMGFEWTQzK0tPbGp2MWJ1ZVdCeHZaaXRFK0drRWNU?=
 =?utf-8?B?R3VHajdjMWRGeVJjMmFUN3MvSjdMK0pjcjhZckd0M0NsVkJqcFE3a3hkbWFN?=
 =?utf-8?B?M3cwVGthOUF3bnZiZU1KQUs0NmVScWphZ3dvTkJkZDc4Tm8rV2I4azA3VVlL?=
 =?utf-8?B?dHNEaDAyak9tc0dwajlvakN5TC9DKzhwRmpmODR2aXZRWmo5aFBhMkdQNFlW?=
 =?utf-8?B?M1pPdVZISkp3cjNqTHFEOFJ1UmhxSTJUZHBpSC9EMG00T1dvUXdvVjcyZ0tq?=
 =?utf-8?B?ODhuOHFndVh6WkJNalNFc3lZNW95WkROQS8yYkU3NUhaN2VVVysvNGVTK05w?=
 =?utf-8?B?R28ybHdMKy92RkVuTjRKVnBLandXTGh4eVpZaVdEbExqK2NUeTQ4VHZPNFZp?=
 =?utf-8?B?N2pSMDduRXBrQUlDZ1dqVDZscFMvclVIZFhlZjQvWGt0ZmF1RmxEVzMwV2tJ?=
 =?utf-8?B?MU9kZlJMMm9maW4zVGNYeERtNEE4b3RFVTc3ZStHWDNLY3hNNkM2NVgwMlc2?=
 =?utf-8?B?SllWSys1OGJTTGlQNXArU0VVTHYrL2pLblUxQTJJemJXZ0NvNE5RM2cvMllx?=
 =?utf-8?B?MkRmZzJrekxlOXJHS1RzNWxkNWdCSnZVa25ucFp3UjdCTU4vb0VYdFdZSzVq?=
 =?utf-8?B?Tm5TdEc2K0JyM2VvUkd0OFJyM1RaZSt3czlzZUtHeHg3SlM4U0JadkkvYnlQ?=
 =?utf-8?B?M1hRaTRBTzEra09Vc29uOHdmeU1WOXVuTEVNckxGSzlKU2FvTEZYVGdrMDVW?=
 =?utf-8?B?RWVVZlYyRVVva3dhTDcva1BvSThwV3d2YmM2bUwzdk9pdEs5bkpsOG5ralVq?=
 =?utf-8?B?R214aVVjTEwwckhqcmhpNXRQQ1RtRkF5UFQ3czkxSzl5Tm9kZXVkSEJDSWF6?=
 =?utf-8?B?d1M5b0N2dWE3TDRVazFPcHhBdC9aQllwc3ozbzNzcHJWZlU5L1hsbTFyM21D?=
 =?utf-8?B?bmlyanlMSDZ4UDJGcC9NWW9mUE9IVjlNMjBkTUhuY1ZyeDZqc09OWVEvOTZq?=
 =?utf-8?B?aUxaQ2Fqb1k5bm1vREd6V2hSQzlabi9BdEpUUGtnT0NzWmFpY1ppODNGRkpm?=
 =?utf-8?B?aGNtZ3hKL1JJRlpORk1oVktweEVNamxUVFJTZjFtOGNPYVUvNFVMcEhUSUdS?=
 =?utf-8?B?MkJGK0hDbEZoRW9CWGhOSTRBQ0w1aW5RUWxEUHEyOStvSnRDUkhHWFZMdis5?=
 =?utf-8?B?ay9DL2EvWlRDd3hSOEdYcDF6VFBPK0xDTWRIVDhOQVlQR2pIYXd2bXAxZlEz?=
 =?utf-8?B?Z3J6a2ZvYWlaRXpiMmNJdm43elk3ZVgrVjJyc29qZnA0UWxGRExmRjlXeFl4?=
 =?utf-8?B?SXJiUUo4UkVSNmdBMmJwU0ljblhzb1BISE5sSmgyU1ZqbDVhWG00bml5YVZZ?=
 =?utf-8?B?ZktBZ3BjRUtCcnVSMWpoTXl2VHdIdzZtWlBnZDFzV3MzZnh0dVpJYUpWNUJw?=
 =?utf-8?B?QzNTSjFGNmU3VVkvV3JyNWRjUUZmYVNuYVFzWnVVWEJjZ3FoaU5wSGUwWmhT?=
 =?utf-8?B?cm5WZjRwb0ZVVW03SVJORlNuZFB2RmRyd0c4bjBFWWhMWEtvbW1mOTlBaXBR?=
 =?utf-8?B?L2NVTjFZRExtMHhMbWE5SEVmenRpcjhFbEM5STVXRHc1SGpEa0pOS0hkNVFQ?=
 =?utf-8?B?dkUzRHNldldaN2hKU2dsQXhYbDJLemIvTDZRVkJ3NFI0bG1DV0JmZTVpRWcx?=
 =?utf-8?B?bGw2VEE3YXhoMTVFTi9WUiszVldNWWNpYXo1a3JwUlY4RlRJWlgxT2IvWFVx?=
 =?utf-8?B?azlDaVJFOEhmL0FTbDdiY09hVk90dEUrcmhLU2dWNkJQQlRhR1RaN1oyT1oy?=
 =?utf-8?B?M1lrck5RNlNRdzNqTVpwTFNBaW5LMjBLbitTdmpSZWxWU1NXd0dLQUxEMlM0?=
 =?utf-8?B?d25uSFZMR1FibWdGMzBVWFpmQTAzVzhlWHJJSlZBcW9LSy9rUWgyeXhDTHlJ?=
 =?utf-8?B?eVFHN1ZrOWVRdFJJQXFLdVhmeUIvYTZYMEZlWlJUclhuL0Myc21DZTFuWVJF?=
 =?utf-8?B?cElLOEZ5VFphSFlXSWVLWEQ4bFhMMno3OEw3cWhsM3lsMlhnQzhDUm8wSlRR?=
 =?utf-8?B?ZDdzbW5ZcXdjSmlOd2t1VEVUWmJFV3RKR2Qray9ETTU4cHovcUxtOTM3UDRS?=
 =?utf-8?B?VHdTSVV0QTBrRTUvVXQraCtZTk8xRDdVZmZpYzg0aDdEeXcwVjBRMkN4NWh6?=
 =?utf-8?Q?eg8IR9p6BkTDkhxe3pL7/pY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BCF315D9A9057438AD01E0C5420B6A6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e833c3a-9945-4489-73d0-08db7ec04223
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 08:00:41.0922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4xxgs5KDDn2U2ICQfaZexbbCgMJs1yvmUMxKORqvIIIyZJdunQvD3OleZUafRiW4dvKaO2J1vrJSODWp0v2VtCdxyuYTMQQTy22XR9dj08o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6671
X-Proofpoint-GUID: W9YIVk0_v9MoQVZkWpiXOf5r7fxfNIPt
X-Proofpoint-ORIG-GUID: W9YIVk0_v9MoQVZkWpiXOf5r7fxfNIPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_04,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070073

DQoNCk9uIDA3LjA3LjIzIDEwOjA0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KDQpIZWxsbyBKdWVy
Z2VuDQoNCg0KPiBSZS1yZWFkaW5nIHRoZSB3aG9sZSB0aHJlYWQgYWdhaW4gLi4uDQo+IA0KPiBP
biAyOS4wNi4yMyAwMzowMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4gT24gV2VkLCAy
MSBKdW4gMjAyMywgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+Pj4gT24gMjEuMDYuMjMg
MTY6MTIsIFBldHIgUGF2bHUgd3JvdGU6DQo+Pj4NCj4+Pg0KPj4+IEhlbGxvIFBldHINCj4+Pg0K
Pj4+DQo+Pj4+IFdoZW4gYXR0ZW1wdGluZyB0byBydW4gWGVuIG9uIGEgUUVNVS9LVk0gdmlydHVh
bCBtYWNoaW5lIHdpdGggdmlydGlvDQo+Pj4+IGRldmljZXMgKGFsbCB4ODZfNjQpLCBkb20wIHRy
aWVzIHRvIGVzdGFibGlzaCBhIGdyYW50IGZvciBpdHNlbGYgd2hpY2gNCj4+Pj4gZXZlbnR1YWxs
eSByZXN1bHRzIGluIGEgaGFuZyBkdXJpbmcgdGhlIGJvb3QuDQo+Pj4+DQo+Pj4+IFRoZSBiYWNr
dHJhY2UgbG9va3MgYXMgZm9sbG93cywgdGhlIHdoaWxlIGxvb3AgaW4gX19zZW5kX2NvbnRyb2xf
bXNnKCkNCj4+Pj4gbWFrZXMgbm8gcHJvZ3Jlc3M6DQo+Pj4+DQo+Pj4+IMKgwqDCoCAjMMKgIHZp
cnRxdWV1ZV9nZXRfYnVmX2N0eCAoX3ZxPV92cUBlbnRyeT0weGZmZmY4ODgwMDc0YTg0MDAsIA0K
Pj4+PiBsZW49bGVuQGVudHJ5PTB4ZmZmZmM5MDAwMDQxM2M5NCwgY3R4PWN0eEBlbnRyeT0weDAg
DQo+Pj4+IDxmaXhlZF9wZXJjcHVfZGF0YT4pIGF0IC4uL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19y
aW5nLmM6MjMyNg0KPj4+PiDCoMKgwqAgIzHCoCAweGZmZmZmZmZmODE3MDg2YjcgaW4gdmlydHF1
ZXVlX2dldF9idWYgDQo+Pj4+IChfdnE9X3ZxQGVudHJ5PTB4ZmZmZjg4ODAwNzRhODQwMCwgbGVu
PWxlbkBlbnRyeT0weGZmZmZjOTAwMDA0MTNjOTQpIA0KPj4+PiBhdCAuLi9kcml2ZXJzL3ZpcnRp
by92aXJ0aW9fcmluZy5jOjIzMzMNCj4+Pj4gwqDCoMKgICMywqAgMHhmZmZmZmZmZjgxNzVmNmIy
IGluIF9fc2VuZF9jb250cm9sX21zZyAocG9ydGRldj08b3B0aW1pemVkIA0KPj4+PiBvdXQ+LCBw
b3J0X2lkPTB4ZmZmZmZmZmYsIGV2ZW50PTB4MCwgdmFsdWU9MHgxKSBhdCANCj4+Pj4gLi4vZHJp
dmVycy9jaGFyL3ZpcnRpb19jb25zb2xlLmM6NTYyDQo+Pj4+IMKgwqDCoCAjM8KgIDB4ZmZmZmZm
ZmY4MTc1ZjZlZSBpbiBfX3NlbmRfY29udHJvbF9tc2cgKHBvcnRkZXY9PG9wdGltaXplZCANCj4+
Pj4gb3V0PiwgcG9ydF9pZD08b3B0aW1pemVkIG91dD4sIGV2ZW50PTxvcHRpbWl6ZWQgb3V0Piwg
DQo+Pj4+IHZhbHVlPTxvcHRpbWl6ZWQgb3V0PikgYXQgLi4vZHJpdmVycy9jaGFyL3ZpcnRpb19j
b25zb2xlLmM6NTY5DQo+Pj4+IMKgwqDCoCAjNMKgIDB4ZmZmZmZmZmY4MTc2MThiMSBpbiB2aXJ0
Y29uc19wcm9iZSANCj4+Pj4gKHZkZXY9MHhmZmZmODg4MDA1ODVlODAwKSBhdCAuLi9kcml2ZXJz
L2NoYXIvdmlydGlvX2NvbnNvbGUuYzoyMDk4DQo+Pj4+IMKgwqDCoCAjNcKgIDB4ZmZmZmZmZmY4
MTcwNzExNyBpbiB2aXJ0aW9fZGV2X3Byb2JlIA0KPj4+PiAoX2Q9MHhmZmZmODg4MDA1ODVlODEw
KSBhdCAuLi9kcml2ZXJzL3ZpcnRpby92aXJ0aW8uYzozMDUNCj4+Pj4gwqDCoMKgICM2wqAgMHhm
ZmZmZmZmZjgxOThlMzQ4IGluIGNhbGxfZHJpdmVyX3Byb2JlIA0KPj4+PiAoZHJ2PTB4ZmZmZmZm
ZmY4MmJlNDBjMCA8dmlydGlvX2NvbnNvbGU+LCBkcnY9MHhmZmZmZmZmZjgyYmU0MGMwIA0KPj4+
PiA8dmlydGlvX2NvbnNvbGU+LCBkZXY9MHhmZmZmODg4MDA1ODVlODEwKSBhdCAuLi9kcml2ZXJz
L2Jhc2UvZGQuYzo1NzkNCj4+Pj4gwqDCoMKgICM3wqAgcmVhbGx5X3Byb2JlIChkZXY9ZGV2QGVu
dHJ5PTB4ZmZmZjg4ODAwNTg1ZTgxMCwgDQo+Pj4+IGRydj1kcnZAZW50cnk9MHhmZmZmZmZmZjgy
YmU0MGMwIDx2aXJ0aW9fY29uc29sZT4pIGF0IA0KPj4+PiAuLi9kcml2ZXJzL2Jhc2UvZGQuYzo2
NTgNCj4+Pj4gwqDCoMKgICM4wqAgMHhmZmZmZmZmZjgxOThlNThmIGluIF9fZHJpdmVyX3Byb2Jl
X2RldmljZSANCj4+Pj4gKGRydj1kcnZAZW50cnk9MHhmZmZmZmZmZjgyYmU0MGMwIDx2aXJ0aW9f
Y29uc29sZT4sIA0KPj4+PiBkZXY9ZGV2QGVudHJ5PTB4ZmZmZjg4ODAwNTg1ZTgxMCkgYXQgLi4v
ZHJpdmVycy9iYXNlL2RkLmM6ODAwDQo+Pj4+IMKgwqDCoCAjOcKgIDB4ZmZmZmZmZmY4MTk4ZTY1
YSBpbiBkcml2ZXJfcHJvYmVfZGV2aWNlIA0KPj4+PiAoZHJ2PWRydkBlbnRyeT0weGZmZmZmZmZm
ODJiZTQwYzAgPHZpcnRpb19jb25zb2xlPiwgDQo+Pj4+IGRldj1kZXZAZW50cnk9MHhmZmZmODg4
MDA1ODVlODEwKSBhdCAuLi9kcml2ZXJzL2Jhc2UvZGQuYzo4MzANCj4+Pj4gwqDCoMKgICMxMCAw
eGZmZmZmZmZmODE5OGU4MzIgaW4gX19kcml2ZXJfYXR0YWNoIA0KPj4+PiAoZGV2PTB4ZmZmZjg4
ODAwNTg1ZTgxMCwgZGF0YT0weGZmZmZmZmZmODJiZTQwYzAgPHZpcnRpb19jb25zb2xlPikgDQo+
Pj4+IGF0IC4uL2RyaXZlcnMvYmFzZS9kZC5jOjEyMTYNCj4+Pj4gwqDCoMKgICMxMSAweGZmZmZm
ZmZmODE5OGJmYjIgaW4gYnVzX2Zvcl9lYWNoX2RldiAoYnVzPTxvcHRpbWl6ZWQgb3V0PiwgDQo+
Pj4+IHN0YXJ0PXN0YXJ0QGVudHJ5PTB4MCA8Zml4ZWRfcGVyY3B1X2RhdGE+LCANCj4+Pj4gZGF0
YT1kYXRhQGVudHJ5PTB4ZmZmZmZmZmY4MmJlNDBjMCA8dmlydGlvX2NvbnNvbGU+LA0KPj4+PiDC
oMKgwqDCoMKgwqDCoCBmbj1mbkBlbnRyeT0weGZmZmZmZmZmODE5OGU3YjAgPF9fZHJpdmVyX2F0
dGFjaD4pIGF0IA0KPj4+PiAuLi9kcml2ZXJzL2Jhc2UvYnVzLmM6MzY4DQo+Pj4+IMKgwqDCoCAj
MTIgMHhmZmZmZmZmZjgxOThkYjY1IGluIGRyaXZlcl9hdHRhY2ggDQo+Pj4+IChkcnY9ZHJ2QGVu
dHJ5PTB4ZmZmZmZmZmY4MmJlNDBjMCA8dmlydGlvX2NvbnNvbGU+KSBhdCANCj4+Pj4gLi4vZHJp
dmVycy9iYXNlL2RkLmM6MTIzMw0KPj4+PiDCoMKgwqAgIzEzIDB4ZmZmZmZmZmY4MTk4ZDIwNyBp
biBidXNfYWRkX2RyaXZlciANCj4+Pj4gKGRydj1kcnZAZW50cnk9MHhmZmZmZmZmZjgyYmU0MGMw
IDx2aXJ0aW9fY29uc29sZT4pIGF0IA0KPj4+PiAuLi9kcml2ZXJzL2Jhc2UvYnVzLmM6NjczDQo+
Pj4+IMKgwqDCoCAjMTQgMHhmZmZmZmZmZjgxOThmNTUwIGluIGRyaXZlcl9yZWdpc3RlciANCj4+
Pj4gKGRydj1kcnZAZW50cnk9MHhmZmZmZmZmZjgyYmU0MGMwIDx2aXJ0aW9fY29uc29sZT4pIGF0
IA0KPj4+PiAuLi9kcml2ZXJzL2Jhc2UvZHJpdmVyLmM6MjQ2DQo+Pj4+IMKgwqDCoCAjMTUgMHhm
ZmZmZmZmZjgxNzA2YjQ3IGluIHJlZ2lzdGVyX3ZpcnRpb19kcml2ZXIgDQo+Pj4+IChkcml2ZXI9
ZHJpdmVyQGVudHJ5PTB4ZmZmZmZmZmY4MmJlNDBjMCA8dmlydGlvX2NvbnNvbGU+KSBhdCANCj4+
Pj4gLi4vZHJpdmVycy92aXJ0aW8vdmlydGlvLmM6MzU3DQo+Pj4+IMKgwqDCoCAjMTYgMHhmZmZm
ZmZmZjgzMmNkMzRiIGluIHZpcnRpb19jb25zb2xlX2luaXQgKCkgYXQgDQo+Pj4+IC4uL2RyaXZl
cnMvY2hhci92aXJ0aW9fY29uc29sZS5jOjIyNTgNCj4+Pj4gwqDCoMKgICMxNyAweGZmZmZmZmZm
ODEwMDEwNWMgaW4gZG9fb25lX2luaXRjYWxsIChmbj0weGZmZmZmZmZmODMyY2QyZTAgDQo+Pj4+
IDx2aXJ0aW9fY29uc29sZV9pbml0PikgYXQgLi4vaW5pdC9tYWluLmM6MTI0Ng0KPj4+PiDCoMKg
wqAgIzE4IDB4ZmZmZmZmZmY4MzI3NzI5MyBpbiBkb19pbml0Y2FsbF9sZXZlbCANCj4+Pj4gKGNv
bW1hbmRfbGluZT0weGZmZmY4ODgwMDNlMmY5MDAgInJvb3QiLCBsZXZlbD0weDYpIGF0IA0KPj4+
PiAuLi9pbml0L21haW4uYzoxMzE5DQo+Pj4+IMKgwqDCoCAjMTkgZG9faW5pdGNhbGxzICgpIGF0
IC4uL2luaXQvbWFpbi5jOjEzMzUNCj4+Pj4gwqDCoMKgICMyMCBkb19iYXNpY19zZXR1cCAoKSBh
dCAuLi9pbml0L21haW4uYzoxMzU0DQo+Pj4+IMKgwqDCoCAjMjEga2VybmVsX2luaXRfZnJlZWFi
bGUgKCkgYXQgLi4vaW5pdC9tYWluLmM6MTU3MQ0KPj4+PiDCoMKgwqAgIzIyIDB4ZmZmZmZmZmY4
MWY2NGJlMSBpbiBrZXJuZWxfaW5pdCAodW51c2VkPTxvcHRpbWl6ZWQgb3V0PikgDQo+Pj4+IGF0
IC4uL2luaXQvbWFpbi5jOjE0NjINCj4+Pj4gwqDCoMKgICMyMyAweGZmZmZmZmZmODEwMDFmNDkg
aW4gcmV0X2Zyb21fZm9yayAoKSBhdCANCj4+Pj4gLi4vYXJjaC94ODYvZW50cnkvZW50cnlfNjQu
UzozMDgNCj4+Pj4gwqDCoMKgICMyNCAweDAwMDAwMDAwMDAwMDAwMDAgaW4gPz8gKCkNCj4+Pj4N
Cj4+Pj4gRml4IHRoZSBwcm9ibGVtIGJ5IHByZXZlbnRpbmcgeGVuX2dyYW50X2luaXRfYmFja2Vu
ZF9kb21pZCgpIGZyb20NCj4+Pj4gc2V0dGluZyBkb20wIGFzIGEgYmFja2VuZCB3aGVuIHJ1bm5p
bmcgaW4gZG9tMC4NCj4+Pj4NCj4+Pj4gRml4ZXM6IDAzNWUzYTQzMjFmNyAoInhlbi92aXJ0aW86
IE9wdGltaXplIHRoZSBzZXR1cCBvZiANCj4+Pj4gInhlbi1ncmFudC1kbWEiIGRldmljZXMiKQ0K
Pj4+DQo+Pj4NCj4+PiBJIGFtIG5vdCAxMDAlIHN1cmUgd2hldGhlciB0aGUgRml4ZXMgdGFnIHBv
aW50cyB0byBwcmVjaXNlIGNvbW1pdC4gSWYgSQ0KPj4+IGFtIG5vdCBtaXN0YWtlbiwgdGhlIHNh
aWQgY29tbWl0IGp1c3QgbW92ZXMgdGhlIGNvZGUgaW4gdGhlIGNvbnRleHQNCj4+PiB3aXRob3V0
IGNoYW5naW5nIHRoZSBsb2dpYyBvZiBDT05GSUdfWEVOX1ZJUlRJT19GT1JDRV9HUkFOVCwgdGhp
cyB3YXMNCj4+PiBpbnRyb2R1Y2VkIGJlZm9yZS4NCj4+Pg0KPj4+DQo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IFBldHIgUGF2bHUgPHBldHIucGF2bHVAc3VzZS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiDCoMKg
IGRyaXZlcnMveGVuL2dyYW50LWRtYS1vcHMuYyB8IDQgKysrLQ0KPj4+PiDCoMKgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4NCj4+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMveGVuL2dyYW50LWRtYS1vcHMuYyBiL2RyaXZlcnMveGVuL2dyYW50LWRt
YS1vcHMuYw0KPj4+PiBpbmRleCA3NmY2ZjI2MjY1YTMuLjI5ZWQyN2FjNDUwZSAxMDA2NDQNCj4+
Pj4gLS0tIGEvZHJpdmVycy94ZW4vZ3JhbnQtZG1hLW9wcy5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMv
eGVuL2dyYW50LWRtYS1vcHMuYw0KPj4+PiBAQCAtMzYyLDcgKzM2Miw5IEBAIHN0YXRpYyBpbnQg
eGVuX2dyYW50X2luaXRfYmFja2VuZF9kb21pZChzdHJ1Y3QgDQo+Pj4+IGRldmljZSAqZGV2LA0K
Pj4+PiDCoMKgwqDCoMKgwqAgaWYgKG5wKSB7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dCA9IHhlbl9kdF9ncmFudF9pbml0X2JhY2tlbmRfZG9taWQoZGV2LCBucCwgDQo+Pj4+IGJhY2tl
bmRfZG9taWQpOw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZl9ub2RlX3B1dChucCk7DQo+
Pj4+IC3CoMKgwqAgfSBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19YRU5fVklSVElPX0ZPUkNF
X0dSQU5UKSB8fCANCj4+Pj4geGVuX3B2X2RvbWFpbigpKSB7DQo+Pj4+ICvCoMKgwqAgfSBlbHNl
IGlmICgoSVNfRU5BQkxFRChDT05GSUdfWEVOX1ZJUlRJT19GT1JDRV9HUkFOVCkgfHwNCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVuX3B2X2RvbWFpbigpKSAmJg0KPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqAgIXhlbl9pbml0aWFsX2RvbWFpbigpKSB7DQo+Pj4NCj4+PiBUaGUgY29t
bWl0IGxndG0sIGp1c3Qgb25lIG5vdGU6DQo+Pj4NCj4+Pg0KPj4+IEkgd291bGQgZXZlbiBiYWls
IG91dCBlYXJseSBpbiB4ZW5fdmlydGlvX3Jlc3RyaWN0ZWRfbWVtX2FjYygpIGluc3RlYWQsDQo+
Pj4gYXMgSSBhc3N1bWUgdGhlIHNhbWUgaXNzdWUgY291bGQgaGFwcGVuIG9uIEFybSB3aXRoIERU
IChhbHRob3VnaCB0aGVyZQ0KPj4+IHdlIGRvbid0IGd1ZXNzIHRoZSBiYWNrZW5kJ3MgZG9taWQs
IHdlIHJlYWQgaXQgZnJvbSBEVCBhbmQgcXVpdGUNCj4+PiB1bmxpa2VseSB3ZSBnZXQgRG9tMCBi
ZWluZyBpbiBEb20wIHdpdGggY29ycmVjdCBEVCkuDQo+Pj4NCj4+PiBTb21ldGhpbmcgbGlrZToN
Cj4+Pg0KPj4+IEBAIC00MTYsNiArNDIxLDEwIEBAIGJvb2wgeGVuX3ZpcnRpb19yZXN0cmljdGVk
X21lbV9hY2Moc3RydWN0DQo+Pj4gdmlydGlvX2RldmljZSAqZGV2KQ0KPj4+IMKgwqAgew0KPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBkb21pZF90IGJhY2tlbmRfZG9taWQ7DQo+Pj4NCj4+PiArwqDC
oMKgwqDCoMKgIC8qIFhlbiBncmFudCBETUEgb3BzIGFyZSBub3QgdXNlZCB3aGVuIHJ1bm5pbmcg
YXMgaW5pdGlhbCANCj4+PiBkb21haW4gKi8NCj4+PiArwqDCoMKgwqDCoMKgIGlmICh4ZW5faW5p
dGlhbF9kb21haW4oKSkNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
ZmFsc2U7DQo+Pj4gKw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXhlbl9ncmFudF9pbml0
X2JhY2tlbmRfZG9taWQoZGV2LT5kZXYucGFyZW50LA0KPj4+ICZiYWNrZW5kX2RvbWlkKSkgew0K
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGVuX2dyYW50X3NldHVwX2Rt
YV9vcHMoZGV2LT5kZXYucGFyZW50LCANCj4+PiBiYWNrZW5kX2RvbWlkKTsNCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOw0KPj4+IChFTkQpDQo+Pj4N
Cj4+Pg0KPj4+DQo+Pj4gSWYgc28sIHRoYXQgY29tbWl0IHN1YmplY3Qgd291bGQgbmVlZCB0byBi
ZSB1cGRhdGVkIGFjY29yZGluZ2x5Lg0KPj4+DQo+Pj4gTGV0J3Mgc2VlIHdoYXQgb3RoZXIgcmV2
aWV3ZXJzIHdpbGwgc2F5Lg0KPj4NCj4+IFRoaXMgZG9lc24ndCB3b3JrIGluIGFsbCBjYXNlcy4g
SW1hZ2luZSB1c2luZyBQQ0kgUGFzc3Rocm91Z2ggdG8gYXNzaWduDQo+PiBhICJwaHlzaWNhbCIg
dmlydGlvIGRldmljZSB0byBhIGRvbVUuIFRoZSBkb21VIHdpbGwgcnVuIGludG8gdGhlIHNhbWUN
Cj4+IGVycm9yLCByaWdodD8NCj4+DQo+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IHdlIG5lZWQgYSB3
YXkgZm9yIHRoZSB2aXJ0aW8gYmFja2VuZCB0byBhZHZlcnRpc2UNCj4+IGl0cyBhYmlsaXR5IG9m
IGhhbmRsaW5nIGdyYW50cy4gUmlnaHQgbm93IHdlIG9ubHkgaGF2ZSBhIHdheSB0byBkbyB3aXRo
DQo+PiB0aGF0IHdpdGggZGV2aWNlIHRyZWUgb24gQVJNLiBPbiB4ODYsIHdlIG9ubHkgaGF2ZQ0K
Pj4gQ09ORklHX1hFTl9WSVJUSU9fRk9SQ0VfR1JBTlQsIGFuZCBpZiB3ZSB0YWtlDQo+PiBDT05G
SUdfWEVOX1ZJUlRJT19GT1JDRV9HUkFOVCBhdCBmYWNlIHZhbHVlLCBpdCBhbHNvIGVuYWJsZXMg
Z3JhbnRzIGZvcg0KPj4gInBoeXNpY2FsIiB2aXJ0aW8gZGV2aWNlcy4gTm90ZSB0aGF0IGluIHRo
aXMgY2FzZSB3ZSBhcmUgZml4aW5nIGENCj4+IG5lc3RlZC12aXJ0dWFsaXphdGlvbiBidWcsIGJ1
dCB0aGVyZSBhcmUgYWN0dWFsbHkgcGh5c2ljYWwNCj4+IHZpcnRpby1jb21wYXRpYmxlIGRldmlj
ZXMgb3V0IHRoZXJlLiBDT05GSUdfWEVOX1ZJUlRJT19GT1JDRV9HUkFOVCB3aWxsDQo+PiBicmVh
ayB0aG9zZSB0b28uDQo+IA0KPiBJbiBjYXNlIHlvdSB3YW50IHZpcnRpbyBkZXZpY2UgcGFzc3Ro
cm91Z2gsIHlvdSBzaG91bGRuJ3QgdXNlIGEga2VybmVsDQo+IGJ1aWx0IHdpdGggQ09ORklHX1hF
Tl9WSVJUSU9fRk9SQ0VfR1JBTlQuDQo+IA0KPiBBbmQgc3VwcG9ydGluZyBwYXNzaW5nIHRocm91
Z2ggdmlydGlvIGRldmljZXMgb2YgdGhlIGhvc3QgdG8gcHYtZG9tVXMgaXMNCj4gYSBzZWN1cml0
eSByaXNrIGFueXdheS4NCj4gDQo+IFdlIF9jb3VsZF8gZHJvcCB0aGUgcmVxdWlyZW1lbnQgb2Yg
dGhlIGJhY2tlbmQgbmVlZGluZyB0byBzZXQNCj4gVklSVElPX0ZfQUNDRVNTX1BMQVRGT1JNIGZv
ciBQViBndWVzdHMgYW5kIGFsbG93IGdyYW50LWxlc3MgdmlydGlvDQo+IGhhbmRsaW5nIGZvciBh
bGwgZ3Vlc3RzLiBGb3IgdGhpcyB0byB3b3JrIHhlbl92aXJ0aW9fcmVzdHJpY3RlZF9tZW1fYWNj
KCkNCj4gd291bGQgbmVlZCB0byBjaGVjayBmb3IgVklSVElPX0ZfQUNDRVNTX1BMQVRGT1JNIGFu
ZCByZXR1cm4gdHJ1ZSBpZiBzZXQuDQo+IE1heWJlIHdlJ2Qgd2FudCB0byBlbmFibGUgdGhhdCBw
b3NzaWJpbGl0eSB2aWEgYSBib290IHBhcmFtZXRlcj8NCg0KDQpNYXliZSwgeWVzLiBJIGRvbid0
IHNlZSBhdCB0aGUgbW9tZW50IHdoeSB0aGlzIHdvbid0IHdvcmsuDQoNCkF0IHRoZSBzYW1lIHRp
bWUgSSB3b25kZXIsIGNvdWxkIHdlIGp1c3QgbW9kaWZ5IHhlbl9wdl9pbml0X3BsYXRmb3JtKCkg
DQp0byBjYWxsIHZpcnRpb19ub19yZXN0cmljdGVkX21lbV9hY2MoKSBpZiBmb3JjaWJseSBkaXNh
YmxlZCBieSBib290IA0KcGFyYW1ldGVyIGlycmVzcGVjdGl2ZSBvZiBWSVJUSU9fRl9BQ0NFU1Nf
UExBVEZPUk0gcHJlc2VuY2U/DQoNCg0KPiANCj4gDQo+IEp1ZXJnZW4=

