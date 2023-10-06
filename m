Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EDE7BB9F2
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 16:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613661.954354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolPw-0001aQ-0z; Fri, 06 Oct 2023 14:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613661.954354; Fri, 06 Oct 2023 14:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolPv-0001YQ-U1; Fri, 06 Oct 2023 14:02:59 +0000
Received: by outflank-mailman (input) for mailman id 613661;
 Fri, 06 Oct 2023 14:02:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3TD=FU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qolPu-0000EG-NS
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 14:02:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cccc234-6451-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 16:02:57 +0200 (CEST)
Received: from DU2P250CA0026.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::31)
 by VI1PR08MB5471.eurprd08.prod.outlook.com (2603:10a6:803:137::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 14:02:53 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::e7) by DU2P250CA0026.outlook.office365.com
 (2603:10a6:10:231::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Fri, 6 Oct 2023 14:02:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.26 via Frontend Transport; Fri, 6 Oct 2023 14:02:53 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211");
 Fri, 06 Oct 2023 14:02:52 +0000
Received: from 0d2f78b0b1f6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5768022-2048-41A7-8114-BCB88DCC9C1A.1; 
 Fri, 06 Oct 2023 14:02:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d2f78b0b1f6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Oct 2023 14:02:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6046.eurprd08.prod.outlook.com (2603:10a6:102:e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 14:02:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 14:02:41 +0000
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
X-Inumbo-ID: 0cccc234-6451-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+sg5o01tWqh+EKHLQM5Cc/Te0Kem7cdrOS1Bjlt9q8=;
 b=6i4CnbMctnBQTb5ENzWJ9b8C3lCMXtfprbDpmrgcNVWAlKpcTMZMjsSDYBZNxTSqSKeaBgYvzjK6k+yxjIUAVzVb7E2HL/osur4VT7sXW3aPeYwI/0oLryjgUjL6IyfQOIrn42beFNfyXBXWcQLnLplehW6NSmAT2T6DITKZeAM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0529d14d7e05b3db
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kuu55Whe3VdOYxMbzKCejwxGudJuYIldOrw07l5hY8yuEUySOkBIG4kVjlgJ1Dz7BA5YOOga3DbZJd+fNx5EhJ2vf6Xhm0r9jZLj3eWR/20YwfGLXYS1c4+CmzSp9fOdFHFMtZq5VTNm3XkPvmPyiANEO6vEOoN7sDi3lAUAaG1r4bbMYW9CrBi+IJV5L5R7A73i7F1eHWTQICEyVy4TvhK6NxUvK2o4a6z03z+fVCisM02UL7TjA+TklPe5M54DBu+zqaYRKwQ6K+IEM7aSjD7hYXN5F5vOP4IGVqS/6SsvULRvJUOe4zePVTG39DLdVMkOcv1pOxvpmYHxwkEtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+sg5o01tWqh+EKHLQM5Cc/Te0Kem7cdrOS1Bjlt9q8=;
 b=lsingF3FOQZBn3SXbgHCdY3akPWN1K4Qmwig7OIuydMA3XJJtMKQ7/zAGlAsUzlieCeph9QiMuNyiqdCKKHbFCLO6by+vwHpznbpZKK4tAx6cWlXM95JklTYAXZgAEWWejh+2GBzKn2TAjZ8sasu4vX5yKm7EgHt5BPnIql1nF6aCdDG3Qw93YMemu3kd4k/f6jsoFhLoNUAqJwy+7QGhBLG6VwF4roVIDmuh1Ns8eqNCdXNGBumY8KevR+pE3HynYfrivMDBS3L93wEsmgf/pSiI1U7yUyysz6WPGGgAgZ3CAnbnjOMRmkArZjoG1eE2pfeFPrTVE2NCKqUg+lUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+sg5o01tWqh+EKHLQM5Cc/Te0Kem7cdrOS1Bjlt9q8=;
 b=6i4CnbMctnBQTb5ENzWJ9b8C3lCMXtfprbDpmrgcNVWAlKpcTMZMjsSDYBZNxTSqSKeaBgYvzjK6k+yxjIUAVzVb7E2HL/osur4VT7sXW3aPeYwI/0oLryjgUjL6IyfQOIrn42beFNfyXBXWcQLnLplehW6NSmAT2T6DITKZeAM=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/2] domain: fix misaligned unmap address in
 {,un}map_guest_area()
Thread-Topic: [PATCH v2 1/2] domain: fix misaligned unmap address in
 {,un}map_guest_area()
Thread-Index: AQHZ+FVSiuHBkWxcn0ecPd7Xf/rLHLA8ytIA
Date: Fri, 6 Oct 2023 14:02:41 +0000
Message-ID: <81E3D4F8-E5A8-46F1-BA2A-E74AE7207D13@arm.com>
References: <20231006130059.97700-1-roger.pau@citrix.com>
 <20231006130059.97700-2-roger.pau@citrix.com>
In-Reply-To: <20231006130059.97700-2-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6046:EE_|DBAEUR03FT032:EE_|VI1PR08MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: dca7386d-2c46-4b4d-db63-08dbc674ef2d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mk+g2ksEURdycaxljwcYw2ziKNVH5yRo6lGRRHyHmm39jROMMzF8J0s5X9O/hdt2xDzMBzVx+Tf8/SMkKCog8GNSFC7G7QOskvGlWFjdkk9yvovR3qHCHhlVkBFlx5jZfJ6eoZCO8WhLXYJKzwPy1NHft24PP8KyvpMClyJkFmQ3e+jRs8pgfFHBNXXYrhphxUe9Jl8qGngV/U5xbAwjek2CD3iMPG43j8Z5v4SpXJwt9tcHOsI6orNWSRsNUl+91adLLw91oVmYe7NxWhSI2RG6XtV7RYB4w6+/3+ibEYo2JQVHyhRaIO/yMZYIsVEkSW5hBfyPxLev2xIYc/kXzTSAWD0o2JGm/p459YPSwISr5Kw4GhkP5jMNori7FfYT8/Puw0vV+KZyw+5Rrf3pqxRauoir5Hz+/E0zXyacP5ERVxStVwQf9KHq7mHugZxsjdJcqP1MnNkSevb5zWfWtkWzK4fIKYr9mppJPI11DOqIzZmUGo8/VDrQe/jbp4sDTUPoZDUo25bD6p/w+CR0nEtUlhs9CtzqA4XytoHEepIenoRE42/UvBGb4NMcPlpz3Nffd6hJcIZdzx9onvw0jS3k+Idl5hR248KV4CqH9kWL5eRFGAZBWRdH3InYyY0gwofABgRL7mRxgpR7ustDzg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(4326008)(8676002)(8936002)(316002)(6916009)(5660300002)(41300700001)(2616005)(478600001)(26005)(6486002)(122000001)(6512007)(76116006)(83380400001)(66946007)(54906003)(64756008)(66446008)(66476007)(66556008)(91956017)(2906002)(86362001)(33656002)(53546011)(71200400001)(38100700002)(38070700005)(6506007)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <618D38452EAD574787BD18DB3B982E1B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6046
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06692ab5-5b3e-4d2e-77c4-08dbc674e7e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kg4LxHaRI4t3WnHNcSJAvfGyQY8hVqCNYxjKsV8VIdyGg11cUW0I9PoH5ZE80f66DoUow80cSUYM9gv2kIgknRV1+xAudpij5T7IBswkIzObXlWHiuhQzOhiWYnPzDrS3+rJAyKa1GelDgQZN9h79WfVfMLyRJDawlDjQLnKp3tHMksqY/H8XHMZstO7viRNQ7bXD3+vlNlWIq66spwiSnmQWFVXIqk8vcMynWwpfeP3XWxHmRvzeEFqspU4qNuPimTjbNFw4qyMKgytKiWPUyb5xMiGiU4CDJkU1aPhKAOwrVBtodZ2gVLaIMSFRERR1DkwtvqNdohwOsRuDgyeuQlDZuKle/BrNjEN2fo+UYKhvG0Wva34mYyQatvL5wQFvu50934SSgNSUHk/Gy+8L9uOZdQS0jiNPs+zr4acx2CE7Ih2kgLYfgqeLyt5lXX42AtNSJw42bjtoMsPyin6ATWSdPl1GmF0M+yQLEy2Yt4XH+9eIEYXGNNSK9i9X7Vbn3Zq0nAxpuxTT/FCjNfQmnJHNUOSmS1MZxhGUcQs5cwi/VnY2ik7SZ4qnpNSrrdvGpg55sEJLwwZmcOtDAQCzStEpjCnFpi1sy7qBJbkeZUGHCYZ+0/ZTGF7Y/GdAGERKTtzqo8pR4OXMkQNxxzmISagtO1DszkQGfTOQlLzjexrDudEP6dnRWm8VKj9LvSh+kybXZmjMVQScqMRHv9j8w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(82310400011)(46966006)(36840700001)(33656002)(36756003)(86362001)(2906002)(47076005)(83380400001)(336012)(26005)(2616005)(36860700001)(82740400003)(81166007)(356005)(6506007)(5660300002)(6512007)(6862004)(4326008)(8676002)(8936002)(53546011)(478600001)(6486002)(41300700001)(316002)(54906003)(40480700001)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 14:02:53.4323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dca7386d-2c46-4b4d-db63-08dbc674ef2d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5471

SGkgUm9nZXIsDQoNCj4gT24gT2N0IDYsIDIwMjMsIGF0IDIxOjAwLCBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IHVubWFwX2RvbWFpbl9wYWdlX2ds
b2JhbCgpIGV4cGVjdHMgdGhlIHByb3ZpZGVkIGFkZHJlc3MgdG8gYmUgcGFnZSBhbGlnbmVkLCBv
cg0KPiBlbHNlIHNvbWUgb2YgdGhlIGNhbGxlZCBmdW5jdGlvbnMgd2lsbCB0cmlnZ2VyIGFzc2Vy
dGlvbnMsIGxpa2UNCj4gbW9kaWZ5X3hlbl9tYXBwaW5ncygpIG9uIHg4NiBvciBkZXN0cm95X3hl
bl9tYXBwaW5ncygpIG9uIEFybS4NCj4gDQo+IFRoZSBmb2xsb3dpbmcgYXNzZXJ0IGhhcyBiZWVu
IHJlcG9ydGVkIGJ5IG9zc3Rlc3QgYXJtIDMyYml0IHRlc3RzOg0KPiANCj4gKFhFTikgQXNzZXJ0
aW9uICdJU19BTElHTkVEKHMsIFBBR0VfU0laRSknIGZhaWxlZCBhdCBhcmNoL2FybS9tbS5jOjEy
NDMNCj4gKFhFTikgLS0tLVsgWGVuLTQuMTgtcmMgIGFybTMyICBkZWJ1Zz15ICBOb3QgdGFpbnRl
ZCBdLS0tLQ0KPiAoWEVOKSBDUFU6ICAgIDANCj4gKFhFTikgUEM6ICAgICAwMDI3MWEzOCBkZXN0
cm95X3hlbl9tYXBwaW5ncysweDUwLzB4NWMNCj4gWy4uLl0NCj4gKFhFTikgWGVuIGNhbGwgdHJh
Y2U6DQo+IChYRU4pICAgIFs8MDAyNzFhMzg+XSBkZXN0cm95X3hlbl9tYXBwaW5ncysweDUwLzB4
NWMgKFBDKQ0KPiAoWEVOKSAgICBbPDAwMjM1YWE4Pl0gdnVubWFwKzB4MzAvMHgxYTAgKExSKQ0K
PiAoWEVOKSAgICBbPDAwMjZhZDg4Pl0gdW5tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsKzB4MTAvMHgy
MA0KPiAoWEVOKSAgICBbPDAwMjA4ZTM4Pl0gdW5tYXBfZ3Vlc3RfYXJlYSsweDkwLzB4ZWMNCj4g
KFhFTikgICAgWzwwMDIwOGY5OD5dIGRvbWFpbl9raWxsKzB4MTA0LzB4MTgwDQo+IChYRU4pICAg
IFs8MDAyMzllM2M+XSBkb19kb21jdGwrMHg4YWMvMHgxNGZjDQo+IChYRU4pICAgIFs8MDAyN2Fl
MzQ+XSBkb190cmFwX2d1ZXN0X3N5bmMrMHg1NzAvMHg2NmMNCj4gKFhFTikgICAgWzwwMDIwMTlm
MD5dIGFyY2gvYXJtL2FybTMyL2VudHJ5Lm8jcmV0dXJuX2Zyb21fdHJhcCswLzB4NA0KPiANCj4g
Rml4ZXM6IGVhZGMyODhjYmIwZCAoJ2RvbWFpbjogbWFwL3VubWFwIEdBRERSIGJhc2VkIHNoYXJl
ZCBndWVzdCBhcmVhcycpDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPg0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5X
YW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gLS0tDQo+IENoYW5nZXMg
c2luY2UgdjE6DQo+IC0gQWxzbyBwYWdlLWFsaWduIHRoZSBhZGRyZXNzIGluIG1hcF9ndWVzdF9h
cmVhKCkuDQo+IC0tLQ0KPiB4ZW4vY29tbW9uL2RvbWFpbi5jIHwgNCArKy0tDQo+IDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4gaW5kZXggYjgy
ODFkN2NmZjlkLi4xNDY4NjM4YWRlOGIgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vZG9tYWlu
LmMNCj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPiBAQCAtMTYwMSw3ICsxNjAxLDcgQEAg
aW50IG1hcF9ndWVzdF9hcmVhKHN0cnVjdCB2Y3B1ICp2LCBwYWRkcl90IGdhZGRyLCB1bnNpZ25l
ZCBpbnQgc2l6ZSwNCj4gIHVubWFwOg0KPiAgICAgaWYgKCBwZyApDQo+ICAgICB7DQo+IC0gICAg
ICAgIHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbChtYXApOw0KPiArICAgICAgICB1bm1hcF9kb21h
aW5fcGFnZV9nbG9iYWwoKHZvaWQgKikoKHVuc2lnbmVkIGxvbmcpbWFwICYgUEFHRV9NQVNLKSk7
DQo+ICAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUocGcpOw0KPiAgICAgfQ0KPiANCj4gQEAgLTE2
MzQsNyArMTYzNCw3IEBAIHZvaWQgdW5tYXBfZ3Vlc3RfYXJlYShzdHJ1Y3QgdmNwdSAqdiwgc3Ry
dWN0IGd1ZXN0X2FyZWEgKmFyZWEpDQo+IA0KPiAgICAgaWYgKCBwZyApDQo+ICAgICB7DQo+IC0g
ICAgICAgIHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbChtYXApOw0KPiArICAgICAgICB1bm1hcF9k
b21haW5fcGFnZV9nbG9iYWwoKHZvaWQgKikoKHVuc2lnbmVkIGxvbmcpbWFwICYgUEFHRV9NQVNL
KSk7DQo+ICAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUocGcpOw0KPiAgICAgfQ0KPiB9DQo+IC0t
IA0KPiAyLjQyLjANCj4gDQoNCg==

