Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17799DA47B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 10:08:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844558.1260055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGE1d-0001SB-FJ; Wed, 27 Nov 2024 09:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844558.1260055; Wed, 27 Nov 2024 09:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGE1d-0001QO-BQ; Wed, 27 Nov 2024 09:07:57 +0000
Received: by outflank-mailman (input) for mailman id 844558;
 Wed, 27 Nov 2024 09:07:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WdPy=SW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tGE1b-0001QI-TT
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 09:07:56 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2416::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13fe876b-ac9f-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 10:07:52 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ0PR12MB7476.namprd12.prod.outlook.com (2603:10b6:a03:48d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 09:07:47 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 09:07:47 +0000
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
X-Inumbo-ID: 13fe876b-ac9f-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNjo6NjBiIiwiaGVsbyI6Ik5BTTExLUNPMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjEzZmU4NzZiLWFjOWYtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjk4NDcyLjI1MDc4NSwic2VuZGVyIjoiamlxaWFuLmNoZW5AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDyJe/rEG800QLhoLbE3qVv76J3SuUB+29VtHRhjCKEjt7+W2Ra6Luf52+T6qePKwhZWn1PMgCbgHCaGKyb7WL1jVaQZLDEREapLf1tSXtwTDPkbPtVDn6WK6rjI7qydkzweYOXcI4hSfNMuWw/m0Y6YjwhHQZRk5ruPYzcY/rg1ysdWQNvsLEcRhDfBDv+VMuPv1gOo2D/7JZRZ3xeDe8Oyhs2Pa4C8/EKZVKbkWSgECFwDG8o3yk68QLiDdF6LYY6TX6kT91cal5D5P/eZ045d7ZHUXpHIG5BbGE9kJecobv0j9FCl+bYauXC3F3R0BsMA3sa5j0BJy0l6lj0+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ/9DMJ3XSpMo9JbXqbzPoxcqou/vUYdFyXOUC8mhIA=;
 b=TO1Rh5e8QOc0T2morrRY5gFkYZnlCvKXkHU/5eSryZcf79ZUcsg9NK0r0uccagRjZcS+A3YFq3tSZYBN98KNYlD6iIQ3mNmJUn/gEbO6SAoooWcpmAWJhq4lOacBaLEUuT7r2jWDzUkZi34MXGKedhFGR9aPN588Nji+ymLDvjiN+v6wmV+WjbgvZyr7RTnIndPauFxOJzyxqRUP9ju0bT7zE+ffGRKIr2ORbnT/1+/cEoSxIZIf3pvtBzNUGLUyTumvFUE112XMn9+sNljhlFwqmPj/tL7HxMN71KGLKkp63fwf26qsOx53i2/qh/8Q9CLlyQ/8nHVpDG7qZ+BmZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ/9DMJ3XSpMo9JbXqbzPoxcqou/vUYdFyXOUC8mhIA=;
 b=yV2tTsuFdREVbswv8EMnXPJx8Yy2TZ9317l9YNNRjExTg2IlQn9+vgN4BmfpYEecWP6hHS3DNZxX3EXJK+4Gzb17x4XTP4LwaN7ddfuDIfTrnFNokp5QKn6p9V7QN6iVibMLtemeBZTbAGZar/Ke6iDZEMUzPxqaED7mzwWsyFc=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] vpci: Add resizable bar support
Thread-Topic: [PATCH] vpci: Add resizable bar support
Thread-Index:
 AQHbNaIlMxf8mJcywkeNRFmHEai1qbK08gcAgACKfwD//4ZQAIABzRcAgAAfLACAAB0/gIABIxcAgAAMOoCABNwTAIABfwWAgAFxTQD//+JeAIABss4A///tiAAAzKybgAACnTYAADSCfYD//7wRgIABpe2A
