Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9AA9D7A6D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 04:46:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842319.1257705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFQ27-0001ob-6A; Mon, 25 Nov 2024 03:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842319.1257705; Mon, 25 Nov 2024 03:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFQ26-0001lY-W4; Mon, 25 Nov 2024 03:45:06 +0000
Received: by outflank-mailman (input) for mailman id 842319;
 Mon, 25 Nov 2024 03:45:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOK8=SU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tFQ25-0001lS-GZ
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 03:45:05 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2009::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3425bf9-aadf-11ef-a0cc-8be0dac302b0;
 Mon, 25 Nov 2024 04:44:58 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH0PR12MB8032.namprd12.prod.outlook.com (2603:10b6:510:26f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 03:44:52 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 03:44:52 +0000
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
X-Inumbo-ID: a3425bf9-aadf-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwOTo6NjI5IiwiaGVsbyI6Ik5BTTEwLUJONy1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImEzNDI1YmY5LWFhZGYtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTA2Mjk4LjE4NTgxMSwic2VuZGVyIjoiamlxaWFuLmNoZW5AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHD0PdW+GpW3qhJx1nPCYgaWjsY3tT3E7wXHIGrlyZ4YWVUSimAbGo+VyMhyNmejYWsKOidS5PJyLDww5O6OdKcUid/hVdtax3JYUMhf5eMrKBTyW/G3Hzv3lrHcHRXtEgNtb9ihrVBPTYWYsZEVddmrvM7MsuY+BiSRJ+gL5q5NSgpRORjvBL1MozZ9mBJIlsLRj+U8F8a2z8js7i26Edo3jm4eTKjaytj/i8gyj+IodxciDBiu+8+zhkhek1z9d8pwvppCteD0pBRnwVHz9tdWkSt2Y/u6+2jVuiiAcUzrEfYHAEQxc5MHMGwSVaxUdH2pDB6nF3XpRjNYFUHACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUDaNk2JcwCEVOf8M2jImzF0xKE5N8uU/OBY+gCzBoc=;
 b=xUpUHDvgZaryYxhBqbP767o+jJD4WlHRL0C9y4pUCdSCIs6U/jwH3NnRnRxE9MMqyLrpaSVR9pXJ0zz+DlBEZ0CTXz7da65l+n1ytqZPyvMf9pMkNJ57fj0gD3FgmzukdCAv6Jv+ww2iJKrPkEfUzqdxedtswt+7hc+aPquupMCkVQ9j+aPufxbq6x1tp1J9MDwr7T+GsBoA01zg/QOAu23eEdhwZkhlgNBqxHqmIkVEzGj9XwpL43z+XsMRsvZvTvTfgxODUeybCfRxKPYxNjgfdZSVqOW82kaVrY8Y2bjP4dY1513bOEGqVaH2mkDLLY7PmhnhwC81qCUNc7ReoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUDaNk2JcwCEVOf8M2jImzF0xKE5N8uU/OBY+gCzBoc=;
 b=bOMup2WqUQxgKPAheYxx2qZBOrfCOAatKM7dlyj7NvRHEhHdeRSbgVRexlvYdQ0XnaWf6BcOewHA0bFfBkFI5RGkFyFgT2LWmPAg0rLjmlDozHhh5m/vqw41wmg5POk7iMGIGkTMHv+yIbLoe321dVZnsVT6FuQOrqsVQW5Yvbc=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] vpci: Add resizable bar support
Thread-Topic: [PATCH] vpci: Add resizable bar support
Thread-Index:
 AQHbNaIlMxf8mJcywkeNRFmHEai1qbK08gcAgACKfwD//4ZQAIABzRcAgAAfLACAAB0/gIABIxcAgAAMOoCABNwTAIABfwWAgAFxTQD//+JeAIABss4A///tiAAAzKybgA==
Date: Mon, 25 Nov 2024 03:44:52 +0000
Message-ID:
 <BL1PR12MB584977971D2C0A00443A1A79E72E2@BL1PR12MB5849.namprd12.prod.outlook.com>
References:
 <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzYcskZ-GZ8HsXfU@macbook> <ZzY1O-zrcWB6Ra3q@macbook>
 <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzczqznFbixk3Vfu@macbook>
 <BL1PR12MB5849894360DB8D96073AB21EE7272@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzyIk0KipX8LPZNv@macbook>
 <BL1PR12MB5849FC514034CDFC2F68BA6FE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz2lgkjgRoZ7Sr5Q@macbook>
 <BL1PR12MB5849F5382CF3A03C080C4CA4E7222@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz8Cwj3KJ1BIBEg_@macbook>
