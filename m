Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC1fEH/NgGkfBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8EBCEC58
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218792.1527665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZX-000120-Nf; Mon, 02 Feb 2026 16:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218792.1527665; Mon, 02 Feb 2026 16:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZX-0000wu-Iw; Mon, 02 Feb 2026 16:14:43 +0000
Received: by outflank-mailman (input) for mailman id 1218792;
 Mon, 02 Feb 2026 16:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZW-0000fY-0u
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:42 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46ef0e11-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:40 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:38 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:38 +0000
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
X-Inumbo-ID: 46ef0e11-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rsl9kgeKFDFD3tXSNImarwRVVbI+vszCGrZ4lDAluahBocbcPcej7xvSkVCmGijUMr7xhcERkSAx1KXlwEBjnYJtHn6NEEtxO4Il1WRKaEZ/OlZGd/Sctv6n653k90HtS6T8USJSXZBxxq3PHr5S3S8qTlKM/uG/wnXx5JnI5RkLIL/9FLYVpwsSYsrqtY+rt1Ngk2T4Ggd0rDYSMScWRlPt5cl4rPYJxsDK93t+5+pG8mojUly0sCm8nHYhYroMWML76b+2SNkm+yEyTU0b7M0i99SdQn1zRzim4+Uoa/j6RJLYFyX+2iTH4WFZXD6SPh4MshvbraXlfvR+XsgZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyn14mIWWGcKZv+b3gYE9UBwudPA49aWy+Wq/fLyg6o=;
 b=saQrYG8qoY4fb0/E7+47XZA9ELNx6ZOKlYeBVEWmOWre0tsgipXgWvgwr8mHR+yl2LHsnz3o/gI8EMCPB/cJpDSHE9wjKzXfh8EWcRAuQmYdLFX7xvwpO066fjASpiZ8u2FW6TXNAht4BZeep2O+vFYG2Zjo2ygMNRMY1cPM1XzKQe6aKcGn5LKiu2b7yO6R92VdrdbUMiMRBl3ypHRNxVscqjq7y4NMoNUYHHa6fSRp4jElK4IJrjFVmFeg9eoRKORsAuRzfwibbkUvmnTxhtLCU0cIux7cGFaFoxXHO/o/lJKS4E9BcVhqJ/5DdC7OheWitjmmjo+OMkzrWIybqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyn14mIWWGcKZv+b3gYE9UBwudPA49aWy+Wq/fLyg6o=;
 b=gr9qkSPxrCUROYNj1tgw9PAObXITHw0dpZuVzJR6WfEGaR8TRvX3BJM7DWa/MkerOOaKGm+dkbih2bZFzsflg6z+lglcp2wjIKkQNZendZQ7d7NNDwinq+m5GNCgS5wy3dPRF7irYYiY1EGX9gwjCPI50Oq0U9o1RWqFkpt4/QYrzt+8mu01A7+tG5plkG3IPI2iCBvWBDjnv9QO3yT7jl769PVqyW2le8WPaKmWaE4TlGHUpl/+kMbTAfUSyn+MhTs9iaELZ3QND4oiiU7JrxjcxcuR/TC22ONiO9lYkRrDi4F0tnCEg8gU3srRUz89oiKodzYmcjeo+IFjONzpXg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 02/19] arm/gicv4-its: Add GICv4 ITS command definitions
Thread-Topic: [RFC PATCH 02/19] arm/gicv4-its: Add GICv4 ITS command
 definitions
Thread-Index: AQHclF8HDQo3o0DTckGQ45OEXd7MRg==
Date: Mon, 2 Feb 2026 16:14:37 +0000
Message-ID:
 <3eb1cea5fb870e01b86e964caef5ceb9b2a8ed75.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AMBPR03MB11643:EE_