Date: Wed, 27 Nov 2024 09:07:46 +0000
Message-ID:
 <BL1PR12MB5849BE8978652C3372C235C8E7282@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <ZzY1O-zrcWB6Ra3q@macbook>
 <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzczqznFbixk3Vfu@macbook>
 <BL1PR12MB5849894360DB8D96073AB21EE7272@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzyIk0KipX8LPZNv@macbook>
 <BL1PR12MB5849FC514034CDFC2F68BA6FE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz2lgkjgRoZ7Sr5Q@macbook>
 <BL1PR12MB5849F5382CF3A03C080C4CA4E7222@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz8Cwj3KJ1BIBEg_@macbook>
 <BL1PR12MB584977971D2C0A00443A1A79E72E2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z0Rx2IXqqvrLaIIq@macbook>
 <BL1PR12MB5849B85C116A74D138FF65AAE72F2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c8aa7b64-b5b5-4ac3-b0c0-67d74441588e@suse.com>
In-Reply-To: <c8aa7b64-b5b5-4ac3-b0c0-67d74441588e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8182.018)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ0PR12MB7476:EE_
x-ms-office365-filtering-correlation-id: d4daa21f-f75f-4743-7e8b-08dd0ec2f602
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jZk/8I5z1iSVBUhRcO9W2dG6CayoBnSFSoaTXwIkorzbRNMO+DdasJLN52?=
 =?iso-8859-1?Q?RBEmf2aFbxFhFmSWldWQl8WsSlM4Y/PS8rlDwhSmayvDEHM6eEYwPg2nJf?=
 =?iso-8859-1?Q?tid30gFKxl7ooPrccRFF47mri//dSv+FfVtm8gFSWXphKUDo906o6CqGCn?=
 =?iso-8859-1?Q?HNK0m7LSxnsWVJdzEhi700pXF5G+SF4cPEaM1lvSSLP6+T+DAsYcRYapBg?=
 =?iso-8859-1?Q?7ugiGJbhEzJD0W3zl23Qf/GJbXiW5H7XXv5WqowpndR43kFtdHyzsEbguU?=
 =?iso-8859-1?Q?YZiXMCAZ8nEOzuh6UgvilQXCAYBPvYSbi1W4Eo/iRSLlH/4oLNYhBCYqp+?=
 =?iso-8859-1?Q?ggOOte+xIhBZxiOyH8BsjBscWpW5RMLWnQoNIeVOtPVqGASNAmq9reu8yk?=
 =?iso-8859-1?Q?qqMC92R4qv0sSWY4yHiXbJJaAjQ6fHbp6WQ3nhwfWS2EAf63scf9G3c4U5?=
 =?iso-8859-1?Q?Vc3aEgAxkaHDcfpOOnke8s6tI0QtQLfBNpl812Y3l94zbqUnjbZEvsjYXj?=
 =?iso-8859-1?Q?wqfdlNfPHLrJU4G83Ca9TzG/EJ7A+3W6Z7uYfi+GDs5Ut7nSz5Qt7pXLZv?=
 =?iso-8859-1?Q?ajIjwkM39a/RV+dnbaBxEQsO958hGpSXe9avWSN8DG+XVRVgxyGYH6oxRi?=
 =?iso-8859-1?Q?Qo/7YDALGycZmEjUYBkJQLLhd5X5BUqrgx5bB7E8DeityZEQuoIpxn/9t7?=
 =?iso-8859-1?Q?glCVq2+dz4f66khkxH22qyCrPQU6Z2ItcVGSaGgAV3v5Tc1S8/qUMdg/Fr?=
 =?iso-8859-1?Q?vvD8KgqK8SAV7jUglaRoN2WDBCblLsaZbUV0UmUxP/wbHZSTXJIwCpHU6M?=
 =?iso-8859-1?Q?o3N+YoQvcqxBBjd1smSAZTz8G+Wqd6yNXZ1pC7XPeft7HtioYRU/iC47Nx?=
 =?iso-8859-1?Q?atIM3PekUNwky1lowVvqEoesIW9aCh+3BagHjC0O9X59A7yMWPmdC/bYvs?=
 =?iso-8859-1?Q?Pdo1yTC5BiNrh4UuuZFXVtbGJl3OjzxR+uCYwi+hpI//ETKCwtQ37JCHvN?=
 =?iso-8859-1?Q?+YO+jDqgl7U7TBU2bHYJhuWst7vS2tRrSxRNvGs3eTivHPDNay4E5G5Fzd?=
 =?iso-8859-1?Q?jzynK7wiyZsf0XsilSvpuHUb/Bky78aiqBvnbEYG0Ud9/P4eWIyHU1YU7x?=
 =?iso-8859-1?Q?dmxi9gZojIqscUjmUrDN+wrPMe7TybF0YSggT8qG/dFS1FK7cwWe2vXz2M?=
 =?iso-8859-1?Q?Ct1GDjCOro8XIn8Xe139UvKEyqGBvC+Pygxx88Dcl8Ml05bZeAOxAYaMnU?=
 =?iso-8859-1?Q?FoPznTLN4KZhCbUGnHySmH5m3emOILCWoWuAu2eDQN0A+svQ4ekD0nY2BH?=
 =?iso-8859-1?Q?cDrPmBufUURZvpCFNO3H59sbf9A9hwMovwy3cOb/o32Ew5sbJ2k4PyT1x5?=
 =?iso-8859-1?Q?6cw68RuH49OIkh4tpGrE5XA7oE5TjQrai3t3AQkQrnAoBSw47PE78wvlYY?=
 =?iso-8859-1?Q?RlCSLAVvYB+VC6Yh46XZNtcpOHRq435tulqdZQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?etoLz6qdZi5H7wxA1uGX31znbgC0CXqVtJvbSRCZE09vP9zzEMqn4ZouSK?=
 =?iso-8859-1?Q?f3qAJxsmc7HjkZo53zKZU3Zsh0/GiltwWIcys4L62dIzZ+eHslhtoJqs3l?=
 =?iso-8859-1?Q?Vz6PfDaIjy5+DEMAVAWfA/T834ClNv0dCwHhIlZXAES8JX6xBPvLRoKa/B?=
 =?iso-8859-1?Q?NHqmNOBF+IcAK6+1RKEVPlCNkvuvyovK7kWfshpo5LuqG6CJwHnXo0EXvZ?=
 =?iso-8859-1?Q?SgNMNzihlx6s4zHPVmtvgjtU4uWqe87JJO8xpMTBQApUJWULe4S6I3QQyW?=
 =?iso-8859-1?Q?+317TXqvIcK78+wbuhGOD7jbgcFmn+u8+Kte54bxcGJybZdTM2QFqFR/nf?=
 =?iso-8859-1?Q?xm/TaFlsLGMhEjH9MFF5f8M+/FUdZMg0X1oz1o5n6pdNmuePBD2CKvIN+t?=
 =?iso-8859-1?Q?Zc8RN5n94w6A67FC79RZHb2b8aVPuzYa7L6rWFH5S5yX4BzTPSirtWjOIj?=
 =?iso-8859-1?Q?+cZ7EuoO6wTn/9mxQc02UB2d0JS+Sy/MAFLdCFTUOmTXp+9x12YIz03Cc8?=
 =?iso-8859-1?Q?XiV0pGIzUVwov5mvf34BGgRaF4gYAUk4SN/pb857n6nG4aRIUa6qiFM3yM?=
 =?iso-8859-1?Q?aSBzxNJrcvu988JTilNz9wx9BLA+m+UP5esy7LHuTdWMIOIoLOjjE4gMNl?=
 =?iso-8859-1?Q?kFrAgcHJFooY2ZMskZoDbkI+xX8C3Ke1k0N3mxlTO9G8RGebyD10aC1Mnk?=
 =?iso-8859-1?Q?ocbrTnXGvXpM5yyA5TziewZpFAfoxj7vrtY4h1HcAqPdAW4Wlt1hAhVL/O?=
 =?iso-8859-1?Q?5R0TzhbPk64rQXavblpFl+TaEX4TIjql6KMQUMnJUseppSrMBS0r0LqFke?=
 =?iso-8859-1?Q?XXahYLfys5DKIG/7EbFFYU9DzOCCFybSJ13+ZWk6yVSeyRWrZL1lYRAFVi?=
 =?iso-8859-1?Q?kwnxSHWNjRQ/Tc7M5qNd+hYS80mo7SlQ0ObH8QOvsqmRQ/V2xd3zRLh1kC?=
 =?iso-8859-1?Q?+tXb817CBuW6oVyjPm5yq8m9Eb50wGO/eKSpp3bYnHJnXSaGnPVUsOlKB6?=
 =?iso-8859-1?Q?x5RNra2AA6HmJveMDn4xFyJvmaJRZ09uRw8yeGrAb2H5qSXDhPRtxhT4pO?=
 =?iso-8859-1?Q?ykXEGVZcOvSXywcGpqth95Kvg7/Aa5hbZY57xq5EWotGBge8ATwoIeysSf?=
 =?iso-8859-1?Q?lEWp0JfT1r/EzqEKsSXu/qspvurWTDQeZcTyKVjNMxsO8dfNXAwAAUQh9e?=
 =?iso-8859-1?Q?NkbTxCoZtctHgi1jh1gKh+ld1eBXL3T5OdA3CpDRx/SzDHZzmOVm5AXerS?=
 =?iso-8859-1?Q?kFkjkvfKeIQ5HFvyR7otDel5Xpbi9P6ADwe+fKaV6TGZipgGYqUR4CYhJY?=
 =?iso-8859-1?Q?pjuFeYmO/iHjm136WmWuCXzVaHsAFCI1UrJ2dLU/Ws5Ox5kzcDEmpmWqG1?=
 =?iso-8859-1?Q?OHpOOm5r7SZgGgrREisT47LkwJ1mJac52Bq0GWkkauXumGSxQc1XYoC7lr?=
 =?iso-8859-1?Q?iDcYQYCD7QljVWF95fMa3YLlNIK6pPiiMqe4FV/2iyjBkWxE66Qku3kCZ+?=
 =?iso-8859-1?Q?0bFAbo8mL5/acv+e/DLKWY9cigyBfAHbdmuvdhHvPU7VSPDtkW5F9seYVj?=
 =?iso-8859-1?Q?AvKqRuZ62qpytYi3SCkgU2JKDrcjOsbTCWosOP9vbCBgH7VKT8FXCCD+qg?=
 =?iso-8859-1?Q?Sz2ES6bNvEF08=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <463D46E9E8AEA14FA0264A3408C4B654@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4daa21f-f75f-4743-7e8b-08dd0ec2f602
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 09:07:46.9658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p4Pn2uVbAXAobJP7M/xk3ix2CVxXIgQ2dfj8DpmXQ0fxSkyxmXj6qfSD9MMScVyp7XhS/uWPOAJimw220TronA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7476

