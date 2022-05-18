Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962C252B862
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 13:14:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332025.555664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHdK-0002r4-89; Wed, 18 May 2022 11:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332025.555664; Wed, 18 May 2022 11:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrHdK-0002of-50; Wed, 18 May 2022 11:14:26 +0000
Received: by outflank-mailman (input) for mailman id 332025;
 Wed, 18 May 2022 11:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p3vY=V2=citrix.com=prvs=130e47117=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nrHdI-0002oZ-RU
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 11:14:24 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aab6ef8a-d69b-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 13:14:23 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2022 07:14:20 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6450.namprd03.prod.outlook.com (2603:10b6:806:1c1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 11:14:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 11:14:17 +0000
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
X-Inumbo-ID: aab6ef8a-d69b-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652872463;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qA6mY1TGIYqa1RUBfpYs4NWpiulEUJrZAoKn08ZRtus=;
  b=HHHgZRMImG67zFZYvJU4rtjiePrhQwbGx+asxI7zswRDqP4vPNhPY5O1
   1Ktj+ipC9xnSLOrPOvYfNJdXfSqecJhMkNLWr9/vy8Sl15jdvbVSHztA4
   imZSkbYaHY5mQcS4fQKyEErKyd0/jS37yZRb7jip/QMODfRaQIRnP4kqI
   U=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 71577231
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/MiTlKBYdsErUhVW/z/iw5YqxClBgxIJ4kV8jS/XYbTApGwlgj0Bx
 2QcW2nVM/jeMTSnL9F2YIWwp0wDvpbUnYBlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhww
 vNgpaWaEj0KL6fzhOAsCwlEGQFxaPguFL/veRBTsOS15mifKT7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t3B8mcGM0m5vcBtNs0rulIEezTe
 Iwybj13YQ6bSxZOJk0WGNQ1m+LAanzXLGQF9w3P/vNfD277klBz8qDyOdruI9GRYsNQoVepj
 3r+4DGsav0dHJnFodafyVqIm+TG2w3yXokfELml3vdwhRuYwWl7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQonGeuQUHc8FNCOB84waIooLY7Q+WCWkDSj9pc8E9uYk9QjlC6
 7OSt9bgBDgqvLjLT3uYr+2QtWnrZnNTKnIebygZSwdD+8PkvIw4khPISJBkDbKxidr2Xzr3x
 lhmsRQDulnatuZTv43TwLwNq2jESkThJuLt2jjqYw==
IronPort-HdrOrdr: A9a23:cna8V65Pfh147EjtzgPXwZGCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+843WBjB8bZYOCAghrmEGgC1/qu/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXerIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonis2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlaQkEyzzYJriJaYfy+Azdk9vfr2rCV+
 O85SvICv4Drk85uFvF+CcFlTOQiArGoEWStGNwyUGT3fARAghKSvapzLgpDCcwoSAbza5B+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jRiuKYlGclsRLYkjQpo+VY7bVDHwZFiFP
 MrANDX5f5Qf1/fZ3fFvnN3yNjpWngoBB+JTkULp8TQilFt7TpE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyAG3QRhDHNn6UPD3cZeo6EmOIr4Sy7KQ+5emsdpBNxJwumI
 7ZWFcdrmI2c1KGM7z44HSKyGG4fIyQZ0Wc9igF3ekJhlTVfsuZDQSTDFYzjsCnv/ITRsXGRv
 fbAuMiP8Pe
X-IronPort-AV: E=Sophos;i="5.91,234,1647316800"; 
   d="scan'208";a="71577231"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cbg8jyyhlBPZfNastX9WhxVJpZ+Ky14EjdUZ+LZ8bzqr+Tt8c9b3KGlnxQltqVoidzJGZtvg0xqc38SDj3U/Vot7PkVw9kbrNWVYx0NuJehdGtyhchHUsBet5Rm6tN5dsVPNQZEJliop54Cn9vTmv81blQ2cu2jb9Dlq1508TfyTdEwBO+F/3JB178D52FsokyCq/Tta5w1gjGAjRP50ZsZe5ti0eHl9ubEhYQdRkWuIxlce7OcSfHQ526kMc93I0FQIUsTh4h+r9K1zD3kqGGm1iQ09fIMImeQlyTK+suQyfgVshjUZuQnx2MgSlsKLwQmAUgg4AtQAglMY2Ze4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qA6mY1TGIYqa1RUBfpYs4NWpiulEUJrZAoKn08ZRtus=;
 b=dxSFYgcRNpBv5NxI8ge/h5qB4mDVGSItE0M4NlnYHU473rt0tGGRlQI8o6gl5sLjiROeawDH7RojEZ4NBltjWsIBsD+apXCDhLQSwTH4hECt644fTAIb+8kyQsN0hvGD9wGvIov/5wnRXGS2MP7NFtoKF1io30IGJ3GodC66jzDWJceP1aj57eum5YSI5jTGXUbqAo9lCVeCbCFARTYkW1e0OjJQGbBq/QG8rzAl7rT2d6QSIJnTwMtkuOmJPwhkOu2aJmi5ivmzAq0nZcsRSPksdh/uydCrehkclO7faEYU24nfmLNd5hRFxz73k+siTg5bfn+Y1JBhKghImJZhvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qA6mY1TGIYqa1RUBfpYs4NWpiulEUJrZAoKn08ZRtus=;
 b=hrzQ9urs0kDYrVba1w575xf11qA2jqaLNhhcESVNnEfcuam8XKKl2B66I1r99xdEVwFfThtb83CviEcIqYywA6m9I9RBTBI+HW1AyP9oCx9nIV03ueTrbuia50BuKrNZ0VVEa9ftKIELt3JH3/5LeErLkGFv4+gq+8zVQIX2vpk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 1/2] xen/cpupool: Reject attempts to add a domain to
 CPUPOOLID_NONE
