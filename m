Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98D8B09A35
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 05:38:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047841.1418193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucbuj-0003IN-5U; Fri, 18 Jul 2025 03:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047841.1418193; Fri, 18 Jul 2025 03:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucbuj-0003Fo-1O; Fri, 18 Jul 2025 03:37:37 +0000
Received: by outflank-mailman (input) for mailman id 1047841;
 Fri, 18 Jul 2025 03:37:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VuZO=Z7=boeing.com=Anderson.Choi@srs-se1.protection.inumbo.net>)
 id 1ucbui-0003Fi-Bz
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 03:37:36 +0000
Received: from clt-mbsout-01.mbs.boeing.net (clt-mbsout-01.mbs.boeing.net
 [130.76.144.162]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8871f7c6-6388-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 05:37:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 56I3bRx1031969; Thu, 17 Jul 2025 23:37:29 -0400
Received: from XCH16-09-11.nos.boeing.com (xch16-09-11.nos.boeing.com
 [144.115.66.160])
 by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 56I3bIcs031924
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 17 Jul 2025 23:37:18 -0400
Received: from XCH16-05-07.nos.boeing.com (144.115.66.91) by
 XCH16-09-11.nos.boeing.com (144.115.66.160) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Thu, 17 Jul 2025 20:37:17 -0700
Received: from XCH19-EDGE-C02.nos.boeing.com (130.76.144.198) by
 XCH16-05-07.nos.boeing.com (144.115.66.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57 via Frontend Transport; Thu, 17 Jul 2025 20:37:17 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.144)
 by boeing.com (130.76.144.198) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Thu, 17 Jul
 2025 20:37:15 -0700
Received: from SA1P110MB2155.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:199::17)
 by BN0P110MB1500.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:186::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.40; Fri, 18 Jul
 2025 03:37:15 +0000
