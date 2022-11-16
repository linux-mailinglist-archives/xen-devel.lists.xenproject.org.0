Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03BA62B4BF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 09:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444212.699173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDYM-0001NS-Vn; Wed, 16 Nov 2022 08:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444212.699173; Wed, 16 Nov 2022 08:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDYM-0001K0-SB; Wed, 16 Nov 2022 08:13:50 +0000
Received: by outflank-mailman (input) for mailman id 444212;
 Wed, 16 Nov 2022 08:13:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Po/4=3Q=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ovDYL-0001Jq-Ip
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 08:13:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97934d8a-6586-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 09:13:48 +0100 (CET)
Received: from AM6PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:20b:f0::41)
 by AM9PR08MB6659.eurprd08.prod.outlook.com (2603:10a6:20b:30a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Wed, 16 Nov
 2022 08:13:34 +0000
Received: from VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::e3) by AM6PR04CA0064.outlook.office365.com
 (2603:10a6:20b:f0::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Wed, 16 Nov 2022 08:13:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT065.mail.protection.outlook.com (100.127.144.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 08:13:33 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Wed, 16 Nov 2022 08:13:33 +0000
Received: from a41d0287b470.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0A1DCDF-E87F-4AA1-BA24-12E9F2498084.1; 
 Wed, 16 Nov 2022 08:13:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a41d0287b470.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Nov 2022 08:13:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5694.eurprd08.prod.outlook.com (2603:10a6:800:1a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Wed, 16 Nov
 2022 08:13:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%7]) with mapi id 15.20.5834.007; Wed, 16 Nov 2022
 08:13:24 +0000
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
X-Inumbo-ID: 97934d8a-6586-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHeC7yao2e0KNT+Zv2ShcnlZtanRjcgGypJsMDNr1tA=;
 b=HfFgrx3Nrd2T0M7Pd1J4Depr3PKu/NHyxh5NPaMhzEcm68g95TzahZcCIqTb0t194FV+U5De3okM02TI5pLyMt/zUkCWIBzv74PMJnbvDWir+L7CnA3Eks7VfDfZ5rHMZZI/5ABAj9uNjwTHokBxYdRskh/LObrR03JUbLZJTvo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fo6xglX9NPQGCP1uYDwseIsxs5Sej0rSdxOAtUzN+l88n+8mS3LV2v9RJ/bELAuJqqmG1WaAgptFxeXu4r/pcdj03Lam6rK3SyizsqkV9QYK+g9IODP8680jUeNP9Ny2XtZ7fjFvgbDZPem4m7X8g2iUP07T9Zvq1EwRws6UcApaXIO/8QZb1lwaXqDTUQIGrjQDSEYYbT59d9zgt6XygRbH4I9+/F6hIaMzywzyqt+8dHp+IFvCp3+dCk2rcqA8NSO6Be9CgaGQClEcG/4L6N9jU4PyXjDjQ53ALd9tgR+8gR++5K46poJWq82KShwOING2mZ9sjJGWZfKAKLgaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHeC7yao2e0KNT+Zv2ShcnlZtanRjcgGypJsMDNr1tA=;
 b=YlI9rQAQmB9tYlHTnes7Nbe4KdxifnR5ZhCBCeRtBz301qa6qaUZ216qpMKq8zR0k8pPJuUTrMFWvxuYUJi2hauvK3/8ncGJ0u6DK/+jfo7ozqgbDM/dY++vo+BtUKkzHbZAYfXzewoXxAdS8AdB3rRSO7GDkjrGwl4IS14LI9tvCNXT3My14102w4NFboOlzZS9xOZf5Gbj3UZcnUH8Bti9QVN5IlEku5ZESmzcir8NdS9ZjN9/X+pOHfENM9RwZdfKe+ZJIrgIPj4r+Zx8A8whpBbVr65GRIU/w+IfCbbEtMqx1MImIeET3QnC8DIdhM+Dg6QoO0N74NX2EPBsXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHeC7yao2e0KNT+Zv2ShcnlZtanRjcgGypJsMDNr1tA=;
 b=HfFgrx3Nrd2T0M7Pd1J4Depr3PKu/NHyxh5NPaMhzEcm68g95TzahZcCIqTb0t194FV+U5De3okM02TI5pLyMt/zUkCWIBzv74PMJnbvDWir+L7CnA3Eks7VfDfZ5rHMZZI/5ABAj9uNjwTHokBxYdRskh/LObrR03JUbLZJTvo=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Community Manager <community.manager@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 3/3] CHANGELOG: Start new "unstable" section