Thread-Topic: [PATCH 1/2] xen/cpupool: Reject attempts to add a domain to
 CPUPOOLID_NONE
Thread-Index: AQHYaiYkCDtg+YouUE6RTw/ztN5ARK0kb2CAgAANJgA=
Date: Wed, 18 May 2022 11:14:17 +0000
Message-ID: <37b75732-29b5-7fd8-4d93-a7677eebbfa0@citrix.com>
References: <20220517194113.2574-1-andrew.cooper3@citrix.com>
 <20220517194113.2574-2-andrew.cooper3@citrix.com>
 <2D47137E-C808-4FA7-B220-7022C85BBB4F@arm.com>
In-Reply-To: <2D47137E-C808-4FA7-B220-7022C85BBB4F@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72c83b15-be5e-4d0c-6519-08da38bf8c54
x-ms-traffictypediagnostic: SA1PR03MB6450:EE_
x-microsoft-antispam-prvs:
 <SA1PR03MB64509C00ACDD464CABD75FF9BAD19@SA1PR03MB6450.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fEC7jAR2VZ5gvCfZmDrMWPaPAjYmQLV8fhm6gPp9KnAhnu/OI8ymxvtSL4rT9Uvi5d+CS2UjZINaZ39fymgiKX8LtbYdfyu1AqYTz+sJWWIboibny3ng9KjoAmOofbs7S8i9VgBPi17yokBTKdbNrJdnnGfzazOELkso2METQaYtrCvBFkbBE1Sd7tuTuQruWyF7Oe9NXpyPv47xNTl2/PplSlnEc1qsIe3y2Ouxiv95oXh4E6tLBM8ls/z+1IwrR0o4u/mqYAe/9G4x1mnmShxBttxccVUVbQZQhDIJHPlvnV9L0cFlo+b6+AuOpLLL2dRaNLLvCRTm8VXvtHEZoFaerasFgyxGBYFU4pMmtMSdE3LFJgKg0K5fSjlMgFbI/yAd6wEnYgTkSpSehVKbPWzLCqoTx/urqGUqn3Bc7yeyAAENZ2oWJVvL6QFXVKBwQSdPKzbHTHcxZHNkZxL9bhRtflN6K/fhE0is5pkEi0wGu+OSgtey2M5kC3j2VeS+4KOAR91dcfQ8i0D8shBCCk2IWH3h54Wk7Yt2iqnuh3ZuUT5UOiCVDc5WZ+RC2KkxbDrr1iXADkOTZoNSo9Ih6+x5HX2LoQiKrEiZPQt67EwO+GyM6CGf4m9EBFzOeAvm3NF2mI9dznhtgP+8FByjaR5aCjw2pbRGyDF+bJdxUBl/uoLwOoxjSCeo53PodBAu3um/m/FGhdI4hhuikkvHhMPXwYl5uwoOttDtk3l0EPWx8hEmSLfXn+raDIRtwFs5rl+0GvxtjGkSnvlUi9aW+A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(55236004)(2906002)(6512007)(53546011)(82960400001)(122000001)(5660300002)(38100700002)(38070700005)(508600001)(26005)(66476007)(31686004)(66446008)(91956017)(4326008)(66556008)(66946007)(76116006)(64756008)(36756003)(186003)(8676002)(316002)(71200400001)(6916009)(54906003)(86362001)(6506007)(8936002)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVdaMUNuaHVFNUxzRHpDRmdLMVEvZWhDTHhSZ0xxc01IOUpmN25RdE54cWJN?=
 =?utf-8?B?eGFaMTBlM0lWS3UzNzJLS0grZGFRYnNSVDZlOWxlQ2VYM1VPVFlac1c5NjZX?=
 =?utf-8?B?OFp6ZzhicXhHWFQyd1RPZ2hEbm9yakxvdUtFQkt5TUFRYUJScE5EdzdFT3Bz?=
 =?utf-8?B?cEhEalZva25FdG5OTHhEcUxFMFdDTFllKzhZMnEyU0ExbGtvaitucjVGaTFI?=
 =?utf-8?B?bFFYOXVkdlB2RW1jb2MzcTFDQjZYajlxbEhpQkxMUjVSM3I2MnM2a3N4Z3pX?=
 =?utf-8?B?K3IrZmxqdGZKdjU0eDhSdTBjejdBb2FWbmtoRCtMc1VIcEpDbG80T0hoTmdD?=
 =?utf-8?B?WVZJajNzdk1qdngzVUFCZm9meWdZSVlFM0krL0l0VzhWazhPK1Z3V2pYNERS?=
 =?utf-8?B?NmVtcEc1UjRrT2J4SE1jY2JSS3c2TGlITzFWYW40VlgwSXdnL3QzNVBmdEtL?=
 =?utf-8?B?SWlOKzU5Q3lHblpwT09ReVJkWXYvQ0FXMzRZMEdyNGhPYk40RGdTMkhYVDRN?=
 =?utf-8?B?ZFEzMVdadW9hYklsNVAwVTN0U2NsQVF3VzJLNzJaWTlTeUZLemxIWWw2enh5?=
 =?utf-8?B?cXVkYTNicGNpV3liRzZKZXl3TWJxQ1NIOW00bDh3bDlIMmhNNnhJME04NExk?=
 =?utf-8?B?bHNJK3VvWHlRSC9rc3lmTi84ZzNHek4zcVJvNXd5U3dFWVhheFlmRWZKNC9H?=
 =?utf-8?B?ajhoQ3plTitrNjhJYmxpYnZyQitBRVM4UU8xMitrWUVrVFpDSzhEZnVpVWQ0?=
 =?utf-8?B?T0Uzdk82UjFHVm4xcFBlMktXUk80L1g2akh1WXpSeHRwK0pEZ2hta2JNY01v?=
 =?utf-8?B?cXJ1bW5iTEQzb1lORVR0Q3BueXBzNHpaN0RndVRJbWFrNUZkS0FaT0YzNGJF?=
 =?utf-8?B?Z0JzaWxSN1VEdkVFdnh4eEQ3Y0hVM1pvYXFpTXJjYjhUdUpjRFZvR3NTc1JD?=
 =?utf-8?B?V3BUUmZHSkxYa2NHTUVVdklNZUV3R0NjT1RqZDhQdHlRU0F6RXV6d1k2YkVR?=
 =?utf-8?B?bHovOXBiSmZ6WEFCMVZSK1pVUHE0OElKUGpBZU1CR3QzOXdjRkVTTk9ZdnBW?=
 =?utf-8?B?L0R5cEdTU01BTXp0U0M3Yyt5WmRxMWFJNkhMNXpnUEFYUzEySUt2ZTVJSzJv?=
 =?utf-8?B?cUc3aVdUT1lPdkJieVgzdTJHRWk5YjNIazhDckRLTVVUQjVGS3R2dVRwTks3?=
 =?utf-8?B?ZEROc01LSjJUaTlIZG5CSDdRbzhhUDZ4OVRBM0Vtem1DVGhSMGxJNWd4WEpa?=
 =?utf-8?B?bTN1RHp4TXhEYk41R2Z5SHBreDJMcmJPWm1Rb1VTUHpxeno0TzliZWRRWWha?=
 =?utf-8?B?VHd3b0liSkx0U0ZFMExoYjdKMkRzK3h2VnZtbGNFdUp0cHkvU3d2b081SC9j?=
 =?utf-8?B?anZUdFFXZFhsdllBSzZWLzczLzY5VmxqaGZpUkpxRFJ6R2FwZTVON1VmYXMy?=
 =?utf-8?B?WmxFMWRmbHl4KzJRL2tkaVpSYWIvVkVuMjJBRXRJekovQU9POU8wTmZkWGtP?=
 =?utf-8?B?SHBiVFY4UklwSUZ1RjhIS1NTbERFZFJFY3pRMUJ6U0M5QXVxcldoci9KT0xW?=
 =?utf-8?B?L29EQlpLYmtDOVFwWFhoOGtYM1gvR093eVhVWmNTYW1zeGIvQW14QnZHSWZi?=
 =?utf-8?B?cVdMRFZObUJDMkVmaTNLeUdnNlNabXJkd3VxeVpHdFRFMEVHZ3RiVllKdmp3?=
 =?utf-8?B?NHA4dHR3cDRyMHNpSG5leU9lbk8zb0Q1VVVOQkc1YnZPbG5sRitySStrdXgw?=
 =?utf-8?B?cWNIVGdiVksvSUNWQzYrV3JPaVVIdXc3WGh0YlN5VG1Ld0poNkVHejZ5UHY5?=
 =?utf-8?B?cE9qaDNCb2tzZW5jRWRBOGRnVFN1dThQaFpaMU12THNCQ0o0T2tDQVFhbXpq?=
 =?utf-8?B?eHpnMmJzSGZqOHNPTUNXUWgzVHBIanhNSlpLUEpCWncyT1VIR1lxTGR1M3Jo?=
 =?utf-8?B?OWpBcEtvNkZLUXRVVUdCaitZcWhGaDd0blBuc0ptd2wvRXpWQVpyclRDWlFU?=
 =?utf-8?B?Yld3ZzZtZUcyMVRJSzFjSmNSTjVwU2RGWlUzaUhMNzYwV01QaWJJMTk0Z2xY?=
 =?utf-8?B?N1h0eGZrbnJCaitjQnRqNHd5ZjFUTU9naFFDY1g4TnRaN3FRMDRIU3FWT25T?=
 =?utf-8?B?N211bHhqRi9lM2JDSUFrK2lKcklUWHJHcWpjMndSRW9WOC8xTG9ZSmhXMUFF?=
 =?utf-8?B?VS9MOGtSWUdTeGdvVVF6QnJMNHIrRDNSS1hMUldmU3oxU3g4VEVqeUZMV0Na?=
 =?utf-8?B?RUdRTXhsYjNwZEFPclkvd3o4ZlR1R3N1QlJsVmdHYXRHWkRzVUt1aUxEM2p6?=
 =?utf-8?B?dlV5azcwdklkRk9La1JDMkFtUWg2ZTVNaEhoaG9NOGFXZGhESVZRQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D3E0AE67FFEAF42A8BC3664451BAB91@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c83b15-be5e-4d0c-6519-08da38bf8c54
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 11:14:17.0440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hk9uPuoMByrKNJQgh+W40OddFsEgtZsZeUb5jRyYv7Opl0PGrikPXZzqfRAnpTvINoRrXTOAv/GBNxSSyKMIsmFNU3B2tA4LtXLbyWoI5bM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6450