Received: from SA1P110MB2155.NAMP110.PROD.OUTLOOK.COM
 ([fe80::aaa7:3b2a:5a62:ceef]) by SA1P110MB2155.NAMP110.PROD.OUTLOOK.COM
 ([fe80::aaa7:3b2a:5a62:ceef%3]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 03:37:14 +0000
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
X-Inumbo-ID: 8871f7c6-6388-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1752809849;
	bh=Oi99fy7O+Svk+CMk+PL/hw4wX/VA9GFKoYPyhUHJov4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KDTHvTf7AvHaHG0aHVT+hG3+6iY9giSNI5EsAWldowUeIrISYw4F0EwD0Xt4v8Na4
	 fHsSEwdNXEyq6U0pb3OCFf0gcvzeFP5LiXfOKFAWGGAlGM+OWGQYDCnDMcOZk8cxYD
	 /p8OPvW/EYT9I/tx0/eOir3q4Mlj9uOaK6LFrHFDHrG8cBpa7Zv9jHX7oreey6v5x0
	 lM3vL1txzj9xGzeLelbPwUhoyClIepjtawa9x1Z1kWcT9/OsMRw1HT4eLLKaqnSW0O
	 aHwVlN4vQtWOHixXnXlIpz/mWW3FaImQabjpTU2BYGgcKKzXLU5kXwP4bSIw0U6d1m
	 RyHIZ9WQDmPQA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=moCBGeA2N74VUw0C5nSSRPx1We8gLQal8bcjM/AqmG9hhbb2dajSLkobPc3SbDODUe/ewZfaIKZ9TwWOUP8ep1xjAChsP8hmyScraG6A+VnHcz9rgn9pP70UHuuA8cuwMjnSYG5pUuDVlkI0SzfS0OiPS+MA9n1HOndio3Xlsysyb2lCRW7BN20z1XmgqqY0B9LNSjaEGAGEIiKTVGR07+24EJh+PJOTLQUrVcKh3FgBEJYXK411yXd0u4TFtqLFH+Ktuf2WIi3C7D91YeFIneTUTvIP6m6p1okP9qcTsXdhF7PjJGy/k84Eq6BIKZTIJM/4jVkJnx/5OFbkY9L1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oi99fy7O+Svk+CMk+PL/hw4wX/VA9GFKoYPyhUHJov4=;
 b=aFTE1Ur66w6dHO26Ps3Sysd9PA3bBBwMPvhpw5jVIQ2uv5XW/gkQ9TumTB1jtR01ufYfkEcwZUQCACeDJRtLHLx8Hv/sAaNAZNYRdR6zdfx43Zf6E3lv4CmYnIMTXhJtoLF5c3yDScXVqY7Inn3glgSCYWK05cse4vm/eTlhdR4zmluKSqzq9px7rCX2bDwrNRxQuSNPpN4vVpaiLwfXbI6R1UnXLQZFBh/08VMoDippRNc9T2Iw/TFYw8Qe0MRruhF9+WhVukJONKZOUynGUSB/93LvLL2HMbrmJvVgCFm3NzeTOV4U2UZNnwFx+1FxCwQjfIeEay7gYhf4QXOVfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oi99fy7O+Svk+CMk+PL/hw4wX/VA9GFKoYPyhUHJov4=;
 b=Z1DTMNoOb/dyrm4TyBd8ZhHNJB71sYzLiHj83VQEVP9pEJsZbp2GWzUoSr2prUZDA5D3Zker6iIsHsdRnyMyreBbMrW9qZiYvUSs8opVWt1Bi9JAeoIdUrjIYB3nuCTM2i7ZtPXPx7lKCWAlq3NU4DSJ0beMHtY8MQlvpd5c7LA=
From: "Choi, Anderson" <Anderson.Choi@boeing.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Nathan Studer
	<Nathan.Studer@dornerworks.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
        "Whitehead (US),
 Joshua C" <joshua.c.whitehead@boeing.com>,
        Stewart Hildebrand
	<stewart@stew.dk>,
        Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>,
        George Dunlap <gwd@xenproject.org>,
        xen-devel
	<xen-devel@dornerworks.com>
Subject: RE: [EXTERNAL] Re: [XEN PATCH v2] xen/arinc653: fix delay in the
 start of major frame
Thread-Topic: [EXTERNAL] Re: [XEN PATCH v2] xen/arinc653: fix delay in the
 start of major frame
Thread-Index: AQHb9z26goGsZ4LY30285h3BvJPydLQ3FIeggAAQ9ACAABAAAIAAA0Aw
Date: Fri, 18 Jul 2025 03:37:14 +0000
Message-ID: <SA1P110MB21552D61984ED9BD66165A829050A@SA1P110MB2155.NAMP110.PROD.OUTLOOK.COM>
References: <c3234cf8d5fb5da84e10ebdb95250c594f644198.1752197811.git.anderson.choi@boeing.com>
 <2c4837b7-404f-47a5-8c6c-f3a707bb544e@amd.com>
 <SA1P110MB1629479AEC6F1B8583D7725EF451A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB214810B8239A418B1AF540E49050A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB1629F354A80CE6536718FAB3F450A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
 <46b3cf5e-758d-4fb7-8d19-791d77040d15@amd.com>
In-Reply-To: <46b3cf5e-758d-4fb7-8d19-791d77040d15@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB2155:EE_|BN0P110MB1500:EE_
x-ms-office365-filtering-correlation-id: c5e2a90b-fa17-4384-85eb-08ddc5ac6353
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZkljYkdjaXA0TnJuWXpiWitVVUNodVV5blNqKytKQVQzVXFvdG13WEVDdHQw?=
 =?utf-8?B?SUVTYlJJSDlLekpoa1FySnFaQlpJWkVHZXdtNTk1VXFnaS9YdnBKK0tha045?=
 =?utf-8?B?aUYvaTdxZU9QQTc2MGNnTVJmWTFHcGRsUW5xb3JYbnJ6UXorMjJ0NXBHNGpn?=
 =?utf-8?B?aDV2VG1wSEo4eFMzaGVkdlpQVzE1ajcwUzJNUDhHekxBNExHRVhqS0lKb1Zh?=
 =?utf-8?B?dDJvMFFuV1Z0YWpDMzZpVzBGOFFFelNCNUNxbUFsbURLRzNBN29YYWdsMmpO?=
 =?utf-8?B?c29XZ1l6bmFsQlBHa1R6WnE4TWx6LzVCR0ZXQ2VhRUF5Zlp0YU5IanZ3Z0ZX?=
 =?utf-8?B?WTNDeFJzTUl5KzNRaU5LNC9IZTR3bzF3L0gwZXBIRngyaWg2MDZsU21YdTZY?=
 =?utf-8?B?ZndFdlFtWU9veUFmb3I3SzNZbGpQYzFBbXkyVlduZ1Zkd1VCMTFXZFdmcDBx?=
 =?utf-8?B?T0IzZnJLT0dyWkRGaXE0RG14QUQ4bi9zaGE0eC8yRDNrMEhja0RKNHovNktr?=
 =?utf-8?B?OG9OODhHaHQ1WXRPUytGd3MwTVI0N1VtbkVqRVppZyszZDVUSzM5N3ZXR295?=
 =?utf-8?B?QmF6ekpXdi9sU1I2ZERjbGtQM2NSUjg2ODZXSTRWMldNSE1DQyt1bndEMldy?=
 =?utf-8?B?RUdIdmF6N2ozQkczWXZXYnRrOXU4REhibXMza28zYjhGN2VlZ25iZEhlZTQ3?=
 =?utf-8?B?T1BFNk1xRDBrZEU5YXNoZjBjYW5tVWtkQmV0dWQ5cUZyai9TVjduSFhWQnNR?=
 =?utf-8?B?bWUxNk1WVVV0b0c0S1FRMTY2djArUDdwNUZiVnRpL1JwL1h6QUFkZkNUNkVx?=
 =?utf-8?B?MThwdlZYUGk2UHNkd0RKV25heG5zWm0vcVlJcGVnV1hrVWJNK2RoS09ITE05?=
 =?utf-8?B?anFXR1ZPTDI3OVgrenVoNmM1MXhwYWV4THQwcXNzTzNmYnhXOHVWZDh4aTFj?=
 =?utf-8?B?TkZLQzU2ZEZ3N1VpL2p2eDJMZUVOejllUVo0RWlIQmRGWHlsaDEzOHpKRU9k?=
 =?utf-8?B?STRZeWcwWXphM3orU1J0T3l3Q2FNWUJKOHpDNXpjU25sdE5Tc3R6RXlreWNm?=
 =?utf-8?B?aTBwejJENlJSaGRUeE5haVVtNlhtQ0RWdHIxcXRTZjdQdWxudnFDcm9ETzVN?=
 =?utf-8?B?MWJTd3UzWDQxVEN1V0kzVDJaOGZMSHY4anBoQ3BhR3hEdkQzRnN1UGIwclcy?=
 =?utf-8?B?T0xmUGpMeUt2dWMxN0g3MXJtMFo5R2RIaU9SZktKY3RVUXREUjNIWmhVWTdh?=
 =?utf-8?B?RjJGODVNdEpLL0tTb0w4RWpTdjFCNHpMU0x3bUhuaFlnYnJERnYrWWY4dWEw?=
 =?utf-8?B?UVVZRWdjZExFRHFVaXZ6UzdWWFJOVWYzVFRydXJyd28wSHlBdUNVeC9vWEho?=
 =?utf-8?B?Z1pDYW1HNzQ4NVJUOStiazh3WG9rRW9udFpEeTRac0gxWC9DZC9rUExyeWl1?=
 =?utf-8?B?cVhjZ25Ta0lQdm5oR240TnhyNG0rdE1yeUVuTDQ1M2tLWHd4ZENuUldaMklw?=
 =?utf-8?B?MWMyMmJNeFhZVXRkSS9DcUVOTEF1c1I5SktUWnR5bG5hTHF0d2JVOWZ3OTZS?=
 =?utf-8?B?VUlUbDFUazEva3RUc0xEM3JDWnlKTWVXUkhpSzFBdUZJUGZuVnpuYy9TdUtz?=
 =?utf-8?B?allVam9VbENpaFozR1JQcnJxeE9ESXNBQ1BJaDAvUDY5YlQvUkN2MGxLNW5X?=
 =?utf-8?B?aDRxK1h2WmExM2toZEVjZHE4UUhUbW9uWTJubzkvd1BmdmsxeFQvWm9FaWps?=
 =?utf-8?B?WWNrWjMwQlFBdFZ1b3h1K0tLckNMdXZWUHZ3cUJ5RnVPSW1uQS9yREpiMHIv?=
 =?utf-8?B?V2ZCRG5UeUNoMGNqUlR2NkFyMlN5TmdTRVFrQzZFTitGZXYrNWptYzNkOUdG?=
 =?utf-8?B?VU82N0ZlM0J3RGh1bTRJVEhOWkVSUVhKMUo4RWlNWWtmbXZML3lKOUYrb0Jn?=
 =?utf-8?B?bGNlK0hORVVuSEVCaUZ6KzlscG5OL255enh6ZmhHNjJoSG1TbldaY0xTUVRj?=
 =?utf-8?Q?BM3+wrJmMYtYoh76FIOgBpb8nfYSnU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB2155.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1IxSEVqa0JRT213ZU1jZlZTRCs0Z0hBUFY5REU3bU1MSGRnaFQ2SUdtZHpm?=
 =?utf-8?B?OVZFR2FYaHFpYklPWmpKNmpDVUlCTk1XaFZ1RmVwakpPUThxSi9TNkQzWWZx?=
 =?utf-8?B?YW56cmoranU0L01QYzVySVJDaHJkMHlKMisrSUx4ZFZKUHJmZUxuSWtiV0JS?=
 =?utf-8?B?eUIrZDNGL3d3eWdwLzNxbkRRQjdYMis2Sy83Z2hjMXoyR01QbFl5KytQU0dW?=
 =?utf-8?B?bWdpbDZHc3Q4OU9BbG5RRSs3aWpQZnhrVnFnR0d3ZjZMdEZDTXdBNTBraGRl?=
 =?utf-8?B?aTVYb2xneEkxOWtEYmdKYUxLd09iUWNicHY0UDlnWncxazd6VmNMbjlrck5j?=
 =?utf-8?B?V09rVVNucmlGaXZDVWwwbm5RZmFPMjdyZEM0QnFid0JXZFY0eUcvdU5wTlM0?=
 =?utf-8?B?OHRzYUgxekFERS9CL0ZycHI2R1h5ODl0U2VjKzdzSytyKzJZSEhCaXJkWnQ0?=
 =?utf-8?B?U2N5R2ExaG4yUENmQVVRbmg3cDR0ZVpiM1dIWjN4SGNyUmlmcnF5bURxbFFW?=
 =?utf-8?B?TW5melUvckhVZlJJWTlycWdVYUJGUWpVdkpjUytlM3FUcmtwUVd5aXQzZTJG?=
 =?utf-8?B?QW0vcXYvekxUbEE5c3ZGMUhnRGU3d1BwNmVrKzl4eTgvd09xRXpnNmpTY0k0?=
 =?utf-8?B?Rks4dEpaenRvdFUxSStGNVBiNzFsM3hPNVJYQkFDUUptWmRvRmc3YWZHUWd3?=
 =?utf-8?B?RVRidUNZYkMwcm83a3p3amFGdXA4aGtxcTZyZ0hySTRYVHNLaVJTMVlqMjU4?=
 =?utf-8?B?L1IrYUxKZWZqZlpRdUVZTHZjYnpaZU9GMk16eVNyb29tc1B3QnVIWW1Jekkz?=
 =?utf-8?B?NldhVGxzK0thWVZXM0hqU3hGYmxwZzFNSHdudlFIdy9VTVhXZmhVblJ5dHY2?=
 =?utf-8?B?RnFDbU5BRCtvZk9vbFczV1NodE0rc1NtenFhY3dYeWZSUEI3L3d1dFVwVk1U?=
 =?utf-8?B?TFlneFQrUS81UnNjSy9RRWh3L2VlanFwVnpnZmErRHhGL2RxcE15c2JTWkF5?=
 =?utf-8?B?SHJZYStXTE5keFdENDdYSlQ2NGJVYzBmZWtLM1NyOWpsMmRUdktIV0ROK25C?=
 =?utf-8?B?QUcrWFFBa0Q3WmRyV0F1dm9TYjRhQ0ViRkM0S09KY0laRVRzVDVtc1JaaG9R?=
 =?utf-8?B?Mm1mM0lnSlFNZkZUaERRS09TSk0rVzh1ZER5TEgvejFOOGVuNkJCUzdpcDdj?=
 =?utf-8?B?Tm1KMmxNUVR3V3JDTEVid25aTmFIOEladW50SDZDMG5aNE1IamoxTitEUjE3?=
 =?utf-8?B?N0xEd1RUWThWcDlGM3ZsbEpUUDZwaTYzeHhydXBYRjg3dm5rVmpBTmdnNjBh?=
 =?utf-8?B?SVF2d3FXeVVqZVB6LzdvM1UzMjQ3Nzl1enJJallqcW1WaW1VU0d6ZFM4c0tQ?=
 =?utf-8?B?VC84ZmFJaWVLdzlUM3hPbzNpVUJjRXBwQlg5MklzeklONzQ3N1lyMEpvYXpP?=
 =?utf-8?B?dm12NEFLU0xXVzRCZjJmLzBIRkN2OUlKbVg4RncySHJHdFgyV3U1SkppaHlB?=
 =?utf-8?B?d280eXg2TDdXUnZZUFFsTldFMS9ERFA4VWF4Y2NKQVJ4TCtrOGNqTEZic1hl?=
 =?utf-8?B?ajVaYVoyVlNOWkVmZG9uamZUazREYjluV1N0czU5UnluWUNpKzBxWlBhQmdt?=
 =?utf-8?B?VVJBU2xaK0llQ2RKUEd5aERvSDc5SlZ1eHlJb0lid2hBMzJla2pVTVBneERm?=
 =?utf-8?B?bTYrQnpDUDJuSGxMejNPL3ptREVjS2REN0ZhcmFldS81QmRLd0xac1VUZVZp?=
 =?utf-8?B?SmNNa1R2Z2g4K3VXd2lrN2FLUDBzYkFyc0FMSUlscnBaKy9jYmczM2JQVExu?=
 =?utf-8?B?UXpmRmRPQlhVR1dCckxhZkFIQ0hka0tNeGJpYWYrNW5ub3grVDFNKzB3RTlJ?=
 =?utf-8?B?VHYxVVR5c2V4TUxMeDRoUkpma2JqL1BkcUI1TksxVHJGSVdOZjVEMFpHRXJF?=
 =?utf-8?B?N2s1MlA1TWpOVzI0eUtURjZhYS9TeTFpQzR1ZDNkYWVVanBCdXFmcDhXcGRz?=
 =?utf-8?B?dkpoTW5vS0VrSCtqcVp4QTJGYkVucUR6bmEyam5udks1L2Y5TlZhV1hlZDIr?=
 =?utf-8?Q?szTwBq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB2155.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e2a90b-fa17-4384-85eb-08ddc5ac6353
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 03:37:14.7635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1500
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00

U3Rld2FydCwNCg0KPj4+IFN0ZXdhcnQsDQo+Pj4gDQo+Pj4gSSBhcHByZWNpYXRlIHlvdXIgc3Vn
Z2VzdGlvbiB0byBlbGltaW5hdGUgdGhlIHdoaWxlIGxvb3AuDQo+Pj4gV2hhdCBhYm91dCBpbml0
aWFsaXppbmcgbWFqb3JfZnJhbWUgYW5kIHNjaGVkdWxlWzBdLnJ1bnRpbWUgdG8NCj4+PiBERUZB
VUxUX1RJTUVTTElDRSBhdCBhNjUzc2NoZWRfaW5pdCgpIGFuZCB1c2UgdGhlbSB1bnRpbCB0aGUg
cmVhbA0KPj4+IHBhcmFtZXRlcnMgYXJlIHNldCBhcyBiZWxvdyB0byBlbGltaW5hdGUgdGhlIGlm
IGJyYW5jaD8NCj4+IA0KPj4gSXQgd291bGQgbWFrZSB0aGUgc2NoZWR1bGluZyBjb2RlIGNsZWFu
ZXIsIGJ1dCBzaW5jZSB5b3UgYXNrZWQgU3RldyBJJ2xsDQo+IGRlZmVyIHRvIGhpbS4NCj4gDQo+
IEl0IGZlZWxzIG9kZCB0byBpbmRleCBzY2hlZHVsZVswXSB3aGVuIG51bV9zY2hlZHVsZV9lbnRy
aWVzIG1heSBiZSB6ZXJvLi4uDQo+IEJ1dCBzaW5jZSBpdCdzIGEgZml4ZWQgc2l6ZSBhcnJheSBh
bmQgZWxlbWVudCAwIGlzIGd1YXJhbnRlZWQgdG8gZXhpc3QgSSBkb24ndA0KPiBoYXZlIGEgc3Ry
b25nIHByZWZlcmVuY2UuDQo+IA0KDQpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suDQoNCklmIHlv
dSBkb24ndCBoYXZlIGEgc3Ryb25nIHByZWZlcmVuY2UsIGxldCBtZSB3cml0ZSBhIHYzIHBhdGNo
IHdpdGggdGhlIGZvbGxvd2luZyBjaGFuZ2UuDQoNCiAgICAvKiBTd2l0Y2ggdG8gbmV4dCBtYWpv
ciBmcmFtZSBkaXJlY3RseSBlbGltaW5hdGluZyB0aGUgdXNlIG9mIGxvb3AgKi8NCiAgICBpZiAo
IG5vdyA+PSBzY2hlZF9wcml2LT5uZXh0X21ham9yX2ZyYW1lICkNCiAgICB7DQogICAgICAgIHNf
dGltZV90IG1ham9yX2ZyYW1lID0gc2NoZWRfcHJpdi0+bWFqb3JfZnJhbWU7DQogICAgICAgIHNf
dGltZV90IHJlbWFpbmRlciA9IChub3cgLSBzY2hlZF9wcml2LT5uZXh0X21ham9yX2ZyYW1lKSAl
IG1ham9yX2ZyYW1lOw0KDQogICAgICAgIC8qIG1ham9yX2ZyYW1lIGFuZCBzY2hlZHVsZVswXS5y
dW50aW1lIGNvbnRhaW4gREVGQVVMVF9USU1FU0xJQ0UNCiAgICAgICAgICogaWYgbnVtX3NjaGVk
dWxlX2VudHJpZXMgaXMgemVyby4NCiAgICAgICAgICovDQogICAgICAgIHNjaGVkX3ByaXYtPnNj
aGVkX2luZGV4ID0gMDsNCiAgICAgICAgc2NoZWRfcHJpdi0+bmV4dF9tYWpvcl9mcmFtZSA9IG5v
dyAtIHJlbWFpbmRlciArIG1ham9yX2ZyYW1lOw0KICAgICAgICBzY2hlZF9wcml2LT5uZXh0X3N3
aXRjaF90aW1lID0gbm93IC0gcmVtYWluZGVyICsNCiAgICAgICAgICAgIHNjaGVkX3ByaXYtPnNj
aGVkdWxlWzBdLnJ1bnRpbWU7DQogICAgfQ0KDQogICAgLyogU3dpdGNoIG1pbm9yIGZyYW1lICov
DQogICAgd2hpbGUgKCAobm93ID49IHNjaGVkX3ByaXYtPm5leHRfc3dpdGNoX3RpbWUpICYmDQoN
CkknbGwgYWxzbyBpbmNsdWRlIHRoZSAiRml4ZXMiIHRhZyB5b3UgbWVudGlvbmVkIGluIHRoZSBw
cmV2aW91cyBjb21tZW50Lg0KDQpGaXhlczogMjI3ODdmMmUxMDdjICgiQVJJTkMgNjUzIHNjaGVk
dWxlciIpDQoNClRoYW5rcywNCkFuZGVyc29uDQoNCg0K

