Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7847B0E781
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 02:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053154.1421923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueNAS-0005nt-OW; Wed, 23 Jul 2025 00:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053154.1421923; Wed, 23 Jul 2025 00:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueNAS-0005lo-Lo; Wed, 23 Jul 2025 00:17:08 +0000
Received: by outflank-mailman (input) for mailman id 1053154;
 Wed, 23 Jul 2025 00:17:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kj6l=2E=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1ueNAR-0005hc-73
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 00:17:07 +0000
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net
 [130.76.144.163]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b7f2e33-675a-11f0-b894-0df219b8e170;
 Wed, 23 Jul 2025 02:17:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56N0H1eI017869; Tue, 22 Jul 2025 20:17:02 -0400
Received: from XCH16-07-09.nos.boeing.com (xch16-07-09.nos.boeing.com
 [144.115.66.111])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56N0Gwxm017851
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 22 Jul 2025 20:16:58 -0400
Received: from XCH16-08-07.nos.boeing.com (144.115.66.115) by
 XCH16-07-09.nos.boeing.com (144.115.66.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Tue, 22 Jul 2025 17:16:57 -0700
Received: from XCH19-EDGE-C02.nos.boeing.com (130.76.144.198) by
 XCH16-08-07.nos.boeing.com (144.115.66.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57 via Frontend Transport; Tue, 22 Jul 2025 17:16:57 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.179)
 by boeing.com (130.76.144.198) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Tue, 22 Jul
 2025 17:16:57 -0700
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:19b::17)
 by BN0P110MB1077.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:16d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 00:16:55 +0000