T24gMTgvMDUvMjAyMiAxMToyNywgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4gSGkgQW5kcmV3LA0K
Pg0KPj4gT24gMTcgTWF5IDIwMjIsIGF0IDIwOjQxLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4+DQo+PiBjL3MgY2ZjNTIxNDg0NDRmICgieGVuL2Rv
bWFpbjogUmVkdWNlIHRoZSBxdWFudGl0eSBvZiBpbml0aWFsaXNhdGlvbiBmb3INCj4+IHN5c3Rl
bSBkb21haW5zIikgcmVtb3ZlZCB0aGUgcGF0aCBpbiBkb21haW5fY3JlYXRlKCkgd2hpY2ggY2Fs
bGVkDQo+PiBzY2hlZF9pbml0X2RvbWFpbigpIHdpdGggQ1BVUE9PTElEX05PTkUgZm9yIHN5c3Rl
bSBkb21haW5zLg0KPj4NCj4+IEFyZ3VhYmx5LCB0aGF0IGNoYW5nZXNldCBzaG91bGQgaGF2ZSBj
bGVhbmVkIHVwIHRoaXMgcGF0aCB0b28uDQo+Pg0KPj4gSG93ZXZlciwgYy9zIDkyZWE5YzU0ZmM4
MSAoImFybS9kb20wbGVzczogYXNzaWduIGRvbTBsZXNzIGd1ZXN0cyB0byBjcHVwb29scyIpDQo+
PiBjaGFuZ2VkIGRvbWFpbl9jcmVhdGUoKSBmcm9tIHVzaW5nIGEgaGFyZGNvZGVkIHBvb2xpZCBv
ZiAwLCB0byB1c2luZyBhIHZhbHVlDQo+PiBwYXNzZWQgYnkgdGhlIHRvb2xzdGFjay4NCj4+DQo+
PiBXaGlsZSBDUFVQT09MSURfTk9ORSBpcyBhbiBpbnRlcm5hbCBjb25zdGFudCwgdXNlcnNwYWNl
IGNhbiBwYXNzIC0xIGZvciB0aGUNCj4+IGNwdXBvb2xfaWQgcGFyYW1ldGVyIGFuZCBhdHRlbXB0
IHRvIGNvbnN0cnVjdCBhIHJlYWwgZG9tYWluIHVzaW5nIGRlZmF1bHQgb3BzLA0KPj4gd2hpY2gg
YXQgYSBtaW5pbXVtIHdpbGwgZmFpbCB0aGUgYXNzZXJ0aW9uIGluIGRvbV9zY2hlZHVsZXIoKS4N
Cj4+DQo+PiBGaXhlczogOTJlYTljNTRmYzgxICgiYXJtL2RvbTBsZXNzOiBhc3NpZ24gZG9tMGxl
c3MgZ3Vlc3RzIHRvIGNwdXBvb2xzIikNCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFRoYW5rcyBmb3IgdGhpcyBmaXgsIHdpdGgg
dGhlIGludHJvZHVjdGlvbiBvZiA5MmVhOWM1NGZjODEgKCJhcm0vZG9tMGxlc3M6IGFzc2lnbiBk
b20wbGVzcyBndWVzdHMgdG8gY3B1cG9vbHPigJ0pDQo+IHdl4oCZdmUgY2hlY2tlZCBhbGwgdGhl
IHBhdGggcGFzc2luZyBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4sIGFuZCBhdCB0aGF0
IHRpbWUgaXQgc2VlbXMgdG8gYmUgdGhhdA0KPiB0aGUgbmV3IGNwdXBvb2xfaWQgbWVtYmVyIHdv
dWxkIGhhdmUgYmVlbiBhbHdheXMgemVybyB3aGVuIGNyZWF0ZWQgZnJvbSB0aGUgdG9vbCBzdGFj
aywgYW0gSSB3cm9uZz8NCg0KSHlwZXJjYWxscyBhcmUgYW4gZW50aXJlbHkgcHVibGljIEFQSS9B
QkkuDQoNCkxvb2tpbmcgdGhyb3VnaCB4ZW4uZ2l0IGdldHMgeW91IHRoZSBjb21tb24gdXNlcnMs
IGJ1dCBpdCBtb3N0DQpkZWZpbml0ZWx5IGRvZXNuJ3QgZ2V0IHlvdSBhbGwgdXNlcnMgb2YgdGhl
IGludGVyZmFjZS4NCg0KVGhpcyBoeXBlcmNhbGwgc3BlY2lmaWNhbGx5IGdldHMgZnV6emVkICh0
aGVyZSdzIGEgS0ZYIFBvQyBzb21ld2hlcmUpLA0KYnV0IGl0J3MgYSBidWcgZm9yIGFueSBoeXBl
cmNhbGwgdG8gYmUgYWJsZSB0byBoaXQgYW4gYXNzZXJ0aW9uL2NyYXNoL2V0Yy4NCg0KPiBJ4oCZ
bSBhc2tpbmcgc28gdGhhdCBJIHdpbGwga2VlcCBpbiBtaW5kIGZvciB0aGUgZnV0dXJlLg0KPg0K
PiBIb3dldmVyIHdpdGggeW91ciBzZWNvbmQgcGF0Y2ggb2YgdGhpcyBzZXJpZSwgdGhlIHRvb2wg
c3RhY2sgaXMgYWJsZSB0byB3cml0ZSBpdCwgc28gSSBndWVzcyB0aGlzIGZpeCBub3cgaXMgbWFu
ZGF0b3J5Lg0KPg0KPiBJ4oCZdmUgdGVzdGVkIHlvdXIgcGF0Y2gsIGVuYWJsaW5nIGJvb3QgdGlt
ZSBjcHVwb29scywgb24gYW4gYXJtIG1hY2hpbmUgYW5kIGJvb3RpbmcgWGVuK0RvbTAgYW5kIGFu
b3RoZXIgRG9tVQ0KPiBieSBkb20wbGVzcyBmZWF0dXJlLCBhbmQgYWxsIHdvcmtzLg0KPg0KPiBS
ZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiBUZXN0
ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KVGhhbmtzLg0K
DQp+QW5kcmV3DQo=