In-Reply-To: <Zz8Cwj3KJ1BIBEg_@macbook>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH0PR12MB8032:EE_
x-ms-office365-filtering-correlation-id: 2acd737c-69d1-4791-051d-08dd0d038541
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?fekoFvrS0NZ5YNVSurcZ3o13BeaAVoEshZF3CCvwzKdcAbgbiFNFFWgUAF?=
 =?iso-8859-1?Q?4USeKwDQR19X8UOWVwe31YvHO2+NZSCascDMqyu0U8HmiKbiC05VOAivq3?=
 =?iso-8859-1?Q?w75eZlkQRC/ecGDcFWT7uyZ31NkvLFlcakJQuc86Xw3hEr8j/hmMlh6iiR?=
 =?iso-8859-1?Q?qSo2Ax9s2v7hT+oTrt/W39Xrj2QNZHBNcwHeoUPgmiGnh8/CX2UOs5x436?=
 =?iso-8859-1?Q?Z2dTdP5Zpt+b7WFg2557bP5Vydkk9SOQAk1sp/p1Ton8CDYnOJxhfAEeqb?=
 =?iso-8859-1?Q?isCARW+EKHjQw/IkNPXo48sy1itoCAu12zBbUG0gjhrwm+vHtxzna8gCJc?=
 =?iso-8859-1?Q?AqlSgSmuLiGYiHtu7vHMuc62PmboTwBcUHRHRWb2QmSgzb/X3RO7AY+ks+?=
 =?iso-8859-1?Q?7vyer+fKNMeJSXUTZ+sU9izRqGlQqFENFqtSciuzhv0sySgLeWfREtvq1d?=
 =?iso-8859-1?Q?Xdy+XdA1A2qy/7CHynb82RSdnpI6MI9hg70w/Dg/lxJuTAR25E0eObC7sQ?=
 =?iso-8859-1?Q?8Ipiq25GAEAlUT2tAZblt8RBctYu+nitfoa6nbMsQHQbrAQV2sWPTS3SP7?=
 =?iso-8859-1?Q?lnfnG8pfZxvbIkZc2mZfK7YwrNt00wF0F5n+u7u1bUKxAhswN2MzgbvvWP?=
 =?iso-8859-1?Q?GPhcUkvG1b2hFWyJHdo58iIPonC8x/fazEIhxyAY7dWqA+I0XcU5W0UwqO?=
 =?iso-8859-1?Q?5HGDjSevHq9BqT/fzZg54PqarXZkaEI4nZoSGwNsFDRcL5E5YeeEUSgS91?=
 =?iso-8859-1?Q?Mh1VEWC43W69R3OpW2qcvU2L2eIJFUjvhFPHO/nmPt+nodwBeOkCTi9NAZ?=
 =?iso-8859-1?Q?qWqArV0LsJAcmBb49gdymLTk7TsNPIULzl9uY4f/BDFYRoGPgSCVb+lEIK?=
 =?iso-8859-1?Q?/tBUM0bsS0exjnRzZemJV1l1+CjGkfOfZxdOxqWN+0edxgAlwA2b+cLDcC?=
 =?iso-8859-1?Q?h05qdzhoiwqzsywkrrdnCTprdwpD8ubc/tEUGeRtCxTwkoEs2oDcmeQx11?=
 =?iso-8859-1?Q?u6YFBeQM3Cpa3a/VERmDvxn1T5/GJH4HByffkIQB/fG9oHgXZ5w/H5CScy?=
 =?iso-8859-1?Q?gajBqJZFA5o48v0+vqp5gCWfOYgwBB/xf5dFSD79fhgzIDotWVAiRuNIwq?=
 =?iso-8859-1?Q?mCWLvrTXY6IitW/PlQvPpcq8qAFNkaU8UFMZMiJb3185lgMGuRA1BlBXFv?=
 =?iso-8859-1?Q?ymy6SMJEiotr45xErGCuNT4R6pyKyqtTHomvErpbpvgRk6ayklswLTjLgm?=
 =?iso-8859-1?Q?qkusPS8ef+pVzpLbO+YP+gWLaInt3r9j3nDKcl8d2wvQ/g8NvB6YUV9dT9?=
 =?iso-8859-1?Q?yf9fsZMoNh0pwiuf2ME5XWeZaPlCNZKSvSj91i0R4ImxqJVBxQxjimNS5S?=
 =?iso-8859-1?Q?iJTfJS80ARGg86972/ce/xVY2JgScx3asuG38dypH7LQjU56k+Mxh9gd2s?=
 =?iso-8859-1?Q?l8gA0S9fMu1HDGVHtdqFweTRfNQSKsfxubsgzg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2ZyhdR4qmxQ+jQ0LmeuLv0n8LwCHNWcX3wNRMjJ7XEOzPB3pJ7yOx4z834?=
 =?iso-8859-1?Q?nzcFW+zzuXjd9H/bJ500h6tI7FrdirTpz+HsM9qDhJveoTvHkpzPgv0Rw4?=
 =?iso-8859-1?Q?cxS3RKqHpMKNzh2kutSdKDS6KfKIyqSUsHyS53HxmRdBaDqGnXZDNmgKNU?=
 =?iso-8859-1?Q?nf7kivIK+vLMIk9yCFh5ZYG/5kv9v43w4tihpnb0qZu1V4wl9JrBc4U4VZ?=
 =?iso-8859-1?Q?m+e8A9DDOHl02eynZsvohq/lP00VgZdNzUAZn2J2mCVtFYi+rVVIm6JYnT?=
 =?iso-8859-1?Q?JhrPA8M4j0JxVYpmkzEjfc93RDY8jwBX6p8suK5j3f95+QatgvKwqlwxlt?=
 =?iso-8859-1?Q?Lo/iPcQSRd9MUBIyo1Wl3EpUD2sylyswqZRXMtJEnjdCQPNGWa783Pxd0b?=
 =?iso-8859-1?Q?/HyvMMUR8np6gjyX9x6WCFKenz13/fBvrzLpSb9EFsMQ3X+L0uTi22HWvD?=
 =?iso-8859-1?Q?pAtnn9hl3SqA10YRr/d7+mmOfxOGUIJO5hfGA7mXtqrt5l5KTMQESWGt86?=
 =?iso-8859-1?Q?OqbyKU0DjLxWb7GuIqtaJyrd1JYXO3fm4bh+kMnjLps8NmkPQqwz001aJF?=
 =?iso-8859-1?Q?UoccpFxpyNGmCJjH6R3z0koxBVoGvDdPXU06Q9Yn1VybJGa1T8rAXqiOxt?=
 =?iso-8859-1?Q?l2xccT2q6VZ2ifbx7SR7nwECQacbsy+e3otDwmFq2BtTMgKlGwx0tvcaNn?=
 =?iso-8859-1?Q?HnKvbfqhgnBlMgiMc+TN2oA3C/kOKRNKvMij9ImaZ+nkBI80FB/Gyh8eGC?=
 =?iso-8859-1?Q?UxU88qEmHKxelN4lOnBmQoGU0i0ubcn5MmnDf6nCELSQnCigLFTUoD20lk?=
 =?iso-8859-1?Q?G7L8Vbi2l6Mv7XMxq4c8epNnavTqlBks7l5P9+1OYTweSi9UKru5pFECtj?=
 =?iso-8859-1?Q?NYkeF2+AhQbFRTln9p4g/i4I2xv2OT85OFOOopG2a6Vi4kwgyKIQhWsvcv?=
 =?iso-8859-1?Q?vcwy2kbfSKzuaHBuK0rF1soIPtbc4nRMZ+GnD7qlUW06PkFAhBe8EY0/C9?=
 =?iso-8859-1?Q?HJ4VAn4aBN9PAf5ftfkXF/zLkgZEhSVxHach0Q93dWqCyh/rtENfD2YzCU?=
 =?iso-8859-1?Q?IyJm3An6LHAqlmquHwh6KK8SIlg+rIYDtghBKRwNdnQ7FNFQ9kbAAr4NVc?=
 =?iso-8859-1?Q?rw685SnYHB1fGStoTYzmCcOsHi+a2hNlPfbiI8Qlu6i3xJBeihopXD/LMq?=
 =?iso-8859-1?Q?T2ykMHMhXHETmjbgsQS6j7iyXBE8OWUl45PpCohKbLaBwtGN08iJ1+uKPe?=
 =?iso-8859-1?Q?6KZWANG4ifBHhFR6b/FWiEofXLCegNK03ESols3nBmT0PglATpwyKZd0e1?=
 =?iso-8859-1?Q?3S4YzUb3RP4jjrQ9j4C6kr9W9ADvmvdPYb50uAOIWDqNDx+rwGgIvDJxcF?=
 =?iso-8859-1?Q?tH528GjsCtXYTIbf7IwAVarRIg0JLPot3j/WoWjjVYedb2BU4raF8NH/L8?=
 =?iso-8859-1?Q?rXF6KZQnVDsk8lj3qFQnHA/jEw7/hBOhlvOXpQ24AAUVD+uYrxsVmZ2M8B?=
 =?iso-8859-1?Q?tCXFWnslokytKTRhuVckW8kR4BrLCgJXF96HdwBGHuYtTKMXG1NRGcarBF?=
 =?iso-8859-1?Q?yKfbCNFnBhPI/K6C6zey6VsJuynSskEyrNmp06xM0QXeDEG8n4gPJv/7YF?=
 =?iso-8859-1?Q?exMHxNiPFPhKM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <306478791964E344A7D8AC1881E8A571@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acd737c-69d1-4791-051d-08dd0d038541
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 03:44:52.8031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XErXOlioSnLA67lwaIBabrQVPLHrgYYgGKYvaqKLD9Z22FLm+8BKhp39tCLgiMieQQPnARS6aJfArnYAw1R3zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8032