On 2024/11/26 17:47, Jan Beulich wrote:
> On 26.11.2024 07:02, Chen, Jiqian wrote:
>> On 2024/11/25 20:47, Roger Pau Monn=E9 wrote:
>>> On Mon, Nov 25, 2024 at 03:44:52AM +0000, Chen, Jiqian wrote:
>>>> On 2024/11/21 17:52, Roger Pau Monn=E9 wrote:
>>>>> On Thu, Nov 21, 2024 at 03:05:14AM +0000, Chen, Jiqian wrote:
>>>>>> On 2024/11/20 17:01, Roger Pau Monn=E9 wrote:
>>>>>>> On Wed, Nov 20, 2024 at 03:01:57AM +0000, Chen, Jiqian wrote:
>>>>>>>> The only difference between our methods is the timing of updating =
the size.
>>>>>>>> Yours is later than mine because you updated the size when the dri=
ver re-enabled memory decoding, while I updated the size in time when drive=
r resize it.
>>>>>>>
>>>>>>> Indeed, my last guess is the stale cached size is somehow used in m=
y
>>>>>>> approach, and that leads to the failures.  One last (possibly dummy=
?)
>>>>>>> thing to try might be to use your patch to detect writes to the res=
ize
>>>>>>> control register, but update the BAR sizes in modify_bars(), while
>>>>>>> keeping the traces of when the operations happen.
>>>>>>>
>>>>>> This can work, combine our method, use my patch to detect and write =
the size into hardware register, and use your patch to update bar[i].size i=
n modify_bars().
>>>>>> Attached the combined patch and the xl dmesg.
>>>>>
>>>>> This is even weirder, so the attached patch works fine?  The only
>>>>> difference with my proposal is that you trap the CTRL registers, but
>>>>> the sizing is still done in modify_bars().
>>>>>
>>>>> What happens if (based on the attached patch) you change
>>>>> rebar_ctrl_write() to:
>>>>>
>>>>> static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>>>>                                       unsigned int reg,
>>>>>                                       uint32_t val,
>>>>>                                       void *data)
>>>>> {
>>>>>     pci_conf_write32(pdev->sbdf, reg, val);
>>>>> }
>>>>>
>>>> If I change rebar_ctrl_write() to:
>>>> static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>>>                                       unsigned int reg,
>>>>                                       uint32_t val,
>>>>                                       void *data)
>>>> {
>>>>     printk("cjq_debug %pp: bar ctrl write reg %u, val %x\n", &pdev->sb=
df, reg, val);
>>>>     pci_conf_write32(pdev->sbdf, reg, val);
>>>> }
>>>>
>>>> I can see three time prints, it can't work.
>>>> (XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 520, val d40
>>>> (XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 520, val d40
>>>> (XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 528, val 102
>>>>
>>>> If I change rebar_ctrl_write() to:
>>>> static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>>>                                       unsigned int reg,
>>>>                                       uint32_t val,
>>>>                                       void *data)
>>>> {
>>>>     if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY=
 )
>>>>         return;
>>>>     printk("cjq_debug %pp: bar ctrl write reg %u, val %x\n", &pdev->sb=
df, reg, val);
>>>>     pci_conf_write32(pdev->sbdf, reg, val);
>>>> }=20
>>>>
>>>> I can only see one time print:
>>>> (XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 520, val d40
>>>>
>>>> The check prevented the two times incorrect write actions.
>>>>     if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY=
 )
>>>>         return;
>>>>
>>>> And why my original patch can work too, the check:
>>>> +    ctrl =3D pci_conf_read32(pdev->sbdf, reg);
>>>> +    if ( ctrl =3D=3D val )
>>>> +        return;
>>>> happened to play the same role as PCI_COMMAND_MEMORY check.
>>>
>>> Thank you very much for figuring this out.  So in the end it's a bug
>>> in the driver that plays with PCI_REBAR_CTRL with memory decoding
>>> enabled.
>> Yes, I think.
>> During driver initiation, it calls pci_rebar_set_size to resize BARs,
>> after that, it calls pci_restore_state->pci_restore_rebar_state to resto=
re BARs,
>> the problem is when calling pci_restore_rebar_state, memory deoding is e=
nabled state.
>> I will discuss with my colleagues internally whether this needs to be mo=
dified in amdgpu driver.
>=20
> Why would memory decoding be enabled at that time? pci_restore_config_spa=
ce()
> specifically takes care of restoring CMD only after restoring BARs. And
> pci_restore_config_space() is invoked by pci_restore_state() quite a bit
> later than pci_restore_rebar_state(). So the driver must (wrongly?) be
> enabling decoding earlier on?
I got some information from my colleague, driver save and restore the devic=
e's state immediately
without disable decoding since the state are the same to fix a bug of drive=
r.
So, it is driver's problem, not Xen or Roger's method. But as Roger said, i=
t is better to trap Rebar_ctrl to prevent similar problems.

>=20
> Jan

--=20
Best regards,
Jiqian Chen.