Thread-Topic: [PATCH v2 3/3] CHANGELOG: Start new "unstable" section
Thread-Index: AQHY+XPK/7/ExkLZf024jHMZJQ3zXq5BMvQAgAAAKHA=
Date: Wed, 16 Nov 2022 08:13:24 +0000
Message-ID:
 <AS8PR08MB7991F5EBB725ACCF8069711392079@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221116042634.50948-1-Henry.Wang@arm.com>
 <20221116042634.50948-4-Henry.Wang@arm.com>
 <42e76560-24ab-7830-5a24-a3366dfbba36@suse.com>
In-Reply-To: <42e76560-24ab-7830-5a24-a3366dfbba36@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F5DC703203C694468DCE0FC8808AF147.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VE1PR08MB5694:EE_|VI1EUR03FT065:EE_|AM9PR08MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c76834-d5ac-4fbe-7213-08dac7aa7492
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wQketwjAyN42Z+E9pFqw1wJ8gMBOLRpRo957xs/mZzTY/R5n7y2esSNABRpFysYi8uG+ciVS7+VUYgcbnZd1YH4Dt/Zm1OGibGpCEAyl/641lBn2OrGzkCW5jMzHvBkOOXWnDD1eZOF93orYQnOxe/D6GEAf4Joj3DrOBPdIMq38EpBGtoOHElyDdomC5ZoVpVPIfT9u3XMY86PRmjUvqD6hbFjERistID3RrfEPan58G7bnoXXrCK+H/PHglzhJIIpCLyguxoif8zaztlam7VC/Ec29/X0gx+LBUCkmKqaDtuHApOkR66Lr5Qg560H9kGIPcJyGwjICpZABkDWvx5kDzLJbuC5kdQSZ7iJNT45jJlI46ik7RNmqRnKAmMoJN+RachnPQ6Xl6TI9jGv8AOGVnQOjnGAIpYcM3Q76Q+1tFxnHVwlc0lJWkFQs4SywX19yj2zRn6oNxIRJCM3FRDFluauRlTNl2zjrRzebUXc9ZfZWlrUKvbLIcDZVtDYHA+BfGpEMkRrl0sBvpCsH3Ybts1f5F8RjxYysllTiTPqRbXzDMh3+mmEBxYvfYiXRvEgNHcpLryW/xg3Zw6Bg62AHQK+35b6wudtnkC6P9iQuf99uD+bmTF44PrVBN2m7FxKdfGrD6AMDCSXUCgZididmRBL3XNvfnNoX9Bb/q3mQiaxw9gtETe4Ka70WwXe/S2Ct7mVHXE7hKVNRwMTogq6h1VvBOGAj2s7mVwXo3mV/0ycSRhdvLHteWNViRMbbB8fgbvNzZdoqH/Fp2/XpN0ujQOBFm2pvm/2d92dfDEopLxot/IwgMpHzMe5zsghKcqHjgvlQ+Hluc+5pWWXd1Xjmw5mIjRGefchuggH5d3aU7wwd2d8+a7H/CYgvu93R4e92JTdzGdHoVJF6rjLyd9g38iyskAwx12VkKT90FIg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199015)(66946007)(5660300002)(316002)(54906003)(66476007)(8676002)(186003)(64756008)(76116006)(66556008)(66446008)(4326008)(6916009)(122000001)(38100700002)(38070700005)(83380400001)(41300700001)(52536014)(8936002)(4744005)(55016003)(86362001)(33656002)(2906002)(9686003)(7696005)(478600001)(26005)(71200400001)(6506007)(53546011)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5694
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	23b71367-4b7c-4457-8f25-08dac7aa6efe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8cAFJefiUE/u7iKCnsRMu5wDsiQDvKaKla2aUxEnGWuQ7SJsytvidveHBrxkVMOqx76Sh1OYcJeCGNQogGVt2NxMNEqdLvWdCVI7VFsb/dwsh4C4uKCP+xOa9oU+JY84BdoEXmTpKdQuGJc6x5VK/WXDBFLDLYIDMywvzqtk6SBJcxQdE9CStOYgufAzYqG2w79RV2Yl+KlWvll2yKtGdBcrUaHL/SvPi0GVJdJjQPW+ZsmahzWL6ZjX1btzkv8SRxNcAp+YQmCIeqSFEDX657pUZf1lSItGbLnKO6Rie9ml1sruhvyIgviio2l7UZkPqisi7W+igHyrlRPgRWQno8fRuEJtPADkSi//fgRl4L+QOclCqwAERK68yxZ9xSnxprPCfhkuTum9ZIviEO9K/pK4pptP+ynKOHrR1tNZxAfjWJvk/5cAVitYSWPjj2KzH5wt2wmP05/ye3cmXwgIPvf77qgNMWM+zyIOSlQ1mErhMmp4aaffHDhGp3NeIB6C+QJquTrXLRZETjWDXHSDVoY3o0Tj/58W6DVx2lKBH8fV3saqBrbqDsTSoroODYIhELL/TZIXQXhe+XNpqmSS7zyCLS/feS4SewsPLHyQ1WAhmDM1TQiXH3qpE9a/hU14eT8+WckLBOLZ5U48JuC1GMZxYkUmCfTdWAPxo0SN+2cETqrPsmL3a38r90LQgnFTVXJQZFCEkbOoCF3qzB0iiJ0PbE9bNyOnWUWuubiy3sITwIZYduO0pgmIO5Fu56Ku4bKgDJlB0tt1Bbc+G4rF4OcthcXoxjI6XNe3A3KyXFhVOjd5sDcKMjrqWRgn8Y6B6NBM0sGz+2fuh55Urr5ON3qhT9xXsUaFIxXIzDeiLbLuziDWe2htnaKyRI4HigS1kHsO6tDjQ55b9iLKiGBqMh3kFkCG3JBRrvmDFhdGk0Y=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(53546011)(7696005)(6506007)(55016003)(9686003)(26005)(86362001)(54906003)(40480700001)(478600001)(36860700001)(82310400005)(47076005)(82740400003)(81166007)(40460700003)(186003)(336012)(2906002)(356005)(83380400001)(33656002)(6862004)(4744005)(8936002)(316002)(41300700001)(8676002)(52536014)(70206006)(70586007)(4326008)(5660300002)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 08:13:33.9375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c76834-d5ac-4fbe-7213-08dac7aa7492
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6659

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAzLzNdIENI
QU5HRUxPRzogU3RhcnQgbmV3ICJ1bnN0YWJsZSIgc2VjdGlvbg0KPiANCj4gT24gMTYuMTEuMjAy
MiAwNToyNiwgSGVucnkgV2FuZyB3cm90ZToNCj4gPiAtLS0gYS9DSEFOR0VMT0cubWQNCj4gPiAr
KysgYi9DSEFOR0VMT0cubWQNCj4gPiBAQCAtNCw2ICs0LDggQEAgTm90YWJsZSBjaGFuZ2VzIHRv
IFhlbiB3aWxsIGJlIGRvY3VtZW50ZWQgaW4gdGhpcyBmaWxlLg0KPiA+DQo+ID4gIFRoZSBmb3Jt
YXQgaXMgYmFzZWQgb24gW0tlZXAgYQ0KPiBDaGFuZ2Vsb2ddKGh0dHBzOi8va2VlcGFjaGFuZ2Vs
b2cuY29tL2VuLzEuMC4wLykNCj4gPg0KPiA+ICsjIyBbdW5zdGFibGUNCj4gVU5SRUxFQVNFRF0o
aHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1zaG9ydGxvZztoPXN0
YWdpbg0KPiBnKSAtIFRCRA0KPiA+ICsNCj4gPiAgIyMNCj4gWzQuMTcuMF0oaHR0cHM6Ly94ZW5i
aXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1zaG9ydGxvZztoPXN0YWdpbmcpIC0NCj4g
MjAyMi0xMS0/Pw0KPiANCj4gU2luY2UgdGhlIGFkanVzdG1lbnQgdG8gdGhlIDQuMTcgZW50cnkg
aXMgKEkgZXhwZWN0KSBnb2luZyB0byBhcHBlYXIgb25seQ0KPiBhZnRlciBicmFuY2hpbmcsIGFu
ZCBoZW5jZSBwZXJoYXBzIG9ubHkgb24gdGhlIGJyYW5jaCwgd291bGRuJ3QgdGhpcw0KPiBhZGRp
dGlvbiBvZiBhIG5ldyAidW5zdGFibGUiIGVudHJ5IGJlIHRoZSByaWdodCB0aW1lIHRvIGFsc28g
YWRqdXN0IHRoZQ0KPiA0LjE3IGVudHJ5Pw0KDQpPaCwgeWVzIHRoaXMgaXMgYSB2ZXJ5IGdvb2Qg
cG9pbnQgLSB0aGFuayB5b3UuIEkgd2lsbCBmaXggdGhhdCBpbiB2MyBvZiB0aGlzIHBhdGNoLg0K
DQpLaW5kIHJlZ2FyZHMsDQpIZW5yeSANCg0KPiANCj4gSmFuDQo=