On 2024/11/21 17:52, Roger Pau Monn=E9 wrote:
> On Thu, Nov 21, 2024 at 03:05:14AM +0000, Chen, Jiqian wrote:
>> On 2024/11/20 17:01, Roger Pau Monn=E9 wrote:
>>> On Wed, Nov 20, 2024 at 03:01:57AM +0000, Chen, Jiqian wrote:
>>>> The only difference between our methods is the timing of updating the =
size.
>>>> Yours is later than mine because you updated the size when the driver =
re-enabled memory decoding, while I updated the size in time when driver re=
size it.
>>>
>>> Indeed, my last guess is the stale cached size is somehow used in my
>>> approach, and that leads to the failures.  One last (possibly dummy?)
>>> thing to try might be to use your patch to detect writes to the resize
>>> control register, but update the BAR sizes in modify_bars(), while
>>> keeping the traces of when the operations happen.
>>>
>> This can work, combine our method, use my patch to detect and write the =
size into hardware register, and use your patch to update bar[i].size in mo=
dify_bars().
>> Attached the combined patch and the xl dmesg.
>=20
> This is even weirder, so the attached patch works fine?  The only
> difference with my proposal is that you trap the CTRL registers, but
> the sizing is still done in modify_bars().
>=20
> What happens if (based on the attached patch) you change
> rebar_ctrl_write() to:
>=20
> static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>                                       unsigned int reg,
>                                       uint32_t val,
>                                       void *data)
> {
>     pci_conf_write32(pdev->sbdf, reg, val);
> }
>=20
If I change rebar_ctrl_write() to:
static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
                                      unsigned int reg,
                                      uint32_t val,
                                      void *data)
{
    printk("cjq_debug %pp: bar ctrl write reg %u, val %x\n", &pdev->sbdf, r=
eg, val);
    pci_conf_write32(pdev->sbdf, reg, val);
}

I can see three time prints, it can't work.
(XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 520, val d40
(XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 520, val d40
(XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 528, val 102

If I change rebar_ctrl_write() to:
static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
                                      unsigned int reg,
                                      uint32_t val,
                                      void *data)
{
    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
        return;
    printk("cjq_debug %pp: bar ctrl write reg %u, val %x\n", &pdev->sbdf, r=
eg, val);
    pci_conf_write32(pdev->sbdf, reg, val);
}=20

I can only see one time print:
(XEN) cjq_debug 0000:03:00.0: bar ctrl write reg 520, val d40

The check prevented the two times incorrect write actions.
    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
        return;

And why my original patch can work too, the check:
+    ctrl =3D pci_conf_read32(pdev->sbdf, reg);
+    if ( ctrl =3D=3D val )
+        return;
happened to play the same role as PCI_COMMAND_MEMORY check.

> Thanks, Roger.

--=20
Best regards,
Jiqian Chen.

