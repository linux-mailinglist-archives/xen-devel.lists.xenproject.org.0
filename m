Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BB610C83
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 10:55:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431798.684383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooL90-0008G3-RC; Fri, 28 Oct 2022 08:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431798.684383; Fri, 28 Oct 2022 08:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooL90-0008DF-OG; Fri, 28 Oct 2022 08:55:14 +0000
Received: by outflank-mailman (input) for mailman id 431798;
 Fri, 28 Oct 2022 08:55:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqEQ=25=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ooL8z-0008D9-Ov
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 08:55:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bf5b247-569e-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 10:55:13 +0200 (CEST)
Received: from AS8PR04CA0090.eurprd04.prod.outlook.com (2603:10a6:20b:313::35)
 by AS8PR08MB6038.eurprd08.prod.outlook.com (2603:10a6:20b:23f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Fri, 28 Oct
 2022 08:55:07 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::9a) by AS8PR04CA0090.outlook.office365.com
 (2603:10a6:20b:313::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23 via Frontend
 Transport; Fri, 28 Oct 2022 08:55:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 08:55:07 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Fri, 28 Oct 2022 08:55:07 +0000
Received: from e28632f11c9f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9301F328-BFFD-42BE-9992-213F0A2300DE.1; 
 Fri, 28 Oct 2022 08:55:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e28632f11c9f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Oct 2022 08:55:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8252.eurprd08.prod.outlook.com (2603:10a6:20b:53c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 08:54:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5769.014; Fri, 28 Oct 2022
 08:54:58 +0000
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
X-Inumbo-ID: 3bf5b247-569e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TqkW9XW1VP1Ttm3hv6OU7lreqBhJsyxyQKVj3BpEi4I2Tm9nig9O2nMo3ohL1ZwdZNJ0QCnjG9UujvOA6skf2e/Z/TI5JT80y3368KpTp/EZpMeCjcIesmJ6QcSGLLUZ8d1aFRZGqKpC7agfOx7pMECA0QsRQ4T60AuZyq1ZsHjRNePWZfoZexQCp3yU5ROoAuOMJwGgqlHzdd9w7c4dgrd7cMDbbEdb8a/R8MDfL9KMVG9g/hTodaH5HR3sq2LGP3IZ9clHJmG3Oba3NJIDXpskCWkuV05uQTcQpjqbAgYFa2Z7LgtB8TJJ2dwFsTZkUhBAuM03LRhwzBf1dN/kxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2dt6MnFf+F1uP31ARA4eip6dwxpSBhrJnRCvCW9atA=;
 b=WN0HrPiUndwUKzVGK0GMwKHOhwK1fZE47L9OwZPWnyDfnTFj9f7xSz8pJH1WzXlVGDGQpYHByp0rMnv+dMGySjlPpUqVeDOaO/i3w30f6wosJneuIFy77wGq460CNLSSu0yk22UpdNGRe8UK7Lkh6Wifsoh1SgqUTJYLMeaWdkFhY4U+Xwtu0B1kIic9lqyiHWX8SPyTP+uiKhsu/nLSwomhzFkHg8z3PBoYp3dAU418dgHzUDnZIJxnM7w5uGm0CxSYx4Q5sEoTakegyoO79DS46D7d/1c6Yg7nU3jTVc7bYspB/8BPTAExH+87/+voTUsEHY7WNccnHtK5lOyjFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2dt6MnFf+F1uP31ARA4eip6dwxpSBhrJnRCvCW9atA=;
 b=cdycyMiKFpFeRa9EEpM9KlRScNtaf1c0NTjNYrYofdnovMiJslBA9SCfUZQUcR96Ew+pInAM07bn8r1ZANc9lpyLAI/T0mMvgfiifcDm9Dtkw2d76QSfse05CALkh77bn0FXreA4xRoqLmEvKbmuW9valCYE53VjfidTyd2USJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 974b8ea45292e7ae
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAk/CDKyeqkBCdYfsPPj2sGU6alrrpeeTro+2smbIMRAjlES/yMiF6q3uqrjIxU+xfxCopf+W4OyzKnDSysX7NZM4WYMj/j57rMlFYTdGV0Xh7YJbyPC+m1UI1IqkjUuNXUyOSc3vrRYVSMVCw84JDVlsLOc5ZZ3umEJsPhXlZaahQTXNFBY5Bh7bRYQr4kL3NpTezrBUOOOzbHjd7FXUgzhepdajCkJf14vqL26EmYs4doB5LMAJ25i5Tsb1INhui6acTMylDXmYyhUaSdbqQKDQX5LnvmMDT0p1XS+WgKhXvjXeunyndFlta0XdL6Yd+BmHWn03bdrjoDntz8ozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2dt6MnFf+F1uP31ARA4eip6dwxpSBhrJnRCvCW9atA=;
 b=kpFrVgO40CFXtFfotGDu6bxaYNF2Bh5u/eZ2Aq//US6NJqp6fnIk+axibpKbOY/YTvHRHmItNtnZangbCy2HbgBeP4jn2vzFeYItH8UuqGjOGbV3zNW7Lju7+Usnrn60K9ZnDPfiy24NJM2FSMJpFk88qZMzoKzKQOaMIiBylVgNjnnQ+2n0QGp8wl+lXTcCVkd1kTUYHZhUQNAwuMztlMYIgDoIP/iTaDF/QZ6EYHQv7+0DpdIdyBlSfcEK+LPmDJrLKlEw/CbpvvKgKAsvwf7BL6pbewZW/3meuYQatnmjbU9keY7vtKtgpKFUQeYN6Q+niyOV/qrdEAcqP+3jew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2dt6MnFf+F1uP31ARA4eip6dwxpSBhrJnRCvCW9atA=;
 b=cdycyMiKFpFeRa9EEpM9KlRScNtaf1c0NTjNYrYofdnovMiJslBA9SCfUZQUcR96Ew+pInAM07bn8r1ZANc9lpyLAI/T0mMvgfiifcDm9Dtkw2d76QSfse05CALkh77bn0FXreA4xRoqLmEvKbmuW9valCYE53VjfidTyd2USJo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "stefanos@xilinx.com" <stefanos@xilinx.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Andre Przywara <Andre.Przywara@arm.com>, Henry
 Wang <Henry.Wang@arm.com>
Subject: Re: [XEN v1] xen/arm: vGICv3: Restore the interrupt state correctly
Thread-Topic: [XEN v1] xen/arm: vGICv3: Restore the interrupt state correctly
Thread-Index: AQHY6jesKd0lAUK8nUWE7dUi6/OJ1K4jgXoA
Date: Fri, 28 Oct 2022 08:54:58 +0000
Message-ID: <6A9AEAA2-F954-4308-8A28-846B696EBC94@arm.com>
References: <20221027190913.65413-1-ayankuma@amd.com>
In-Reply-To: <20221027190913.65413-1-ayankuma@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8252:EE_|AM7EUR03FT046:EE_|AS8PR08MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: 84df9b8d-0d48-4710-7ef4-08dab8c21cfa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EkuoVFFLOnzdeZ4IvgN3ueslsbNSiETBN+Pnfzk+kusfcidSQ+NIebdAwSCwtIJPOkFS/yVFHddE5TgPgBsVDX3IlgxO+EHX1/FOotJUy96Jk7PPHdC1lbYieewdEpQLdFiY6pjgWxbfikm6Yl0cvHKwLbljvq07iH8aE2xfmRfvngHXqPFyrYQEwgM95bTZQr3oIssM9OCq2Q42LXll6uYEf90dGcQVwyTufujFQ7bDwPNy31t1MSfi80kJ/7+QxtJTf8XgiVvo8e2iap/F5H6oWM8sEMOvPTKrcm2ccqvN2s5vOpc620Z2mXvXzznM+HyZO1ZLHF6HmtVRrs/H+fCFAuTGllBmfDZwA5r2wh3MW0Ea/SuhwhL4gDUAnGZfA4tj9YDgf0nZG7OQS4nxoLlmjQosIA9JMVey1eKCNrN+MPxzf3fzIeBbI/QYBXgq0V/ZwbBHGkZOObGMc/K1u5Fs7bj/6hURxjl+Hzztd6dXY3slwKhqxm7XtKYbkiPBuTtzczOERVvycztyfhsVJizsiJarTv8lHP1FPZI9pAa7fPCx/ECCKCz8kw9E40zyOMwHMir0d7/y8f03jn0po4KGjhgWQuW/1cceU/jj1XKLaZOjT3IX/A7XUM94CnScGHBezhiS6kwGZlTkOFAvSEk4dV6EgleYdwr3ylGYyLDpJckM6UfLk1qjZOiNhF4WnTuhDZeEje0jiEUDNeAsdKv6CO8hnZX1BOcpD6NiqsCfrs5bi7yRHBeWGJfVzwdp3qclC7cMuj8FXYZZ74eVwcv3jko7F2z8YUFliQLXOn4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199015)(6486002)(91956017)(2906002)(71200400001)(83380400001)(6512007)(186003)(26005)(2616005)(478600001)(36756003)(53546011)(6506007)(41300700001)(33656002)(54906003)(8936002)(86362001)(38070700005)(8676002)(4326008)(66476007)(316002)(66556008)(66946007)(122000001)(66446008)(76116006)(64756008)(38100700002)(5660300002)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2BBC15573182614BA56ADCDE0DEE082D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8252
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14a4b5e1-d6b8-46b1-1d8d-08dab8c21785
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kfgfwm0mKHmfogrE4AmcIs7THEN33ZwiXsgGd4V43SWN4SdxnqWqy0mEeG0S+XVC7dn7uZqj/u516Lm1M1STx09XGlK3KSaYTYfwoXBvvfh40TczIpthpn5ZIJGhj52jwOf0TYDzQ5Gib5gtUlCbt0Oq3XTpjcQVJx3Z3fu1p+a4bbE+dTbI1IZthZ9ixvBpMJqyyweRwdujkQEV4IqIAHhGN3af444JqNnPiSC5hSz1uqCNJeF4pICvMKNjQGkfVQn0tRQ1M41NKm/ErRTStQGftSV7zR/yGo4boxHxX/PNVKhaMPTMiokfD39w1P/NG4k1bJGW4iH5oWWGAFaMdsqt95LYbStw23dnZQ7ANkJpJAx0GDWcyayeuLDWS7dZj7NL1yJGJLfhHCniPGnJYXoOpNjD5aT5lQMj5a5l5F+LXSFdWGuw8KpciOLR4FFmN0cpICVdbjCxtmTan0RBF98UkOavBfeivw1hYs7dhyYTuesgISf+N3KZPreZmjGEl/Alz1oJSUxzzXiINxl3k5b022NjK0yr+jfPduoku4GKE4Eu/UkfsoLemqHptMciLqM6RQXxowzkLxre47X62XjhU036crJVzVWsrt83BuXd3YIxBIiycpiBzD4m2rsZDLvE8eBSYBm7SfUAt6jp15e1toS05H1Am+2M+BYCKiYfxrUzo/X9jbu4i/HBrIrwgHjsZ6vmzEI7Xq3bIOpY0U+UneeNGh7EZpk6Ulv5f0bLTXkwUdBt7LFHvBu0miYgH9x8DY3vtj3OdN1mWVF2kA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(6486002)(478600001)(6506007)(8936002)(83380400001)(2616005)(186003)(26005)(54906003)(336012)(40460700003)(41300700001)(36756003)(5660300002)(86362001)(53546011)(47076005)(356005)(316002)(6512007)(2906002)(81166007)(82310400005)(36860700001)(82740400003)(40480700001)(33656002)(8676002)(6862004)(4326008)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 08:55:07.5066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84df9b8d-0d48-4710-7ef4-08dab8c21cfa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6038

Hi Ayan,

> On 27 Oct 2022, at 20:09, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> As "spin_lock_irqsave(&v->arch.vgic.lock, flags)" saves the current inter=
rupt
> state in "flags", "spin_unlock_irqrestore(&v->arch.vgic.lock, flags)" sho=
uld be
> used to restore the saved interrupt state.
>=20
> Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and pr=
operty tables")
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

This is definitely a bug fix candidate for 4.17 !!

Cheers
Bertrand

> ---
> xen/arch/arm/vgic-v3.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index d0e265634e..015446be17 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -582,7 +582,7 @@ static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu=
 *v, mmio_info_t *info,
>             write_atomic(&v->arch.vgic.rdist_pendbase, reg);
>         }
>=20
> -        spin_unlock_irqrestore(&v->arch.vgic.lock, false);
> +        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
>=20
>         return 1;
>     }
> --=20
> 2.17.1
>=20


