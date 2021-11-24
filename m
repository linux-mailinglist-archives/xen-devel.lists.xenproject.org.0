Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA9F45B408
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 06:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230056.397771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpl7K-0005oJ-9k; Wed, 24 Nov 2021 05:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230056.397771; Wed, 24 Nov 2021 05:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpl7K-0005lN-67; Wed, 24 Nov 2021 05:46:50 +0000
Received: by outflank-mailman (input) for mailman id 230056;
 Wed, 24 Nov 2021 05:46:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PfMc=QL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1mpl7H-0005lH-Lv
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 05:46:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe02::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e740bea4-4ce9-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 06:46:44 +0100 (CET)
Received: from AM7PR03CA0023.eurprd03.prod.outlook.com (2603:10a6:20b:130::33)
 by AM5PR0801MB1779.eurprd08.prod.outlook.com (2603:10a6:203:2f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 05:46:38 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::f6) by AM7PR03CA0023.outlook.office365.com
 (2603:10a6:20b:130::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Wed, 24 Nov 2021 05:46:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 05:46:37 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Wed, 24 Nov 2021 05:46:37 +0000
Received: from bfdcd5859eaf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F73AC2D3-F70C-4730-9259-283D443C0704.1; 
 Wed, 24 Nov 2021 05:46:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bfdcd5859eaf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Nov 2021 05:46:26 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by PA4PR08MB6207.eurprd08.prod.outlook.com (2603:10a6:102:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Wed, 24 Nov
 2021 05:46:24 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::99cd:3d3b:4670:7413]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::99cd:3d3b:4670:7413%5]) with mapi id 15.20.4713.025; Wed, 24 Nov 2021
 05:46:23 +0000
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
X-Inumbo-ID: e740bea4-4ce9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gW+3P/vQ5x9Q8Xt4GgCYZmBVuMi9sojU6FxOzJpjNg=;
 b=c86RXWb9l8IisU806BgBBsPk6sD73D8YDZ1lwReW3akHzT5JkyalIOjUOw2iRuUPtNAmXlC2GsdIjvxjOga7YCe8f1EINWVMrPx8eCnOgoWB0UlkQUihR6IunhJYZQuGRqtsNdgM15GIaskVaYumgLC/5h0pMBlh0APad8wjtXA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgMo963PVpBFLC17Dk31fffY77nhgB6xpZj+fc+wAGI+zsBaNbgvD2Po10SnHsoMv4xpMEt9FRvUmggYer9vXzm1zdLku/rc4LKAirs0pNC4PUyi4Ey47oh8/wewFPTu7ZZhoe1Fi1lC/rBcNEAPfKdZX3Ja3D4xVtmHi/pFPOwmSTJiKY9COgGZTNX53p7zDahOufD9QLm0qwA5tS3a9zGLLtMnDzxjM/3XXxu27itdCP483mPEmUG49xuKMEWVQ8HqXlnCnbLoCCpozK3vOYDY37bkE3Vk8meY/b02rdQhAqJq6+zbDfpvl594gYY1+p+3+b7O9/vXwhnszlXS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gW+3P/vQ5x9Q8Xt4GgCYZmBVuMi9sojU6FxOzJpjNg=;
 b=UW7ce0dEf4GOQTxt9Mvxok1pg19phcGI6AYMZm3+MQfjr+ERmunGp+6hj7KI0rhFKOhXp050Ug4MXxG50DdbyJfb25BLtR2zUgc7sgsorheH3Qcx7R+6SrxViDew1qtxx/cnOAjUwqXr/VxQDVzBtzDRGRknZpPOvRHcoInk6L5o/jOcxcGujAMKDzc1m4MMap0UltpUMfep6VcyVzmu9Dfg1YIcs0A1lySR8V3B02CzVcJ0DMZtCpiwmy5JxEZroeBlKIyNPrVO309ExoGdFgwP4karMreqHqnbSEgGt1Tl+qHqOzA1LT5gsYLSFbmO9thly0OX6t8dTCJSkoc0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gW+3P/vQ5x9Q8Xt4GgCYZmBVuMi9sojU6FxOzJpjNg=;
 b=c86RXWb9l8IisU806BgBBsPk6sD73D8YDZ1lwReW3akHzT5JkyalIOjUOw2iRuUPtNAmXlC2GsdIjvxjOga7YCe8f1EINWVMrPx8eCnOgoWB0UlkQUihR6IunhJYZQuGRqtsNdgM15GIaskVaYumgLC/5h0pMBlh0APad8wjtXA=
