Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA4375CFFD
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 18:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567657.886980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMtGV-0008Gm-Ei; Fri, 21 Jul 2023 16:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567657.886980; Fri, 21 Jul 2023 16:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMtGV-0008Ev-C8; Fri, 21 Jul 2023 16:46:03 +0000
Received: by outflank-mailman (input) for mailman id 567657;
 Fri, 21 Jul 2023 16:46:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pf5t=DH=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qMtGT-0008Ep-Rb
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 16:46:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 105a9780-27e6-11ee-8611-37d641c3527e;
 Fri, 21 Jul 2023 18:45:57 +0200 (CEST)
Received: from DU2PR04CA0268.eurprd04.prod.outlook.com (2603:10a6:10:28e::33)
 by AS2PR08MB9343.eurprd08.prod.outlook.com (2603:10a6:20b:598::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Fri, 21 Jul
 2023 16:45:53 +0000
Received: from DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::98) by DU2PR04CA0268.outlook.office365.com
 (2603:10a6:10:28e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 16:45:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT064.mail.protection.outlook.com (100.127.143.3) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.35 via Frontend Transport; Fri, 21 Jul 2023 16:45:52 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Fri, 21 Jul 2023 16:45:52 +0000
Received: from e7f2e2cd2a88.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 895B95DF-3147-4C31-B36C-09AE2C625C56.1; 
 Fri, 21 Jul 2023 16:45:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e7f2e2cd2a88.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Jul 2023 16:45:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB7506.eurprd08.prod.outlook.com (2603:10a6:20b:4f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 16:45:44 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 16:45:44 +0000
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
X-Inumbo-ID: 105a9780-27e6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO3eQnv1fs9UD9jh5L8BYHoK7voDyvxMDzI2vo71+H8=;
 b=ovWPY7j7U+2PiOipM60nG4cDAXVkjtZzgdPqAZTFhnD8JnkElK7ugRuwcxx9poM4P+jLfB82UzKwqwnnyo9jchjDmyonzTY6mfIVFynIPdPtuDI0jTQBVGbbYq8ncm4AGZBN84nZEiWMRPRjn0l2HzxAOdWbgUbLM2t8vPoQTXc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9e9f2f7cddfbf2d5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfM/LqjcZJ1qigmtlexWWuOolbYgsEJvQyKfg1R/56bIE35DEwrofkhUrXMLOxXt+1CyZ+JscpbklMEsJSAhBqdZ9Lw2OmzI0iSrTtp0IJAC7HUO1DhRyECQsTzLiwyoRiRtdjXbtC40JhLQ6wuxmD46SUHE3orj27hPpeXo97Ea9LaZKKi6wrRb3IKSJlQwMXY3HQGciBz1Gu9cvlv5yRakOlUq7Yvy9se0cAxuOcDon2EZ1R2txxD+ivk8uFIaV5ywP/NPWRNUJbolqLq1eEzhbxDGHczHp60VVStEBGQ9ddeZS2BQAdxwOWPh6bnPzeqC/efqLzOpJora0h674Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO3eQnv1fs9UD9jh5L8BYHoK7voDyvxMDzI2vo71+H8=;
 b=W7Q9dIZTOijKnjHpTtA1BfQakT5UzYL/H0bFjMf4DT3Icphy8RfVLUQWD/y0H+JOgwfN/t/R/O+S4JxtCj1lg35k+vuy0L1fJOI/8B38V7eBv9PefzZml5n5S4ZJ03/guYipb0biHzlHqKxfJfPhNf8QKenjELg7ZSJ04C0ZAnPmFzmwapSe8pNo89E260kUGX4KsCSMc8J/zFWUAVcbR99IcM20wDEYLQLpwk2BhxMBVp0IkAn8KDhl14TLVqL4quHuLe1CQ858cwRZc9P4m5xl6nDn2lpeeFVSa0dajhGwNNOULrad2zBDZuEG4KKH2dM2eqf7aZSnZxGFwMBTDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO3eQnv1fs9UD9jh5L8BYHoK7voDyvxMDzI2vo71+H8=;
 b=ovWPY7j7U+2PiOipM60nG4cDAXVkjtZzgdPqAZTFhnD8JnkElK7ugRuwcxx9poM4P+jLfB82UzKwqwnnyo9jchjDmyonzTY6mfIVFynIPdPtuDI0jTQBVGbbYq8ncm4AGZBN84nZEiWMRPRjn0l2HzxAOdWbgUbLM2t8vPoQTXc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [OSSTEST] ts-kernel-build: add kernel kconfig for the Arndale
Thread-Topic: [OSSTEST] ts-kernel-build: add kernel kconfig for the Arndale
Thread-Index: AQHZu81JNSQT8M0pukCzoS21u4bdG6/ENcMAgAA4KoA=
Date: Fri, 21 Jul 2023 16:45:44 +0000
Message-ID: <2CA77C15-BA9B-4D98-80A0-B1B7EDE4E48B@arm.com>
References: <20230721121627.1229906-1-luca.fancellu@arm.com>
 <ceb7d6ad-0292-facf-6ad5-4bd265a8d34d@suse.com>
In-Reply-To: <ceb7d6ad-0292-facf-6ad5-4bd265a8d34d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB7506:EE_|DBAEUR03FT064:EE_|AS2PR08MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b17dd6-6957-4d04-b44a-08db8a09f24a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 623QHv80aLHe4no2/Qx58Roe7yAgkCSGkRvfasKrgwKPRP1INUh95PbB94ULBKtGB8aZT3j0AJPm3WgV24FmikD151C8efGK5BA/Z8bz6HHmrtWmsMTRbUmkYZwTouP4slplFSzeBNxu2WmYfGTyrgNCfDFcE3JvGTWUif6uqIaWY/LDS3GwJPXzGtTc1AAwcahAQcQbVcCY+YVCjdJvipY4I1HDpryalosCRSPl7VztL7aRra4VIWBgWc/pd1yGS6/M2Y6bMiGzU1HggwcYW7EJqWyl7fcmp1X5y2lhe0VwmMsy/Hl16NTV4pGd7m6w/NYHo8o0R0LkuRhF02HEggD+z3q3UsxvW0Wjcr97eKCsNdGeP3ACClo5CZ9nSWqN+Lf7BY2xw30pd3bvn00LhjTHMnJwTVSNgzFQ+uY+ITAG/8uS/sfjeylUu8YLKTA5XpOvNetPJ4WfLdqULJ0C729zUImyD7NjkCU18qqNbn4qvV+DUMJO7Xaj7xsy2hiXkLGjYpi64TM04wfNhSgFGXIxUCpFR7Bt08QTdq8id962MCg+huA4JqXcW5hR/Wg/k1VtNSNKep0Stdtkp/nhq114Bg3bXkm1PTXujPicSj+WPyFQq4e5Xds70Rvz20jR2CpiIcOq7PieASDNrGAEjg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(6512007)(122000001)(38100700002)(186003)(2616005)(6506007)(53546011)(26005)(33656002)(2906002)(8676002)(8936002)(5660300002)(71200400001)(36756003)(478600001)(38070700005)(6486002)(316002)(64756008)(66446008)(4326008)(6916009)(41300700001)(66476007)(54906003)(86362001)(66946007)(66556008)(76116006)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF2A59B700AD3A40B4C0DFEA8E090879@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7506
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c2b7b6c-3e72-4c2b-0bb1-08db8a09ed43
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tsyCzmijQ9z6MPM1BXbb7ujAvWgiY8ZguPlE1nw5V/HPB5YtOrGiUJNwQMyMnfHZencije0mopzXMVkrhesHKVcT3UmnIfx1e4tEHBg5qhW68hpZippUKwbBU6jrJaH1d4Mm4gO1c5ijf7xRHgPrCLMTCvQgXNX3jAn8LLWr9dBNXuPTWPPFaySW8HkCb3NxPJ1wIk7QZ1vkF6hzc+PUFnRYy+8y+9tOJHNpPTF9Kv09bnKAGSFeJ+TF9+GreITZm++OQAvYnVkaDDAgRuNcWkMrx3As9GhMTjCs7K2+VrGlniA1tQSQOkNTdeys/bT7oUwvyxWo6Z5CG96BIUDeDvubtRebZ9VkCGwFhDCd9z3FUqv3hUvKtGTL/D29Fr2PAO0EA3mfDMh3/bJQCALbquiAU8dzq3ISKKZx/McCBkL3OcJyKBierh9S3exZy2UZ4RSqYz0imwYmtgIWTf5yp8msfF/KzvR8oqCH7a/r/g3ou0fnytKSJ3LrdA98hp/Yhs/xZrQiUcbqwH3sJW47m83Nr8LzIa93qi5/Adw4RMKIHzjO0Dek7TkbVOsVC8t29lUCvg1OGF2nB916SUX+xRIiAuU/5y/DMrmp33NAYhUi0ILi2u4QA8IQ5ly9f7m43DFmAzg8oqZRMDjdzU9Fw4NAD8FbHqX/0wJ30ef+yWYsciV0pfw8gOcjz5P6VPCauy461b9ECA5M0yxikzb7i1CaGA2ifrnreOJCATgPP18=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(40460700003)(8936002)(8676002)(6862004)(33656002)(36860700001)(2906002)(36756003)(6506007)(5660300002)(26005)(2616005)(47076005)(356005)(53546011)(82740400003)(81166007)(186003)(336012)(40480700001)(70586007)(4326008)(70206006)(54906003)(86362001)(6486002)(41300700001)(478600001)(6512007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 16:45:52.7065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b17dd6-6957-4d04-b44a-08db8a09f24a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9343

DQoNCj4gT24gMjEgSnVsIDIwMjMsIGF0IDE0OjI0LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjEuMDcuMjAyMyAxNDoxNiwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IFRoZSBMaW51eCBjb21taXQgMzM2MjlkMzUwOTBmNWNlMmIxYjRjZTc4YWEzOTk1
NGM2MDM1MzZkNSBoYXMNCj4+IHJlbW92ZWQgdGhlICdzbnBzLGR3Yy1haGNpJyBjb21wYXRpYmxl
IGZyb20gdGhlIGdlbmVyaWMNCj4+IEFIQ0ktcGxhdGZvcm0gZHJpdmVyIGNvbnRyb2wgbW9kdWxl
IHNlbGVjdGVkIGJ5DQo+PiBDT05GSUdfU0FUQV9BSENJX1BMQVRGT1JNLg0KPj4gDQo+PiBBIG5l
dyBkcml2ZXIsIHRoZSBEV0MgQUhDSSBTQVRBIHBsYXRmb3JtIGRyaXZlciBpcyBub3cgaW1wbGVt
ZW50ZWQNCj4+IGFuZCBoYW5kbGVzIHRoZSBhYm92ZSBjb21wYXRpYmxlIHdoZW4gQ09ORklHX0FI
Q0lfRFdDIGlzIHNlbGVjdGVkLg0KPj4gDQo+PiBUaGUgbW9kdWxlIGlzIG5lZWRlZCBmb3IgdGhl
IEFybmRhbGUgYm9hcmQgdG8gaGF2ZSB0aGUgU0FUQSBjb250cm9sbGVyDQo+PiB3b3JraW5nLCBz
byBlbmFibGUgdGhlIENPTkZJR19BSENJX0RXQyBhcyBhZGRpdGlvbmFsIGtjb25maWcgcGFyYW1l
dGVyDQo+PiBpbiB0cy1rZXJuZWwtYnVpbGQuDQoNCkhpIEphbiwNCg0KPiANCj4gTGFyZ2VseSBv
dXQgb2YgY3VyaW9zaXR5OiBTaW5jZSB5b3Ugc2F5ICJtb2R1bGUiIGhlcmUsIC4uLg0KPiANCj4+
IC0tLSBhL3RzLWtlcm5lbC1idWlsZA0KPj4gKysrIGIvdHMta2VybmVsLWJ1aWxkDQo+PiBAQCAt
MjQ1LDYgKzI0NSw3IEBAIHNldG9wdCBDT05GSUdfU0VOU09SU19MTTkwIG4NCj4+IHNldG9wdCBD
T05GSUdfSUNTOTMyUzQwMSBuDQo+PiANCj4+ICMgRW5hYmxlIHNvbWUgYWRkaXRpb25hbCBkcml2
ZXJzIGZvciBBcm5kYWxlLg0KPj4gK3NldG9wdCBDT05GSUdfQUhDSV9EV0MgeQ0KPiANCj4gLi4u
IGRvZXMgaXQgcmVhbGx5IG5lZWQgdG8gYmUgeSAoYW5kIG5vdCBtKSBoZXJlPw0KDQpJIGRpZG7i
gJl0IHRyeSB3aXRoIG0gYmVmb3JlIGJlY2F1c2UgSSB3YXMgdW5zdXJlIHdoZXJlIHRoZSBrZXJu
ZWwgbW9kdWxlIHdlcmUgcHV0IChpbiB0aGUgZGlzaz8gQnV0IHRoZW4gd2UgbmVlZCB0byByZWFk
IGl0KSwNCmJ1dCBub3cgSSBkaWQgYSB0cnkgd2l0aCDigJht4oCZIGFuZCBpdCB3b3Jrcywgc28g
SSBndWVzcyB0aGUgbW9kdWxlIGFyZSBwdXQgaW4gc29tZSByYW1kaXNrIGluc3RlYWQgb2YgdGhl
IGRpc2sgd2Ugd2FudCB0byByZWFkLg0KDQpUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQgb3V0Lg0K
DQpAUm9nZXIsIGlzIGl0IHBvc3NpYmxlIHRvIGNoYW5nZSBpdCBvbiBjb21taXQgb3Igc2hvdWxk
IEkgc2VuZCBhIHYyPw0KDQpDaGVlcnMsDQpMdWNhDQoNCj4gDQo+IEphbg0KDQo=

