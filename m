Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D4B5571F1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 06:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354431.581515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ejl-0006bq-BN; Thu, 23 Jun 2022 04:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354431.581515; Thu, 23 Jun 2022 04:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Ejl-0006Z3-7o; Thu, 23 Jun 2022 04:46:37 +0000
Received: by outflank-mailman (input) for mailman id 354431;
 Thu, 23 Jun 2022 04:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJ5T=W6=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o4Eji-0006Yx-SO
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 04:46:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140075.outbound.protection.outlook.com [40.107.14.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73add62a-f2af-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 06:46:32 +0200 (CEST)
Received: from DB7PR03CA0081.eurprd03.prod.outlook.com (2603:10a6:10:72::22)
 by AM9PR08MB7031.eurprd08.prod.outlook.com (2603:10a6:20b:41d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 04:46:29 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::b7) by DB7PR03CA0081.outlook.office365.com
 (2603:10a6:10:72::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22 via Frontend
 Transport; Thu, 23 Jun 2022 04:46:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Thu, 23 Jun 2022 04:46:29 +0000
Received: ("Tessian outbound 01afcf8ccfad:v120");
 Thu, 23 Jun 2022 04:46:29 +0000
Received: from 0ba270c09ef5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4A0B6F9-DF25-42C5-9669-F4E3EFFCE32A.1; 
 Thu, 23 Jun 2022 04:46:22 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ba270c09ef5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Jun 2022 04:46:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB6503.eurprd08.prod.outlook.com (2603:10a6:20b:33b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Thu, 23 Jun
 2022 04:46:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 04:46:21 +0000
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
X-Inumbo-ID: 73add62a-f2af-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FQbrfXxLKMY1JlIWnjfifoERKeQqDeQt7I/D76sLGBORqgh3VQYD5Fk5RXxnGEtW2GNk4MR8r6OqwYj96QB2cM0vEudR5lGdKIsZqHSguglj7a2IACslzDHkygh/QfXY5C5tlqlS2WxGgST+6Mf0KzdOZjsIRAg3lZUajlo4vBeJOL78K5n/+ZarG3OgsDIdj75e4X+/PKiSb6kJ7mavEXfAS5ezLftlNxJZL2YmGpYbH+L5/VQA6iRr+NXuZ8NwvPqOJmNrhuya3vfdQnciKiZDsuJnbBZK/w0xeU4GgtfKOYLaZtMTSIonztsNoAIt2Kte9/wt8MojazqpxgVguw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wg+hZlA9SK2d+kWlsuSJo2tzr1ePQelzfvwrOm8G0Mk=;
 b=RrpMfX8RITGKyA5vL1/J2WzeBCD+qIGnS/qDqZk7ASfcL4oOYli71eLxyq9BPjLOlgZuk/X3tKX6FdoM3LAwfx2llyUY0TRaNhACktPlWbFU90yKM/ewLAl+786RV1vnqQkC5Y9JkOedWTFJJAFxFZZg5I4+pD0Bv1vhh2tnrwYgWpNRJdwYew7RLH2G16FHoDBwoalECOkLF+xAuyRDh6aYEr7wBnzPYwza2pVt/u7VIRJxSXaZUM/KDoXlFA0zkGW1YjIBpjoj/9UxcV22Tyxu5r8W0b2cv/8bjvVKfhbFFSaz/VQWyBVyVkw39t91L5qSZZqcdOgoWYWZ43GKJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wg+hZlA9SK2d+kWlsuSJo2tzr1ePQelzfvwrOm8G0Mk=;
 b=4ApxGQ3+vDrqs4xeQ2OfUWsbXdsD5/Vii8KWLASVYsJBlyzuFVTt9DnW3RzfJpdJZyVkj8WTVF1zyOVu/7Xo3vPC1eYBRXFSDFC/CsC9mCkwqqq0k1UEi2Vfd5jWXwtFcXCDBW+L9N080GaE4HfE2ddZDpy0bcEdU7KQfutMgcg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=encETdpdfYoUFZUpcjNQOqEx6Z6e3W3lp9I8XT0aZeXIpqRxXfEWaF4Fr5gM6sb5QP1aBf6XT+q+VG5bzB94EFgTm37XjYBO3wwUTkqaiyasyMtkne8QUw1RR6Nytw7J9V3Hq4dZB7XmWoLLIwZZ/wGchE3mFMUkuObuVx/RTkPHIvjQItQFYtzgEE1CUKM06gC81KZY/SfBGpc99mIbemGiplVDnN0YkDnrGL/0qh9vWshBAk3t+szxk422PdxCvGxNdDGfHe8405Vj7WW774HtW/JB7Hx+D0z+jtVE6B25dWuDVp0KPEg+ExngFg0e4Z0AOBfGvs6vgFxfs1DD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wg+hZlA9SK2d+kWlsuSJo2tzr1ePQelzfvwrOm8G0Mk=;
 b=PTphAjvVbOt5zutmdkXiUn1x8VRepa+nQEecZqvt44FOkkBhl03G8+bRCw2zceQNMCkA/LxqcQtKgMe48YE32u2k9gSLzF6KBn7bskgfSNNJfeVGaI1I9Ch+uuo4+0PIGg8gYdpIs+NCfcCZqK7TTN40TaMpN1KIUCMTxKNksR8j2lr2yHNPpK4k4Xm3aWU4LAGiVrtDByDK4YNB2+4Vny0tlwBbU8hrBJFOClJCIVRwu7b1mZDwkqQkWENqKBPdv3/FpeMNhbpdpikeVctPrvIkrrb8sD/tySoYmsvs2i/ulCxvhom3q1yjvTi9WvFzT++vftfA/CPwHcNVphoMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wg+hZlA9SK2d+kWlsuSJo2tzr1ePQelzfvwrOm8G0Mk=;
 b=4ApxGQ3+vDrqs4xeQ2OfUWsbXdsD5/Vii8KWLASVYsJBlyzuFVTt9DnW3RzfJpdJZyVkj8WTVF1zyOVu/7Xo3vPC1eYBRXFSDFC/CsC9mCkwqqq0k1UEi2Vfd5jWXwtFcXCDBW+L9N080GaE4HfE2ddZDpy0bcEdU7KQfutMgcg=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Community Manager <community.manager@xenproject.org>, Wei Liu
	<wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Thread-Topic: [PATCH v6 3/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests
 using legacy SSBD
Thread-Index: AQHYagNC0CXNzdsfvEia3fuvabBVia1TGtkAgAg6Q4CAAU4UUA==
Date: Thu, 23 Jun 2022 04:46:21 +0000
Message-ID:
 <AS8PR08MB799160D2117E6B6E743F252392B59@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220517153127.40276-1-roger.pau@citrix.com>
 <20220517153127.40276-4-roger.pau@citrix.com>
 <AS8PR08MB799195FC7D9949031F33802892AF9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <5a1eada8-90b6-f998-cb8d-6b0d1b781590@suse.com>
In-Reply-To: <5a1eada8-90b6-f998-cb8d-6b0d1b781590@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9A0278D423FD6B44BB89311EAE58F8EB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d872314c-6560-4085-6485-08da54d35680
x-ms-traffictypediagnostic:
	AS8PR08MB6503:EE_|DBAEUR03FT057:EE_|AM9PR08MB7031:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB70313BAFA17FC45A6E19050692B59@AM9PR08MB7031.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OTqmtrichA+HgdojlQQovJzbshe9XDm82lfQVHx28XrP173cV1bEWB31CK5jPEK9o5KZDVWFssmxW/Qekujf0N3HLNewhLwY44qA/G3ZFKLXf5nDMxIyIZ4BQz3AnfY3kxWZav0WEQveh6WdtJPNNP9kVXTDhAq7n7gJ556ZKEbAsA/I260EM4jBpPI48GsbI18pdIla0H0aqd0BldmJb+lFGH8oswI9DO/fuZb+G7iTLOjiBPVcjZqrQOmpZb94WeoGVlYEK7rmSHmltZtaOJn1d4ZVoaIqlQEHjYSrUd2aKWAkhfQAB+cAz3OCpuKUCtiqUMqHmh5CHJHxZg9RIYqfKnMyKLqn6ZHuoeO3++WdW9wGC2EVD8xHEgjGM9bjt7VLaJeOwltSupAsTSo3ymndErLoYGWxrG2oQfEXi2naKke86P/q7uxPJsoejf8Rktem43mHCCAZupqdBJuYFT7R34+G7mc1dBOhYuj/8YmFAAYtkgYoqFYE3ye1kuzl2e8EHu4gkM/WkNcIoYyHv+qOsxc3oE3WyIKzAA5Pbtu+ZEC9ISitukdOzDKlOmbi+TUd53VuSdbHJSIZjVtQKiCQY709QHAy3u32iR5sL3jvUQp/9tT4OU+rTbVfBE6Yx5gPcn9bvJ0pYBGsb440rruZNZ2PuVx+VlPGI1e7ZX8LXU3JCK+4g3RGUmFyetAKVXytuZCh6VBz4ymTmOd1JTTqNr74GlD1bICJWdvtJbO95RRYDmCsAuc0VRur/3PJaZN2LdZU0fkViKpk5f9ekA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(52536014)(76116006)(5660300002)(66446008)(8676002)(66946007)(4326008)(66556008)(64756008)(478600001)(86362001)(38070700005)(66476007)(38100700002)(83380400001)(41300700001)(6506007)(8936002)(122000001)(7696005)(186003)(110136005)(53546011)(54906003)(33656002)(55016003)(9686003)(316002)(2906002)(26005)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6503
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1e43acdb-e41f-4ebc-51a5-08da54d351c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nInjFrgRUh5KTijoGFFuiONBI6jjn2Bfr4Qe/fgOHCziCyaSlSID+xzd0FWpn8J/Vpxt2WKDRE4YjzQbn92fj49T2X3MepikhIN9iBrXAZCTLamOY8w6f3Lypg1zLZNFFB9V8madJfSVV0dv4SUq1RcHtDrSF/40xcJEV8qOjcykDMTbdtkb9DU+Ni/1IjMhoxpeSr+tCXnaQnmkBDVsWV7vmz8qtpr0d8OCL3wxusU0aX/X68NhF2hhwOTo+TuvTwAe6bVSI4FgkMGd8kOQHOxs0NWdYCHTFpvTuIx34fNgZzxutEKrNy+ovKV29BVHvTeBIBUAT2MxfwbBqViZjojIFYwAQevAyefUE86Xz1ufPmLxhzj93nweVtG0lI90CrQN4t5LLBcVkvzZpRnDNI1Tgqf8SwjjmxkavE4GiVulW6+SeVl3gq4X+BuKc63/IyBv45oyQnd6K836U+iX6YaYZ8v/jdTu4kp+7uCDG5n2nivZyiUXnsxgCaywwi1k7clwE5+49L9aXrL5JtO5AAMdTIvr9Y3DSbPHkMvLGfzoTLrfYkJLyqfbQMk3jzslT5CwXn1DQXyJDemrduOKtbNC21K109VhzdJgh6Nc6BaKMzFmlZhyjYQZOGy5/Hz+IzPXlh6R+n43BWDNsEdExzzpgJ3Trcs8YUzsM9fQG+gjq8Jrsw9uMvOlE1R4l+sIXAuQ2jlgp6xnd4otCAeZW4GcnJCDs1wrmY970cG799e4UdCLNk3aYTwsFJ+FlB/wH5Oz5GGhbZgnLnH/WmBXrw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(346002)(39860400002)(40470700004)(46966006)(36840700001)(82310400005)(86362001)(36860700001)(40460700003)(41300700001)(52536014)(5660300002)(33656002)(356005)(82740400003)(2906002)(81166007)(316002)(55016003)(40480700001)(47076005)(54906003)(8936002)(83380400001)(336012)(4326008)(70586007)(70206006)(6506007)(8676002)(53546011)(9686003)(478600001)(110136005)(7696005)(186003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 04:46:29.2277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d872314c-6560-4085-6485-08da54d35680
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7031

SGkgSmFuIChhbmQgQW5kcmV3KSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IE9uIDE3LjA2LjIwMjIgMDU6
MjYsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4gSXQgc2VlbXMgdGhhdCB0aGlzIHNlcmllcyBbMV0g
aGFzIGJlZW4gc3RhbGUgZm9yIG1vcmUgdGhhbiBhIG1vbnRoIGFuZCBhbHNvDQo+ID4gdGhpcyBz
ZXJpZXMgc2VlbXMgdG8gYmUgcHJvcGVybHkgcmV2aWV3ZWQgYW5kIGFja2VkIGFscmVhZHkuDQo+
ID4NCj4gPiBGcm9tIHdoYXQgSmFuIGhhcyByZXBsaWVkIHRvIFJvZ2VyIGFuZCBBbmRyZXc6DQo+
ID4gIi4uLiB0aGlzIGFkZGl0aW9uIHRoZSBzZXJpZXMgd291bGQgbm93IGxvb2sgdG8gYmUgcmVh
ZHkgdG8gZ28gaW4sDQo+ID4gSSdkIGxpa2UgdG8gaGF2ZSBzb21lIGZvcm0gb2YgY29uZmlybWF0
aW9uIGJ5IHlvdSwgQW5kcmV3LCB0aGF0DQo+ID4geW91IG5vdyB2aWV3IHRoaXMgYXMgbWVldGlu
ZyB0aGUgY29tbWVudHMgeW91IGdhdmUgb24gYW4gZWFybGllcg0KPiA+IHZlcnNpb24uIg0KPiA+
DQo+ID4gU28gSSBndWVzcyB0aGlzIGNhbiBiZSBtZXJnZWQuIFNlbmRpbmcgdGhpcyBhcyBhIGdl
bnRsZSByZW1pbmRlciBmb3INCj4gPiBwb3NzaWJsZSBhY3Rpb25zIGZyb20gUm9nZXIgYW5kIEFu
ZHJldy4gVGhhbmtzIQ0KPiANCj4gTXkgdmlldyBoZXJlIHJlbWFpbnMgYXMgYmVmb3JlIC0gSSdk
IHByZWZlciB0byBhdm9pZCBtZXJnaW5nIHRoaXMNCj4gd2l0aG91dCBhdCBsZWFzdCBpbmZvcm1h
bCBhZ3JlZW1lbnQgYnkgQW5kcmV3Lg0KDQpTdXJlLCB0aGVuIEkgd291bGQgcm91dGUgdGhpcyBl
bWFpbCB0byBBbmRyZXcgKGJ5IGRpcmVjdGx5ICJUbzoiIGhpbSkgc28NCnRoYXQgaGUgY2FuIHRh
a2UgYSBsb29rIHdoZW4gaGUgZ2V0cyBzb21lIGZyZWUgdGltZS4NCg0KPiANCj4gPiBBbHNvLCBu
b3Qgc3VyZSB3aHkgbXkgYWNrZWQtYnkgZm9yIHRoZSBDSEFOR0VMT0cubWQgaXMgbWlzc2luZyBp
bg0KPiA+IHBhdGNod29yaywganVzdCBpbiBjYXNlIC0gZm9yIHRoZSBjaGFuZ2UgaW4gQ0hBTkdF
TE9HLm1kIGluIHBhdGNoIzM6DQo+ID4NCj4gPiBBY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnku
V2FuZ0Bhcm0uY29tPg0KPiANCj4gQXQgYSBndWVzcyB0aGF0IG1pZ2h0IGJlIGJlY2F1c2UgdGhh
dCBlYXJsaWVyIHJlcGx5IHRoYXQgeW91IGRpZCBzZW5kDQo+IHdhcyB0byAwLzMsIG5vdCAzLzMu
DQoNClllcCB0aGF0IHNob3VsZCBiZSB0aGUgcmVhc29uIC0gbm93IHRoaXMgcGF0Y2ggaW4gcGF0
Y2h3b3JrIGhhcyBteQ0KYWNrZWQtYnkuIFRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uIGFuZCBJ
IHdpbGwga2VlcCB0aGlzIGluIG1pbmQgaW4NCnRoZSBmdXR1cmUgOikNCg0KS2luZCByZWdhcmRz
LA0KSGVucnkNCg0KPiANCj4gSmFuDQo=