Received: from BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d]) by BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
 ([fe80::394b:7a34:da07:485d%5]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 00:16:55 +0000
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
X-Inumbo-ID: 5b7f2e33-675a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1753229822;
	bh=O4gcOod1r3ZPzm038/1p1iSSHIbe6XasvKH5Hc0j1p8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NY6gK3o+VupaPNQiZiH18hEKu9tQxjXRZTEX1YdMhykHCZhHcWpTU96J3o0+C+tTl
	 3xe2p32ScxcVHh350r/obzG18VfP+VIrW5kxZuAlx8r28l4wtAMTPmc3PoFhiOR7Is
	 yHHvTLMHhpzZoZ0pjc3OrgGVSJ86zjsf9bM6de5VZ3JFBB478LQyrs0C+Tp3LWZ3mQ
	 o7jQPeQZnPhBY19kw6ZNP9KzR0+uogzAjwVNnfhSDdI6V4/0iFperW6qLDCZodyHPP
	 aQUNW1JKdoAN9ER/sD4DTLcEghkNGmzVA3DUS20kX5wJknVmkA1ssPPG5fqRTrHCMI
	 Xp6YDE2Be8qwQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=vy5apOEGX5ApI1gvGKD9Zng+YherMzp0tnM9XK+tt4MATqo4Hgv4gDwEIOCZu8lDQfbSo+7JuuItxwNzJRraDJ22/6gSaeTvhAz7q8fXw1HtlOLf1eZ2T5c3HhO27K0HPgqZJRR9Vp3CRoQE8s/zsa2D3Zi2he0tCUJE3H3kWpO4q2xxWyFIcyhwePWxvFJD2Oda1roL0B6LJ+4ne8F/cXkeOizW0Mj9PuXxy8KlkXEPghr4V4sCVbi1QkRfqUr+vpjIvLIjAYq4gKuBHPsv4/LOGTPWKgaviHydA9Zw1g1BaI4E+9CZn+bHtbp6PNP+JS/cH142L/u2sYnXdLdmJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4gcOod1r3ZPzm038/1p1iSSHIbe6XasvKH5Hc0j1p8=;
 b=FY4oYUWodlv/JGoQfIjXMA3SS0hks8JC5THhfCnvxIeu9nl41Zbqbd22nI72T8gSGn7CWgHHeHJLiKZxCi6a/AJ/7axYBBJUgbbymT/91hhlKEIjk6dS0XmCVrvhulhNlgC6tFns4BxWvjcXSjyeKBG4EMTmAzdW9snvbUfU4XiUlOgu9LNXZqtWJHPzvF+IHYcNMfdqTTCzPtLXnltfn0RvkGla68WmDtMjXbi9qZpMbT51NCAKPOrc1yYM2VxITA+PSQthnWPVUtusqxdojA7jikj569zSH0QzhkQ5T1bQ6WM+61hadiGO2haedXW5WTrNQ9ZiWLJrKM6nYPynQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4gcOod1r3ZPzm038/1p1iSSHIbe6XasvKH5Hc0j1p8=;
 b=m++Yrz/V1YzEoIPo+soQrsuiwtKGNSze7FQGnAeXGUsLCcy8ZCPKJl+W0cJREudlRQxIulJ5m1axhziDahaZNAIZK7hR5jleDmytryVQlYSkzJH+IAHtBIsaIZEuEBhFhwgij2uQa2dLkeAcOefJDBn7NQ8Nq90bBLe9vw19vfc=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
        "Whitehead (US),
 Joshua C" <joshua.c.whitehead@boeing.com>,
        Nathan Studer
	<nathan.studer@dornerworks.com>,
        Stewart Hildebrand <stewart@stew.dk>,
        "Dario
 Faggioli" <dfaggioli@suse.com>,
        Juergen Gross <jgross@suse.com>, "George
 Dunlap" <gwd@xenproject.org>,
        "xen-devel@dornerworks.com"
	<xen-devel@dornerworks.com>
Subject: RE: [EXTERNAL] Re: [XEN PATCH v3] xen/arinc653: fix delay in the
 start of major frame
Thread-Topic: [EXTERNAL] Re: [XEN PATCH v3] xen/arinc653: fix delay in the
 start of major frame
Thread-Index: AQHb98TBnd8JF68awUCXce4ZDvFPKbQ+oyuAgAA2ihA=
Date: Wed, 23 Jul 2025 00:16:55 +0000
Message-ID: <BN0P110MB2148E2F55FD1DC7B22A78296905FA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
References: <cb18dbefaf574eb4d3647097d06debcab378533a.1752815008.git.anderson.choi@boeing.com>
 <0c262d60-6776-4c60-ae6e-5d168bba9d93@amd.com>
In-Reply-To: <0c262d60-6776-4c60-ae6e-5d168bba9d93@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB2148:EE_|BN0P110MB1077:EE_
x-ms-office365-filtering-correlation-id: ceddbc7c-54a9-4257-5ef3-08ddc97e3b75
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dXJNd2tuUlJ1UDV4MUdPazdVVkxobEVXWHhaS2VORUNLREZPVHZYMHRXYTFX?=
 =?utf-8?B?YWFnQVJCdVcycHI5WlZ4ZmpxQzdwcVNmNVF2c3V5MDVSTEVoaE1aYjZ0ZjJ3?=
 =?utf-8?B?czgrejc4YysrYitKTHRsdExCZTJoVXdPYjhzUEtkSHArc1FMSUdkV2ZyQU5a?=
 =?utf-8?B?NmhaNU5WRXhKbitjcFRBa1FFWjd6enNFVzg1M0RoMXphNXV4aHp2Vms2TVRk?=
 =?utf-8?B?V0NNV1dLMElmZTRwQmlEY3o2UTVRemc3RERNL0dPanZVNVBpZmF4dWtoclNL?=
 =?utf-8?B?WHBOV1NoSlNrOWZYeHFDbHg5akEycEtEQ2dub1BON09BbnJHcHFVRFJMKzZ5?=
 =?utf-8?B?Qm9Va0dQMUJPRENuVE05d290djNjaXhjczJYZUVhMm1WMEhDWlFrMjFGbHdG?=
 =?utf-8?B?Q0VYWU1WTElDbWluT2xmRVVzMWZCNW5tNmFTQVhZU3hlTWg4WVJUQTcwSmVV?=
 =?utf-8?B?SlRqQXRZeGpvN0xveWdSWWQ5MHFyKzNSZWdzbGQ5ZmZhOFZnb0UzZ0kvWkxz?=
 =?utf-8?B?MUkvd0toTGg2RWJRdGN1RlRLRG5Gd0FYbTQvSS9OSEU3d1VMNFoyY1lCd3py?=
 =?utf-8?B?bkw1dTBnV2s1RUZRc0M3OVN4anRXMDRCaDR2WkRERVpyZzdYODdJMlJDelU0?=
 =?utf-8?B?cXNDVHdoNTROUnQ3dEN1ZFArSzR5Wk4wRUVFRTBOdVY1VGpJT0prSys1NGla?=
 =?utf-8?B?MjN6ZzVsUWVZdkM0MTh4M2hDNmxIZkxSSTlWM2VQaDhWZ0srSW5CUExRYnJL?=
 =?utf-8?B?bVJvcE5hSlhmMGNVdWxZaUdOSjBZWGVuQW9OS0VJR214c0xtUmpkWHorR1ND?=
 =?utf-8?B?cTNZQmYyMnA2M3o5cHVFejJTVmdyODVuN01Gc3kyLzVHNnNjdGJzcVRtMnpl?=
 =?utf-8?B?VTMxdHZCaVFZajVDMEJHVVdZZURsbTlOaWw4MDdxUDZTb3ZJZTFKMnNBSzd1?=
 =?utf-8?B?MzhiK2xnWjcyRk1oRTFJcW1EOXBtNlplc3JySUs2ZGN4Q2JZZit6azRiMWEz?=
 =?utf-8?B?cGxwNkt1WEFPMGZlUkVnVUtFOHNpejFvWE1TdG0vUUFWWE9hTzl3Yi9wZzJT?=
 =?utf-8?B?cTdoT256Q2p1ZEtNSUNUZXRKUGtBY1p6ajJDRExMNXpUWmlUMGNGdEM1ZE1m?=
 =?utf-8?B?MmVHV05sOTk4OVBHd3JUSEIvbktPN0lkMDAvdk5wVmtDM1B6ZVppSXAwbkRX?=
 =?utf-8?B?SFpMOUN6OE02L1czb3N4dDdoajlUM0NZVlA3R0hZb0V2cFp4UUVPRkhQQ2sx?=
 =?utf-8?B?UHp5VGFhWGwyNE9WS21EVWR0MHduKysrcytkWFBJZEVyT3NYdmVSK1dzb0c1?=
 =?utf-8?B?NGdTV2RnZEd2c3RpcXltenlJZ0t5a3NNYnQxQUxSZW1yS2xrelRwTStTRmZB?=
 =?utf-8?B?b0NCNldvZWw0MjkxeVIrWTljd2t1TG9UdFVrK3hZN0ZWR0w4S05nS015bXZT?=
 =?utf-8?B?VXdCbDZza203aVhaL0QzTXdGL3VtRkQzb3NlTUxBc283dVdPS2xqU2V0cFlu?=
 =?utf-8?B?RFJBSGlodWhUWnp3VFcxcG9LY3IreFY4cDlFUzhRSHJDbWFYa3hOQU5TM3Rv?=
 =?utf-8?B?NlA5Q2kxSXBhWGhaYmNxeTZBbU9zTXdvTkd4eUJ4TjBRS3J5U2RKSDJVa1Ra?=
 =?utf-8?B?cXRwMURPb3NXR2ZxUC9SVmxPU21VRjhGUWZZSmczZzBFTkFlYnNobGZtTzhi?=
 =?utf-8?B?QWx0bTZvcHpPeUp1aWFRTkc4aVlTbFJCUnBZN2FUOTFCaFVWcGlpR0o5UEti?=
 =?utf-8?B?aGo3amtYelBlTWFTa29zb2RBVWFBbkRSdDg3MzBBWjBBeWpZQXBQelRHMVFv?=
 =?utf-8?B?T1h1UkloMjlpZ3RGanpjcW5BbmNZd3l0Y3JsNEpBMWpLMmcxYWNTTis1ZnJB?=
 =?utf-8?B?aDBncjdzVGtyRUdQRVFFRXRVOXJ2SmVYWEJoTWJoWUFwYkFTdDNDL1hpS0pD?=
 =?utf-8?B?VG0zRjFPeFU2bktkWkFlUlVZZUNMRTNEK21NSVBXZWN5TGxqNUtwenNEMTlK?=
 =?utf-8?B?aHZzRDJ3NjV3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEI4UG1Pcmk2RjZ1eUFkR0Jqb1dBdFMxM2JUcVV4QmRBMGtER2hZdXlNNENC?=
 =?utf-8?B?MDhtNVlBOEtMYk04QUgwMGRkOGdMbmQ1dmtBMWp4UEY2ZkpHWHRHcG05Z2hQ?=
 =?utf-8?B?aWdqcitiSmlLZ3lja0lUYnU2a3IwNFdDSzYxNFI3Zmt5WlhRK2VKaFlqTVow?=
 =?utf-8?B?S0hWN0xyOW9pVDFkOHpXUTBONTduK1JRTXk0YXEvc1NlZjhZM0VCaFJDbjRt?=
 =?utf-8?B?ZWdUMzlHRko4T3BseTRWUWEwRVNCQVlVbXBCMXUwS0ZJMkUvR1BBMkpQbGN6?=
 =?utf-8?B?ZmtFNkhHbjdoaFFCWUE1Nkl3SmFFdVh0OHIrazlNTm9TRUpWM2xLYklwNzRU?=
 =?utf-8?B?cExYVWFqVFBiVE9FTGN4NytoRWZiMVY1N1pGMGhjWk1Wd1QwM081TWkvWkZ2?=
 =?utf-8?B?K0pSNkZZL0pmcGYzZGU3cDlHd1FsREFMVnVTYW53N2RQVUFZalc5WDExcXBD?=
 =?utf-8?B?SU9QRTdpLzdFaXljZGUxNVZMQVVia0dSeFd3UFlyTnlYMHoybUtVN00xQnJL?=
 =?utf-8?B?cjFEclRPQm85K3Q2SytiVFFmTGVzc01xcE9QbXl6R013WXVqejA2NG9QeWF2?=
 =?utf-8?B?THZiS2VyMmtlam1FQXRtdlh5RElQbGR4cWtNdldnOTdmTGNra0dDL2JpZWNj?=
 =?utf-8?B?R0hvK0hHZk16VGpUUlNyOU1ZbC8rcklYVzgwdys4cUUyUnFTY05UUmRlb1ZF?=
 =?utf-8?B?cGhDeUFSd0hoK09GUVF3L2pMV0grMFA0Q0lqck1pamJlcThwaE50M0t5RkJk?=
 =?utf-8?B?RDJaWk9wVHAwaDVxOFB5M0VqR1hkUUJieWdRdUJuTTFlYWljQ3l4Mmx1dVJI?=
 =?utf-8?B?VFBnNGFMTTk2RE5MalNKWHdyVEdLdWZxRlF4Ym12V1VKZVBITFlrTlh4OXBt?=
 =?utf-8?B?aXBNcG9IbEpYbXN1c2dJbjJrSTJSZElzQTcreGhxdVBOOUI5VG9GMUM4N0Ri?=
 =?utf-8?B?bzcrYzVVd3JRTlNVanM0cERsZmFhQnB0dXNlajZpZThudEJTSGZZd2ZqQldH?=
 =?utf-8?B?QSsvNnZHbFdKUVJRckNjdkdZWjRtanFLVmxMYTF6bGhEbitmK0NoOGlVMTVZ?=
 =?utf-8?B?S0R3amVGZlZuakI2bjBHVXRXZHdQLzg5RjZ5ZjRvTjlML2llVDlVdkZ2cTFP?=
 =?utf-8?B?dUdjaWp1R3M3ZGUyRlMreDlCU21rM1ZTbUJyaUo2QmJlSno1OUNCa1FWQVZV?=
 =?utf-8?B?VklsdWxwcHg0STJQOTFUN3cvS1ZWZ0lJWjlIZDBKWklaS2VwOElDWGs5T0NZ?=
 =?utf-8?B?ODFpYm9pOTdNZllwcll0YmNaalAxTE9xeU1iZnNBbGFKam8ycG1VaG1TZzVE?=
 =?utf-8?B?eHpZNW05TFJnUndkYWpsLzljdURQOEdEbGJlaTdxOURud1owMUpmeTRuRlYr?=
 =?utf-8?B?bHM0eGZLMlcrSCtZSGo5OHZtYnRURzI3dUo3dW1pMzdyamVpcE1CaGIzbTgy?=
 =?utf-8?B?NVZqSjJyYnNtMmh4UHE5NEp4WTFEK2x6V05qUnVaa3JIc3loaWxQMitWMFh6?=
 =?utf-8?B?ajd6WEQ2enBkN0F4N2YwMEhlUG1ISnJ2c0M0TUpzdkJ1UlJZdE9DYmZCZGIz?=
 =?utf-8?B?VkFtTHAwWkRTYmg0ZXlUSjNqVWdKallYRXZVZjVNcERLSWJwUGsrUlVqTC9l?=
 =?utf-8?B?TkJTV3FKZDNlWUVCM3JKY3JTN3VRVlV4VnJTMDNoQmMvbHZyWjhtRGhYTG9z?=
 =?utf-8?B?TTArL3lmdjZPTy9EdC9iYUVrb0VTTVE5ck9YQVAxVmEveG9kZzJDa0t4Q1g1?=
 =?utf-8?B?T1JNVUkyMkRFajVZVjhIcGs4MWVibXN6MXgxeEw1S0NobU42Y2lrRlFZeHhl?=
 =?utf-8?B?aEhreVUzOWo2eU5RR01GcHB6bUVUUGg5VCtWUU1qaXJ4RkQ1NHRHMTgwN1ZK?=
 =?utf-8?B?N3JYVEJ2SHZJbmtUMUcrTnliYi9jdmRncms0Q3ZHQ0l5czZmcW8yTW1uUW9l?=
 =?utf-8?B?TkdSSldySVpxOFUrSjVsUnJvZ2R4L3dDbnlMQjdHSFREenoyMFhzeDBHZUNu?=
 =?utf-8?B?eXFvOWZsRWVWM3BMeVFPMFIxSzJMelF5cVlzeDFjeGU3RExsSmQ3UkRnQWtE?=
 =?utf-8?Q?cafXx9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ceddbc7c-54a9-4257-5ef3-08ddc97e3b75
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 00:16:55.7045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1077
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

U3Rld2FydCwNCg0KPiBFWFQgZW1haWw6IGJlIG1pbmRmdWwgb2YgbGlua3MvYXR0YWNobWVudHMu
DQo+IA0KPiBIaSwNCj4gDQo+IEl0IGxhcmdlbHkgbG9va3MgT0sgdG8gbWUsIGp1c3QgYSBmZXcg
c21hbGwgY29tbWVudHMgYmVsb3cuDQo+IA0KPiBPbiA3LzE4LzI1IDA1OjE2LCBBbmRlcnNvbiBD
aG9pIHdyb3RlOg0KPj4gQVJJTkM2NTMgc3BlY2lmaWNhaW9uIHJlcXVpcmVzIHBhcnRpdGlvbiBz
Y2hlZHVsaW5nIHRvIGJlDQo+PiBkZXRlcm1pbmlzdGljDQo+IA0KPiBUeXBvOiBzL3NwZWNpZmlj
YWlvbi9zcGVjaWZpY2F0aW9uLw0KPg0KQWRkcmVzc2VkIHRoZSB0eXBvLg0KDQpBUklOQzY1MyBz
cGVjaWZpY2F0aW9uIHJlcXVpcmVzIHBhcnRpdGlvbiBzY2hlZHVsaW5nIHRvIGJlIGRldGVybWlu
aXN0aWMNCg0KPj4gUGVyIGRpc2N1c3Npb24gd2l0aCBOYXRoYW4gU3R1ZGVyLCB0aGVyZSBhcmUg
b2RkIGNhc2VzIHRoZSBmaXJzdCBtaW5vcg0KPj4gZnJhbWUgY2FuIGJlIGFsc28gbWlzc2VkLiBJ
biB0aGF0IHNjZWFuYXJpbywgaXRlcmF0ZSB0aHJvdWdoIHRoZQ0KPj4gc2NoZWR1bGUgYWZ0ZXIg
cmVzeW5jaW5nDQo+IA0KPiBUeXBvOiBzL3NjZWFuYXJpby9zY2VuYXJpby8NCj4gDQo+IFRoZSBs
aW5lIGlzIGFsc28gdG9vIGxvbmcuDQo+IA0KQWRkcmVzc2VkIHRoZSB0eXBvIGFuZCB0aGUgbGVu
Z3RoeSBzZW50ZW5jZS4NCg0KUGVyIGRpc2N1c3Npb24gd2l0aCBOYXRoYW4gU3R1ZGVyLCB0aGVy
ZSBhcmUgb2RkIGNhc2VzIHRoZSBmaXJzdCBtaW5vcg0KZnJhbWUgY2FuIGJlIGFsc28gbWlzc2Vk
LiBJbiB0aGF0IHNjZW5hcmlvLCBpdGVyYXRlIHRocm91Z2ggdGhlIHNjaGVkdWxlDQphZnRlciBy
ZXN5bmNpbmcgdGhlIGV4cGVjdGVkIG5leHQgbWFqb3IgZnJhbWUuDQoNCj4+IFBlciBzdWdnZXN0
aW9uIGZyb20gU3Rld2FydCBIaWxkZWJyYW5kLCB0aGUgd2hpbGUgbG9vcCB0byBjYWxjdWxhdGUN
Cj4+IHRoZSBzdGFydCBvZiBuZXh0IG1ham9yIGZyYW1lIGNhbiBiZSBlbGltaW5hdGVkIGJ5IHVz
aW5nIGEgbW9kdWxvDQo+IG9wZXJhdGlvbi4NCj4gDQo+IFRoZSB3aGlsZSBsb29wIHdhcyBvbmx5
IGluIGVhcmxpZXIgcmV2aXNpb25zIG9mIHRoZSBwYXRjaCwgbm90IGluIHRoZSB1cHN0cmVhbQ0K
PiBjb2RlYmFzZSwgc28gaXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIG1lbnRpb24gaXQgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlLg0KPg0KUmVtb3ZlZCB0aGUgcmVmZXJlbmNlIHRvIHRoZSB3aGlsZSBs
b29wLg0KDQpQZXIgc3VnZ2VzdGlvbiBmcm9tIFN0ZXdhcnQgSGlsZGVicmFuZCwgdXNlIGEgbW9k
dWxvIG9wZXJhdGlvbiB0bw0KY2FsY3VsYXRlIHRoZSBzdGFydCBvZiBuZXh0IG1ham9yIGZyYW1l
Lg0KDQo+PiANCj4+IEZpeGVzOiAyMjc4N2YyZTEwN2MgKCJBUklOQyA2NTMgc2NoZWR1bGVyIikN
Cj4+IA0KPiANCj4gUGxlYXNlIHJlbW92ZSB0aGUgZXh0cmFuZW91cyBuZXdsaW5lIGJldHdlZW4g
dGhlIEZpeGVzOiB0YWcgYW5kDQo+IHJlbWFpbmluZyB0YWdzDQo+IA0KUmVtb3ZlZCB0aGUgbmV3
bGluZS4NCg0KRml4ZXM6IDIyNzg3ZjJlMTA3YyAoIkFSSU5DIDY1MyBzY2hlZHVsZXIiKQ0KU3Vn
Z2VzdGVkLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29t
Pg0KU3VnZ2VzdGVkLWJ5OiBOYXRoYW4gU3R1ZGVyIDxuYXRoYW4uc3R1ZGVyQGRvcm5lcndvcmtz
LmNvbT4NClNpZ25lZC1vZmYtYnk6IEFuZGVyc29uIENob2kgPGFuZGVyc29uLmNob2lAYm9laW5n
LmNvbT4NCg0KPj4gQEAgLTUyNiwyOSArNTI4LDMwIEBAIGE2NTNzY2hlZF9kb19zY2hlZHVsZSgN
Cj4+IA0KPj4gICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWRfcHJpdi0+bG9jaywgZmxhZ3Mp
Ow0KPiANCj4gU2luY2UgdGhlIG51bV9zY2hlZHVsZV9lbnRyaWVzIDwgMSBjYXNlIGlzIG5vIGxv
bmdlciBoYW5kbGVkIGJlbG93LCB3ZQ0KPiBkZXBlbmQgb24gbWFqb3JfZnJhbWUgPiAwLiBQbGVh
c2UgYWRkIEFTU0VSVChzY2hlZF9wcml2LT5tYWpvcl9mcmFtZSA+DQo+IDApOyBoZXJlLg0KPg0K
Pj4gLSAgICBpZiAoIHNjaGVkX3ByaXYtPm51bV9zY2hlZHVsZV9lbnRyaWVzIDwgMSApDQo+PiAt
ICAgICAgICBzY2hlZF9wcml2LT5uZXh0X21ham9yX2ZyYW1lID0gbm93ICsgREVGQVVMVF9USU1F
U0xJQ0U7DQo+PiAtICAgIGVsc2UgaWYgKCBub3cgPj0gc2NoZWRfcHJpdi0+bmV4dF9tYWpvcl9m
cmFtZSApDQo+PiArICAgIC8qIFN3aXRjaCB0byBuZXh0IG1ham9yIGZyYW1lIGRpcmVjdGx5IGVs
aW1pbmF0aW5nIHRoZSB1c2Ugb2YNCj4+ICsgbG9vcCAqLw0KPiANCj4gU2ltaWxhcmx5IHRvIHRo
ZSBjb21taXQgbWVzc2FnZSwgdGhlcmUgd2FzIG5vIGxvb3AgaW4gdGhlIGNvZGUgYmVmb3JlLCBp
dA0KPiBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gbWVudGlvbiBpdCBpbiB0aGUgaW4tY29kZSBjb21t
ZW50Lg0KPg0KQWRkZWQgQVNTRVJUKCkgYW5kIHJlbW92ZWQgdGhlIG1lbnRpb24gdG8gdGhlIGxv
b3AuDQoNCiAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkX3ByaXYtPmxvY2ssIGZsYWdzKTsN
Cg0KLSAgICAvKiBTd2l0Y2ggdG8gbmV4dCBtYWpvciBmcmFtZSBkaXJlY3RseSBlbGltaW5hdGlu
ZyB0aGUgdXNlIG9mIGxvb3AgKi8NCisgICAgQVNTRVJUKHNjaGVkX3ByaXYtPm1ham9yX2ZyYW1l
ID4gMCk7DQorDQorICAgIC8qIFN3aXRjaCB0byBuZXh0IG1ham9yIGZyYW1lIHVzaW5nIGEgbW9k
dWxvIG9wZXJhdGlvbiAqLw0KDQo+PiArICAgIGlmICggbm93ID49IHNjaGVkX3ByaXYtPm5leHRf
bWFqb3JfZnJhbWUgKQ0KPj4gICAgICB7DQo+PiAtICAgICAgICAvKiB0aW1lIHRvIGVudGVyIGEg
bmV3IG1ham9yIGZyYW1lDQo+PiAtICAgICAgICAgKiB0aGUgZmlyc3QgdGltZSB0aGlzIGZ1bmN0
aW9uIGlzIGNhbGxlZCwgdGhpcyB3aWxsIGJlIHRydWUgKi8NCj4+IC0gICAgICAgIC8qIHN0YXJ0
IHdpdGggdGhlIGZpcnN0IGRvbWFpbiBpbiB0aGUgc2NoZWR1bGUgKi8NCj4+ICsgICAgICAgIHNf
dGltZV90IG1ham9yX2ZyYW1lID0gc2NoZWRfcHJpdi0+bWFqb3JfZnJhbWU7DQo+PiArICAgICAg
ICBzX3RpbWVfdCByZW1haW5kZXIgPSAobm93IC0gc2NoZWRfcHJpdi0+bmV4dF9tYWpvcl9mcmFt
ZSkgJQ0KPj4gKyBtYWpvcl9mcmFtZTsNCj4+ICsNCj4+ICsgICAgICAgIC8qIG1ham9yX2ZyYW1l
IGFuZCBzY2hlZHVsZVswXS5ydW50aW1lIGNvbnRhaW4gREVGQVVMVF9USU1FU0xJQ0UNCj4+ICsg
ICAgICAgICAqIGlmIG51bV9zY2hlZHVsZV9lbnRyaWVzIGlzIHplcm8uDQo+PiArICAgICAgICAg
Ki8NCj4gDQo+IFRoZSBzdGFydCBvZiB0aGUgbXVsdGktbGluZSBjb21tZW50IHNob3VsZCBiZSBv
biBpdHMgb3duIGxpbmUuIEkga25vdyB0aGUNCj4gY29tbWVudCBmb3JtYXQgd2FzIGEgcHJlZXhp
c3RpbmcgaXNzdWUsIGJ1dCBzaW5jZSB5b3UgYXJlIGNoYW5naW5nIHRoZSBsaW5lcw0KPiBhbnl3
YXksIHBsZWFzZSBhZGhlcmUgdG8gQ09ESU5HX1NUWUxFIG9uIHRoZSBjaGFuZ2VkIGxpbmVzLg0K
PiANCkFkZHJlc3NlZCBhcyBiZWxvdy4NCg0KLSAgICAgICAgLyogbWFqb3JfZnJhbWUgYW5kIHNj
aGVkdWxlWzBdLnJ1bnRpbWUgY29udGFpbiBERUZBVUxUX1RJTUVTTElDRQ0KKyAgICAgICAgLyoN
CisgICAgICAgICAqIG1ham9yX2ZyYW1lIGFuZCBzY2hlZHVsZVswXS5ydW50aW1lIGNvbnRhaW4g
REVGQVVMVF9USU1FU0xJQ0UNCiAgICAgICAgICAqIGlmIG51bV9zY2hlZHVsZV9lbnRyaWVzIGlz
IHplcm8uDQogICAgICAgICAgKi8NCiAgICAgICAgIHNjaGVkX3ByaXYtPnNjaGVkX2luZGV4ID0g
MDsNCg0KPj4gKyAgICAgICAgc2NoZWRfcHJpdi0+c2NoZWRfaW5kZXgrKzsNCj4+ICsgICAgICAg
IHNjaGVkX3ByaXYtPm5leHRfc3dpdGNoX3RpbWUgKz0NCj4+ICsgICAgICAgICAgICBzY2hlZF9w
cml2LT5zY2hlZHVsZVtzY2hlZF9wcml2LT5zY2hlZF9pbmRleF0ucnVudGltZTsNCj4+ICAgICAg
fQ0KPj4gLQ0KPj4gKw0KPiANCj4gUGxlYXNlIHJlbW92ZSB0aGUgZXh0cmFuZW91cyB3aGl0ZSBz
cGFjZQ0KPiANClJlbW92ZWQgdGhlIHdoaXRlIHNwYWNlLg0KDQpJIGRvIGFwcHJlY2lhdGUgeW91
ciB2YWx1YWJsZSByZXZpZXcuDQpXb3VsZCBpdCBiZSBva2F5IHRvIHN1Ym1pdCB2NCB3aXRoIGFs
bCB0aGUgY2hhbmdlcyBhcHBsaWVkPw0KUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlJ3MgYW55
dGhpbmcgdGhhdCBkb2Vzbid0IHJlZmxlY3QgeW91ciBjb21tZW50cyBjb3JyZWN0bHkuDQoNClRo
YW5rcywNCkFuZGVyc29uDQoNCg0K