x-ms-office365-filtering-correlation-id: 1f013205-25b5-443c-2089-08de627629d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?IIeaBhsaEtF3MEAaRjMlb1KubpcMM/qJmQFphiO+/yFru+/SumvY714aNg?=
 =?iso-8859-1?Q?eHhox9kQP5nsf7ufXeLPHTAtDNRrBTPD1WzHNiXag/W8ZqysE7UvhPAKwd?=
 =?iso-8859-1?Q?4dTuILXb7vp+UHApyaqJO7RennuhwCao65EKvJSE7eEBggsLYCKrnUbxe4?=
 =?iso-8859-1?Q?1Xo6/lt1rNDy/7fU+CMCTl1o8uuSneXg+qF/VN9JeDu8Rb8Qn59jf8fLPv?=
 =?iso-8859-1?Q?y40Ail6PEg+dIYuiUPlY/QAp/olCHU36fSLif4Cx9I8xbZN4UyXkD3QjGY?=
 =?iso-8859-1?Q?9AyZM8aPnDiACB+3I+FpdBsxwvo6MxoLrpbjhC/pXTJe/eNNbnOyN9+VAm?=
 =?iso-8859-1?Q?NGBlJ31opcWD8Fs1YYEmTI6xzJvp9IOUgdmlL6AW7t8rs9PNRgwYGCIvUB?=
 =?iso-8859-1?Q?PEYccPsPaNotQHjgfHnFJRjCUamGN7EfbI3YKobNq0MUvX58A5pC08zGAW?=
 =?iso-8859-1?Q?EbP25q+WS/hq+8Prr/zfUU6fwVkVfvcMnjXCY1E458I0RdWQx8USBZUFbE?=
 =?iso-8859-1?Q?dGmoq3L7h6/T5eW6rezGC2/4LU/AHMjvhlxl6t+8aX5kjgnBzSEHErh/XF?=
 =?iso-8859-1?Q?i7dnvypBdkJjmj2ax7sTexTLwkgkwNYdbeIWXhvuVgEtnuBM7Nrf9/yzzP?=
 =?iso-8859-1?Q?W1GUNw7lFLFhhY5wuQiceSIlX59nRJrG+Tjf3WiSmso7w+Itl+AL34sWE8?=
 =?iso-8859-1?Q?O57Dpx66TmQxmYjvctatCxJjvW6KMZMIUm+alo2z2Bq+Gsubyn3hIBQeT1?=
 =?iso-8859-1?Q?v1X/2242d7L48GtzHWfy1pHHX82h098u/6dJ4bt5qh3LnhfGkfau56kh/t?=
 =?iso-8859-1?Q?/V+SEwm+cMJB4x6H45I2UvdTo9tbAdpiO1/64toQJ8/LOFVf6hVSbZ0WL5?=
 =?iso-8859-1?Q?nQMHil651WHzTtVuD2cUVSsnHk3uVszFnu4nZ93tIs4C4lZjE/RafWuQRQ?=
 =?iso-8859-1?Q?MNr2Knztb+M3WdYSNIgFKhdgPWuwi8a8Bf57mi+tqjRrR+5q5zZITK1tFy?=
 =?iso-8859-1?Q?eF7SkLZpP4Ts6d0Jk6QZnJSmW5uc/ue7+VFiRUcRswoqNAHtpvwm/I2434?=
 =?iso-8859-1?Q?6Vdy1oC47m3YT73iVR94UjGhOJOz2yMmQD+vb3UwAl7dQy5BWjGrgjp7RT?=
 =?iso-8859-1?Q?d+kgIS7mW1LPYYPVNGBwqCJFi++oKsc002cC4HxdQ3f6mXJ/u5d/GjIkTQ?=
 =?iso-8859-1?Q?G+tgIlNruppzUHTZWyPZjccIgTECbeia65MTHiyRKVvhgHURk1TejnmBW2?=
 =?iso-8859-1?Q?RKl7vDNyulZsCDRhX6t4I+ybtGZOrRU1tPumN1rgMPvtBZiGshIuHlXp3D?=
 =?iso-8859-1?Q?+8r/oFPrJQfE07wb8AIGFawQpmfAdnu/OiGGEpTimm59xa06oUsjwlwUun?=
 =?iso-8859-1?Q?iR+HsxJl7lLudg/nGRUOUDmNw6Mkcl27X5MDUe33cEg8Bq0Ah6uTuZAXeB?=
 =?iso-8859-1?Q?Oyoqc102eC7RdcTLM1OLN5nQh4JNsxSru/ToWwfH77RB6ubOZ/Wwi0Iz97?=
 =?iso-8859-1?Q?C3frIgq/OwaTYVUnvvxe/AKKSo7xDvFFD+UcIb6EpLWBVbu1ZWvCounBXq?=
 =?iso-8859-1?Q?46RtM7/9oZRwTvcbVjpXhTBHX98N31Gd7kp/FY2t34nvu1JPCub37MOiOc?=
 =?iso-8859-1?Q?X3vzine0MUcUj3I2aTuXvSBhUiJpuCd4Y6IhdZG/+ZDDL0F17EDOCMtcMT?=
 =?iso-8859-1?Q?gKFQYnYFt1QFgdmW/FU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gHpde/Ii6kF52824t8gDEylF7dgA8rSA3gvoEGZMBB9Hv81wCBvWv0hspj?=
 =?iso-8859-1?Q?oQsCxWCRVEA6MqP2/UpLxspjT8H+e+DEA4MtpLV33AN95fMIRhhwBHZUL9?=
 =?iso-8859-1?Q?k5SpQ3tSz+PtAg4mw63/USbsMztQ1VGHhwWx6iUmUfkD4G4SSTKofHS00c?=
 =?iso-8859-1?Q?WsCanFSO4E7IeI0G5l7RlBk+aSEOtES/jIE8VRxnK4KrdK1fB9AlNoXaue?=
 =?iso-8859-1?Q?Cm4NtbpLp6zLSggzRy82X6093ky3lxG3tBiObNnofW0RCvs3HQIqTgj4Fe?=
 =?iso-8859-1?Q?8vVr8HnWYQLzB92eJuAP7+c3Vq9rM2O7WT/1TVg4C1xe1Zaab+J9WZXYSg?=
 =?iso-8859-1?Q?+AHH0RKXFyz7a4j649bs3Feke8ip5KsuSn8f3nofZ3jLFyAwIXT0KU3hTj?=
 =?iso-8859-1?Q?UPirDMuxidjvSgiarDXyMf1Ed1JIsiQt3/QJqRHTQqcEEaX/hkXuu7s2nC?=
 =?iso-8859-1?Q?GxH+VMQD4gy07OUuUpf28PZ/sxcdgslkQoanVYW2CjG2c6LYWEkGQQlNJY?=
 =?iso-8859-1?Q?IiwAf4PWCC59NFXHGsBiwey2GtLLVEUO0QeZdg9SLVi3OwDLWjbdNWwS7b?=
 =?iso-8859-1?Q?TcEv2YEnmIXPz9tpLSPOY+41fayOZUkVYEJNPzJV/rInI2yl6X9klLOLBi?=
 =?iso-8859-1?Q?w23kI2wbKOJCGkv9Va3oid3mo3N9Kp7vg/+ccFPWy4pzF5FiIOlsPnAl8V?=
 =?iso-8859-1?Q?O935yo5uXr9RsS9WTH6URMhHoIKN94aYJtz/nkRS4l65BV1dxJQasHkTy9?=
 =?iso-8859-1?Q?2w0PFCSRemCPerDaeYbtBBxkQkQjuXHGA3Mw7AiQ351vKWgwJLTt3EkVAn?=
 =?iso-8859-1?Q?VVrokAYEDvaEKEuUMixKijMuFdsLIeqBGza1903Ah8Rg8rEbDNikiWKpI+?=
 =?iso-8859-1?Q?c0mmrMoE4865erLyN0lQZUv4JUlDWje2Rz5ljXGf8+hHXg2Mpl4ISECxds?=
 =?iso-8859-1?Q?dbu3B0zy9Xl+VCJsh28CzpuI0CtGs0I8UHKnLnRn/hpEuEcCU6Ov7Fxwf1?=
 =?iso-8859-1?Q?Kxrs+AFlQzqaVUkoV/8C9iSIBrVY0/lSW4Puvg3tsTQzSneYYbLpYJzJU0?=
 =?iso-8859-1?Q?pFkCEXIl3zgNSc0cxbzxOqhsjzrsKjfjnXlZgF+M3zvQmCrfge6lcRRrSf?=
 =?iso-8859-1?Q?DLvbrK19uqD3KPwA/HNCsmZEaZS07OoXN0L/nG/Np+LuWDYo/Wj1XWRoOw?=
 =?iso-8859-1?Q?iroMVGHzKw28Y7xNDOAbR5YrUcWBefo+wbDltP8GIQJTMDEXk8pYnJGMdU?=
 =?iso-8859-1?Q?Jn9ZvYUkyY8SCgsyXLUDIDCEWofNDZXQgdrADuxiCse7BtidnIIPN/NPOQ?=
 =?iso-8859-1?Q?Jk8QjkrvLiS+DTdZ659oGcvLBVd5+zPjPxnDltES8PXW154uc0JKWlhn01?=
 =?iso-8859-1?Q?Vh2LpbIB/xP8f3q9Jozgts+tVGbIylzKg8JmVwLYaLw593yUBRziPNvk1q?=
 =?iso-8859-1?Q?MoijovIKfd0+xiInEKYmlk4uC/paSfUsTstkVeFcDxQvV0fIQ2DrfVueXD?=
 =?iso-8859-1?Q?dGeKriRyf0LhUaSKRJJ+qwvOfpy9EHYyoeEn00nHPKKUCo8JvBMIWxu6Lk?=
 =?iso-8859-1?Q?xPnNMCLksFNalC9HmACmoPYACmYR+qBrXACPPAe6rLymb4hzTmD4YtD0xv?=
 =?iso-8859-1?Q?BFukielRb/CidZ9EXL/tzS3RtcDM+uS3mu50Y6Qgr3cpaBiq77f26tQvDE?=
 =?iso-8859-1?Q?vFFGryvvEPD09RFfX54kSvb354DUPIoEnQICFFQVfH+LtYUEGYuildeKpd?=
 =?iso-8859-1?Q?3CFM6rJ5fSTNbOuTKJVtTDxY47HFGQNMzfuV0mraUTVs2xmBu9Jn+1OFAn?=
 =?iso-8859-1?Q?6c7Bk9Hp9lzFa8onUhnKnMMzXPE0f7g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f013205-25b5-443c-2089-08de627629d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:38.0305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l94HeemlUKN74wbZ7zRgOv2P63enIJQWWs5PnFsaAVV7iwJPGQQHNtu/MrA8tfIQEvNLxj3064HGoWng/IaWKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11643
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,epam.com:dkim,epam.com:mid,arm.com:email,gnu.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AC8EBCEC58
X-Rspamd-Action: no action

Add definitions for GICv4 specific ITS commands.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/include/asm/gic_v4_its.h | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/gic_v4_its.h

diff --git a/xen/arch/arm/include/asm/gic_v4_its.h b/xen/arch/arm/include/a=
sm/gic_v4_its.h
new file mode 100644
index 0000000000..f48eae60ad
--- /dev/null
+++ b/xen/arch/arm/include/asm/gic_v4_its.h
@@ -0,0 +1,41 @@
+/*
+ * ARM GICv4 ITS support
+ *
+ * Penny Zheng <penny.zheng@arm.com>
+ * Copyright (c) 2023 ARM Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; under version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __ASM_ARM_GICV4_ITS_H__
+#define __ASM_ARM_GICV4_ITS_H__
+
+#define GITS_CMD_VMOVI                   0x21
+#define GITS_CMD_VMOVP                   0x22
+#define GITS_CMD_VSGI                    0x23
+#define GITS_CMD_VSYNC                   0x25
+#define GITS_CMD_VMAPP                   0x29
+#define GITS_CMD_VMAPTI                  0x2a
+#define GITS_CMD_VINVALL                 0x2d
+#define GITS_CMD_INVDB                   0x2e
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.51.2