From: Henry Wang <Henry.Wang@arm.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Longpeng (Mike, Cloud
 Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gonglei
 (Arei)" <arei.gonglei@huawei.com>, "x86@kernel.org" <x86@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Valentin
 Schneider <Valentin.Schneider@arm.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: RE: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be
 brought up again.
Thread-Topic: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be
 brought up again.
Thread-Index: AQHX37hKGtzzqQcms0GH3edF0vl/xqwSLU/Q
Date: Wed, 24 Nov 2021 05:46:23 +0000
Message-ID:
 <PA4PR08MB6253478CA634E39607799B4292619@PA4PR08MB6253.eurprd08.prod.outlook.com>
References: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
In-Reply-To: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 342304AF31CB7A44A51D8ACA47F62A30.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 716d0928-6a88-41a1-185e-08d9af0dc855
x-ms-traffictypediagnostic: PA4PR08MB6207:|AM5PR0801MB1779:
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB17793DB1FA5D5B9DC4B332BC92619@AM5PR0801MB1779.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QiFMezQaBiOB9lKmwqh4Hod6ALUSYYFVK1/aGGqR+wqU1R+6lRqxF0jq2e/iwMhblHxxSjKbrKmRMXIXb4vFEcRp9O4IQPHB4okgVAkxBFaueyW2Kl5U0/aQykL6zF4Q/mCVxK8PuPUtjBDSP90izjNuJvkLhe+kYmGUhMy50qaN1NlgnPIzZ5BkyahOCl9sSAeFu6BgCBYKMm5pttzg8Db6v7bKc+HpqC4ZMd5gVMeim1dqK1/VhKOND2xn/fYbcwvjxwJOQiKzj6g+QZZKfAOTeYCQfitlr3MVB10ZPro3kaPdZu46cEXNEMnTQuorObeRUPlB1K7EQ54yykznLtcmSpdqGpytvJyiBXnYCV1JO7dCEzUQWODwk4IW586PCk3fbstPO5/VNzeWUO8L0DmIapCBVknnCd0kiKBBIvatvHuIfiC4qcicbg7/zBQ2nFIeEI0bN7SORXLKr1448dkA132DnM/ugxSewK/Tx4uwzhySmN3J3UuW1vfCeP/xt8S5lRk7F05TzXuxYWXoFsLTzS8zPOYeBncaW3xQAgp/FeW5TG0Al7vDdlOtYEULfwytQiwLHTtE9MaD74SbcL6BO5kDVIcFZkQr0zrz0hFgC30KsNKyvQCSKgt1ihPq6nqSd9VrMvlrpkaVuXwkDilSk5fRCk2+FOUOUFgKohVfvuaXD3CuHWv/JYCpwsuFL8cIxoos03oVAFmO/KH8ooURTJOt7GleGAqXeAZa/qNvmrdvnW4oEXs1IlY1dgQ/erAaJCt4c5v01UZq7246pfagsHPMabzFMEf1qkhQLnw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(53546011)(316002)(7416002)(5660300002)(86362001)(6506007)(52536014)(54906003)(7696005)(110136005)(9686003)(83380400001)(966005)(26005)(71200400001)(55016003)(33656002)(2906002)(76116006)(186003)(8676002)(4326008)(122000001)(8936002)(66476007)(66946007)(66446008)(64756008)(66556008)(38100700002)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6207
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2ec1a6c5-d07f-4577-fb7c-08d9af0dbfae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U75dJsnfrrQawVG7FhZDnL76cFKRBsHEL7tkZS+9PdKGQOAm0FNctEFY6KYdSZkPzaAVv3aoa5s1WWMC1L7vVVzKLrDiiJoG1BGWz/Sb8kR+0vxMpLWlK3zA9OXPCcvE/LQQFuFqU0YWwPl7ATkD7n8CtJu3U50iT+MuDFcIFW4UEs8RYbSvzVw74StdlnEtD/2gZxQdupfQPbDTHLsUCqX4VS8s87cokYNMybvdFjQYNUJ28OShxq5rfNXhmoXx9Cffavapo3FmcKATJvsjxPx242TWprCAna9OAnu5KZTe8Xov6xQwTJlJHi94StQaVpX434J5God0EVmzMAAD7XHk4SMZGROD+knS+Q7yB57y/63qbQ1fKAjNQcjWtMGZgbKL6x0RNlsuZHQw2jhU7fZe5x9yFlgD+mtlwfw+xsiqQzeN1kK8lUyWlPMYy7xC9+IKLfOTjN1TzNVFRThXrtLidedhT59sZRpUr6vLPaszPB+1D/MVf4/z8iVVnN4O59SSy0XULIkyl/KgxAhiYg/xH6fwW6cAJ4yM6HOIrWzVyma1Kcu5M+ROYiKV4BaH9qwwGDmNvVeoCFfGsaMxFeOE4cFJj+idPAeC38tMcZID6Nc3/2fB8me3qFTDYLJ+P9fCLhUKtZZdxOgSV7HhHS+nBB5dFa7d301gGzbU1W7i2EP3P3gAzjlmUeKUUO7gfmZ0u0i6Fy137KFaaV2gSFQdtMDOB3f578yujIEEZYWNiAz4cMmeiG+vrW4x6xWhE6RS1vy0yzbmX90DLpX62olU8vTWaOz6veYQIF1R29k=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(316002)(36860700001)(83380400001)(70206006)(70586007)(26005)(55016003)(82310400004)(86362001)(7696005)(9686003)(4326008)(2906002)(8936002)(966005)(107886003)(47076005)(33656002)(6506007)(356005)(186003)(336012)(508600001)(8676002)(110136005)(81166007)(53546011)(52536014)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 05:46:37.9531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 716d0928-6a88-41a1-185e-08d9af0dc855
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1779

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRldmVsIDx4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+IFNl
YmFzdGlhbiBBbmRyemVqIFNpZXdpb3INCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAyMiwgMjAy
MSAxMTo0NyBQTQ0KPiBUbzogTG9uZ3BlbmcgKE1pa2UsIENsb3VkIEluZnJhc3RydWN0dXJlIFNl
cnZpY2UgUHJvZHVjdCBEZXB0LikNCj4gPGxvbmdwZW5nMkBodWF3ZWkuY29tPg0KPiBDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgR29uZ2xlaSAoQXJlaSkgPGFyZWkuZ29uZ2xlaUBo
dWF3ZWkuY29tPjsNCj4geDg2QGtlcm5lbC5vcmc7IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgUGV0ZXIgWmlqbHN0cmENCj4gPHBldGVyekBpbmZyYWRlYWQub3JnPjsgSW5nbyBNb2xu
YXIgPG1pbmdvQGtlcm5lbC5vcmc+OyBWYWxlbnRpbg0KPiBTY2huZWlkZXIgPFZhbGVudGluLlNj
aG5laWRlckBhcm0uY29tPjsgQm9yaXMgT3N0cm92c2t5DQo+IDxib3Jpcy5vc3Ryb3Zza3lAb3Jh
Y2xlLmNvbT47IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8NCj4gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPjsNCj4gSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+OyBCb3Jpc2xh
diBQZXRrb3YgPGJwQGFsaWVuOC5kZT47IERhdmUNCj4gSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51
eC5pbnRlbC5jb20+OyBILiBQZXRlciBBbnZpbiA8aHBhQHp5dG9yLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIXSBjcHUvaG90cGx1ZzogQWxsb3cgdGhlIENQVSBpbiBDUFVfVVBfUFJFUEFSRSBzdGF0
ZSB0byBiZQ0KPiBicm91Z2h0IHVwIGFnYWluLg0KPiANCj4gRnJvbTogIkxvbmdwZW5nKE1pa2Up
IiA8bG9uZ3BlbmcyQGh1YXdlaS5jb20+DQo+IA0KPiBBIENQVSB3aWxsIG5vdCBzaG93IHVwIGlu
IHZpcnR1YWxpemVkIGVudmlyb25tZW50IHdoaWNoIGluY2x1ZGVzIGFuDQo+IEVuY2xhdmUuIFRo
ZSBWTSBzcGxpdHMgaXRzIHJlc291cmNlcyBpbnRvIGEgcHJpbWFyeSBWTSBhbmQgYSBFbmNsYXZl
DQo+IFZNLiBXaGlsZSB0aGUgRW5jbGF2ZSBpcyBhY3RpdmUsIHRoZSBoeXBlcnZpc29yIHdpbGwg
aWdub3JlIGFsbCByZXF1ZXN0cw0KPiB0byBicmluZyB1cCBhIENQVSBhbmQgdGhpcyBDUFUgd2ls
bCByZW1haW4gaW4gQ1BVX1VQX1BSRVBBUkUgc3RhdGUuDQo+IFRoZSBrZXJuZWwgd2lsbCB3YWl0
IHVwIHRvIHRlbiBzZWNvbmRzIGZvciBDUFUgdG8gc2hvdyB1cA0KPiAoZG9fYm9vdF9jcHUoKSkg
YW5kIHRoZW4gcm9sbGJhY2sgdGhlIGhvdHBsdWcgc3RhdGUgYmFjayB0bw0KPiBDUFVIUF9PRkZM
SU5FIGxlYXZpbmcgdGhlIENQVSBzdGF0ZSBpbiBDUFVfVVBfUFJFUEFSRS4gVGhlIENQVSBzdGF0
ZSBpcw0KPiBzZXQgYmFjayB0byBDUFVIUF9URUFSRE9XTl9DUFUgZHVyaW5nIHRoZSBDUFVfUE9T
VF9ERUFEIHN0YWdlLg0KPiANCj4gQWZ0ZXIgdGhlIEVuY2xhdmUgVk0gdGVybWluYXRlcywgdGhl
IHByaW1hcnkgVk0gY2FuIGJyaW5nIHVwIHRoZSBDUFUNCj4gYWdhaW4uDQo+IA0KPiBBbGxvdyB0
byBicmluZyB1cCB0aGUgQ1BVIGlmIGl0IGlzIGluIHRoZSBDUFVfVVBfUFJFUEFSRSBzdGF0ZS4N
Cj4gDQo+IFtiaWdlYXN5OiBSZXdyaXRlIGNvbW1pdCBkZXNjcmlwdGlvbi5dDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBMb25ncGVuZyhNaWtlKSA8bG9uZ3BlbmcyQGh1YXdlaS5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vhc3lAbGludXRyb25peC5k
ZT4NCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMDkwMTA1MTE0My4yNzUy
LTEtDQo+IGxvbmdwZW5nMkBodWF3ZWkuY29tDQo+IC0tLQ0KPiANCj4gRm9yIFhFTjogdGhpcyBj
aGFuZ2VzIHRoZSBiZWhhdmlvdXIgYXMgaXQgYWxsb3dzIHRvIGludm9rZQ0KPiBjcHVfaW5pdGlh
bGl6ZV9jb250ZXh0KCkgYWdhaW4gc2hvdWxkIGl0IGhhdmUgaGF2ZSBlYXJsaWVyLiBJICp0aGlu
ayoNCj4gdGhpcyBpcyBva2F5IGFuZCB3b3VsZCB0byBicmluZyB1cCB0aGUgQ1BVIGFnYWluIHNo
b3VsZCB0aGUgbWVtb3J5DQo+IGFsbG9jYXRpb24gaW4gY3B1X2luaXRpYWxpemVfY29udGV4dCgp
IGZhaWwuDQo+IA0KPiAga2VybmVsL3NtcGJvb3QuYyB8IDcgKysrKysrKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9zbXBib290
LmMgYi9rZXJuZWwvc21wYm9vdC5jDQo+IGluZGV4IGY2YmMwYmM4YTJhYWIuLjM0OTU4ZDdmZTJj
MWMgMTAwNjQ0DQo+IC0tLSBhL2tlcm5lbC9zbXBib290LmMNCj4gKysrIGIva2VybmVsL3NtcGJv
b3QuYw0KPiBAQCAtMzkyLDYgKzM5MiwxMyBAQCBpbnQgY3B1X2NoZWNrX3VwX3ByZXBhcmUoaW50
IGNwdSkNCj4gIAkJICovDQo+ICAJCXJldHVybiAtRUFHQUlOOw0KPiANCj4gKwljYXNlIENQVV9V
UF9QUkVQQVJFOg0KPiArCQkvKg0KPiArCQkgKiBUaW1lb3V0IHdoaWxlIHdhaXRpbmcgZm9yIHRo
ZSBDUFUgdG8gc2hvdyB1cC4gQWxsb3cgdG8gdHJ5DQo+ICsJCSAqIGFnYWluIGxhdGVyLg0KPiAr
CQkgKi8NCj4gKwkJcmV0dXJuIDA7DQo+ICsNCj4gIAlkZWZhdWx0Og0KPiANCj4gIAkJLyogU2hv
dWxkIG5vdCBoYXBwZW4uICBGYW1vdXMgbGFzdCB3b3Jkcy4gKi8NCj4gLS0NCj4gMi4zMy4xDQo+
IA0KDQpSZXZpZXdlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpLaW5k
IHJlZ2FyZHMsDQoNCkhlbnJ5DQo=

