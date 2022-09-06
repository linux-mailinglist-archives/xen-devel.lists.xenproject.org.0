Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E975AF704
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400151.641813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHv-0000hi-LG; Tue, 06 Sep 2022 21:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400151.641813; Tue, 06 Sep 2022 21:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHv-0000dQ-8w; Tue, 06 Sep 2022 21:39:19 +0000
Received: by outflank-mailman (input) for mailman id 400151;
 Tue, 06 Sep 2022 21:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nuBZ=ZJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVgH2-0000Cs-3O
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:24 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20068.outbound.protection.outlook.com [40.107.2.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9e51f6b-2dca-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 12:00:51 +0200 (CEST)
Received: from AS8PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:20b:312::33)
 by DBBPR08MB6137.eurprd08.prod.outlook.com (2603:10a6:10:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Tue, 6 Sep
 2022 10:00:50 +0000
Received: from AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::fe) by AS8PR04CA0058.outlook.office365.com
 (2603:10a6:20b:312::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Tue, 6 Sep 2022 10:00:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT055.mail.protection.outlook.com (100.127.141.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 10:00:50 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Tue, 06 Sep 2022 10:00:50 +0000
Received: from c34f0b802c65.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 86102521-4DD4-4D27-86DC-C7CAD9EE89B1.1; 
 Tue, 06 Sep 2022 10:00:38 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c34f0b802c65.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 10:00:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB8147.eurprd08.prod.outlook.com (2603:10a6:150:7b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 10:00:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 10:00:36 +0000
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
X-Inumbo-ID: c9e51f6b-2dca-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gyxy1pwlk6grGTE7fEwGTkvcXZWJQBlwmhnm5JsC3YsZDI1zmvKN4cZ/MR1yTEcDMYIHkgIc08LuENX0yiTnF+LR/LnYsE4D7etd2hG9T0sbaZJn7T1z1MXzaOITd3cjTRNistifXWMX7p6nbvgCi0eDykrN/rvy2xrtCEKF9nLkmxDvE3Xanrw7agJNEqI8RSFEtG/IlvuQOIdlQY0U6sjrvl8GPOFrOib9E1h7uJi4ti6A3qCDGZAP8e0MMmEdSB3s6Poo7/R1xxsxoFGFEzdynx5cQOENbfHMCG2ZJh4yzImqybGaSwMcE/ruK7f1/RG3mGeIJ+Syn4o9448jkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqXOBE/4K+xmcwfQerBOpcHweArZqwBUheZmGKsYVuE=;
 b=Hw2fFRaheSvaacXDRYAVf5ERV9AH7KlAIYgB5bZQL0v/Gftbe/0PdBMTfFuAGIPMKqP4luQILp3r3K3Te6kcNukq1drVYVx7CF03cYnb9BGOMGWaQ4qeadyKqN+0ezIznIVhrwEH4/5SwMqF0TDavOJy7bXVHFVTpMQZ0HEMoqHXjwyuqkgt7JaajjNMhrjWbKm0/EW6rSduJwJZbSm5JVumrxJflWhFD6/gr65fYa1pFxzl6H2Jo9uDru4karOfMLb0YGR3/WwK+yR73jVPGGfI8TYL1QtlkJq7V7FhjlcVTdXuw/z0M/d+3Hkfa6t33Fb4QIkp6IBhy0+hNhVaxg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqXOBE/4K+xmcwfQerBOpcHweArZqwBUheZmGKsYVuE=;
 b=Sah+39erY/rmspJu/NKkh+8XlezaOhe2H3TNtOvTYpgNiclnsASKqMwF3K8f3G3OOK/btIIZlUM/HWTjOuz6PwzYJWMWZ00WpHGHlfrgUDZJLVLC8Z5vNoydRejGgX+JS9lNYMoc2BEi/qllssABhfR7QM62BM0DQC63aDBAIso=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9314e1500273893b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD14zzNVcO2rdA7jO9MdUyAFRtiYlKfesBpdFtnUtqhlR+6A2FrmjrEXQSqdI6CKPHOJ7c/TpVYMk9WFpi9BvhP/62VQmHRomjpnC1cuYe2oSVjAaxmtw71x9q8CckaPPIcbwlAp5RVUBWrX2WRZZ5+8ekUY3Kw4dq/BIyVeLhMPVakf7EDEjtXzWAiWbN41lOilkeFVyB44T6EqxvVyvkvzBgat2TWOA9X7TdlVr3xyRv6Z3X2HxHFblCEkUajJfaGy25VdXhj1KNJnDl6DSYecu7Bnxw12hpB0S9bsJwM21teWBEvSygYi7gWcmQY3CxR5Tmp8p739MM7YzeC1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqXOBE/4K+xmcwfQerBOpcHweArZqwBUheZmGKsYVuE=;
 b=WkwK9fe+Lx1E7mr1e0yRqTuDng80KYjl8FgpK4wPrL7mlfpgruJRQ/Ec14AnS1yT9imbfFK1NI/t3qyYqgDIV+vHniGP5VojA/kHk7pqHxe9nzOIqw0o77ehP/LlPg+2IIQTJVkSINZABUuvsL5z5o/Akiw0simiuCPCbbwWXG7/OO37ACVBw7967KQc8IKvsXXzxvgxZwtnWTecmEou3ClNaWl0w0CxvHCaUu20YRsyYJWFWYFNMulrbnBFmhpa8CgEbK9uE0sSU9Ox/L0hin0eDvyrIA8z4HieYsKD8bZm8YUpiLfa6ESUYqdtCWAlk+nNIBjzMCL1uN3Zbph+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqXOBE/4K+xmcwfQerBOpcHweArZqwBUheZmGKsYVuE=;
 b=Sah+39erY/rmspJu/NKkh+8XlezaOhe2H3TNtOvTYpgNiclnsASKqMwF3K8f3G3OOK/btIIZlUM/HWTjOuz6PwzYJWMWZ00WpHGHlfrgUDZJLVLC8Z5vNoydRejGgX+JS9lNYMoc2BEi/qllssABhfR7QM62BM0DQC63aDBAIso=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index:
 AQHYveOAeMLlOwX5Mka7ZrpAabJW7K3K4ewAgAFZKACAAAQoAIAADY8AgAAHN4CABGESgIAACJcAgAADEoCAAAPFgIAADnWAgAAKUACAAJguAIAAkgwAgAAIbYCAACNQAA==
Date: Tue, 6 Sep 2022 10:00:36 +0000
Message-ID: <FD23C91D-21DE-4E03-87DA-31BC33F6BBC4@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
 <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
 <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
 <46897765-5063-49CE-8A8A-F4DA50570A08@arm.com>
 <a669182c-dab1-35b7-9bf7-caac1813e3ad@xen.org>
 <C27FD0DE-D8FA-4A67-AE0B-DF4030A65127@arm.com>
 <a14b4d4a-5ae6-4af0-2d00-49bbc688cd4a@xen.org>
 <6B0D4F4B-C7CC-4C04-9BA4-71976CAA82C5@arm.com>
 <cf2872c6-23e3-ced4-d7c5-2a5e6ade98ad@xen.org>
 <1874D575-E3B3-4221-925F-AF71D3EF0289@arm.com>
 <EBF5412F-F932-4D25-A2E3-9F53D59ABBCC@arm.com>
 <alpine.DEB.2.22.394.2209051530250.3931@ubuntu-linux-20-04-desktop>
 <D1317300-F801-47B6-B54A-E0788F6477EF@arm.com>
 <7bf75eba-f5c5-6c63-5c45-10c5d2d20254@xen.org>
In-Reply-To: <7bf75eba-f5c5-6c63-5c45-10c5d2d20254@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d021253b-f14d-49b1-3867-08da8feeadaf
x-ms-traffictypediagnostic:
	GV2PR08MB8147:EE_|AM7EUR03FT055:EE_|DBBPR08MB6137:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KEa5/bUP2BNzMru+WDIK8eZoXfJcWr0Uf/lbyILSfSZ4ij82JLGsgVf/1De2gNzTbVQg0evEY8fhz0mRqgX3VIjeWdPEb9l8sJArl9r45EEgm150iPtwrjZi7VGFPSC4A7kIHlX86i2ogyE6n822+qaUhsiRqUy1t82nw7Ln3/afud8gJDpvxuuhwh5SWbjGKOC+RgEGAivmIKRlFNw7hERhiGLTz2OA++6TPAr3/pIdTyvnWO0WhKBw91aIz1ca+djL4N1KyUfIPBkO4ygYr/LdPhEbTD8/kSWhmcEfheG6SWoZ+uZU1csut1q/p+SAtebW1wmWxRE9rnlO3/dXsPmOP7GRwiCh6StyFxUucH0KQ5R/8HbzGGVU+bR4AHcgx+XksAZXG0QAu3i8iLItS/ynzBsI/nCXSwhre6nnrjIf1HGK+8PnHY1A5JbTlL3HNSiEkzchwOml2ymyG3wl95AUEfOSZYtOsPLmBmUf4A1K9P4MkSH5TRJxHvX9Voik2qZ4Dx187jItTuS1o/xCumjcMBJ7Dnvw6RMUcWWVeLjuVee5d1lhcJ3N0o6R4uRT9zzqvRGx+9GlJEvs13z/KFUGPB4PMKfgPcpZ/WDBaJK5Z419p6M6plHt2Xdgdfflxjs0I8GM3/aYIt8dtYoISnmsXlLDmvf4nLr8N5kHN4M3Ny8J0+0pEOokWu1BuOPTfxacTk9njSE9TeL3/f1TeDorInmVWXM21Qy5JxO7QQilLB2xem5s/w+IGZzKcJewTTMmD/qw/UwtkitG6JRwUthRCfV42qnkgQUUvwPvGos=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(54906003)(2616005)(83380400001)(186003)(6512007)(2906002)(5660300002)(53546011)(41300700001)(6506007)(86362001)(33656002)(36756003)(26005)(71200400001)(8936002)(6486002)(478600001)(38070700005)(38100700002)(122000001)(66946007)(91956017)(76116006)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(316002)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <57B67C3FF5FD454981B6E3F11F87FD0A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8147
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ccaf6b2b-190c-43d6-ca85-08da8feea557
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WR7oZitfuctMzNUxv6nJJbvQwrnir/vFWjeCrneJ5hB4I38f71FCkpaxL22WGZ6QTbmDJQEhv9vDU5rU7iV/a4XG6MdccnKRiGWW38vlkzMjPzELR/OON3EQtXzCHsZ8p/DQxahKrJ0b2mJZUjPP8a4r/7KlbMiEy7tqn3EL4PuiqHR2v+2rkEHSFJb3HoY9hFKJVFGwUNiNrNFN2WFavosuJFcBa8bbT6meGUQITa69KOev9/rAdJHHUKV9f4lNl3k539izKmj21CS1FT+xzdXuOBvYl2WyFqFhIw/+2FNUcltNKJqLAWJOHxu0ZBOH/J3+i+WqWVhk3okrfG6TbPGyBWQKK1RMqAWc91AIQmtmO++ClxPBIFl9QYpsJBkARqXWc6FSdifyiHlN/hEVGNVmdGxHDWTnh+jhK97HVl15uziLfTuw2QraAqyL0neozX5UNMV2OxnPvR+SsG+lUKBG8SUCQS9VEATr9BKPKYOVKWH0g2qhrPUEA/VEOdTRftcv8Ux86sJ5pow1gxHPTXxLFi5kB7JjVdP0VcmqCe4ieMmPcuZcF5Cirimqq6wlYbP+Q7nLyfqXqrBQ9RJCbkxuQJ0G//PaStPWkzMkA7gWY93NSbYYfozb7qYzaHtTatzhW1pk4PLHofs7njWPR+TEodHsaxzTfVFyrbupOxAHVBGNecTbNccT6yKUpLKUrNEiRVF6VCCpL+hUlhtNee+0A+QzW0SFG6HLigExbuZJ+i8LdsvF5xELFd36YTgFYSRkYOBg/zFr4Oo7NuLY/w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966006)(36840700001)(40470700004)(82310400005)(47076005)(186003)(2616005)(336012)(107886003)(478600001)(40480700001)(6512007)(6486002)(26005)(41300700001)(86362001)(6506007)(53546011)(81166007)(82740400003)(40460700003)(356005)(316002)(36860700001)(5660300002)(83380400001)(54906003)(33656002)(8936002)(4326008)(8676002)(6862004)(2906002)(70586007)(36756003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 10:00:50.4651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d021253b-f14d-49b1-3867-08da8feeadaf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6137

SGksDQoNCj4gT24gNiBTZXAgMjAyMiwgYXQgMDg6NTQsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgQmVydHJhbmQsDQo+IA0KPiBPbiAwNi8wOS8yMDIyIDA4
OjI0LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+IEkgYWdyZWUgd2l0aCBKdWxpZW46IEkg
cHJlZmVyIHRoaXMgcHJvcG9zYWwgY29tcGFyZWQgdG8gdGhlIGVhcmxpZXIgb25lDQo+Pj4gYnkg
QmVydHJhbmQgYW5kIFJhaHVsIGJlY2F1c2UgSSB0aGluayBpdCBpcyBhIGxvdCBjbGVhcmVyIGFu
ZCAiRU5IQU5DRUQiDQo+Pj4gc2hvdWxkIG1lYW4gZXZlcnl0aGluZy4gQWxzbywgaXQgbWFrZXMg
aXQgZWFzaWVyIGZyb20gYSBjb21wYXRpYmlsaXR5DQo+Pj4gcGVyc3BlY3RpdmUgYmVjYXVzZSBp
dCBtYXRjaGVzIHRoZSBjdXJyZW50IGRlZmluaXRpb24uDQo+Pj4gDQo+Pj4gQnV0IEkgYWxzbyBh
Z3JlZSB3aXRoIEJlcnRyYW5kIHRoYXQgIkJBU0lDIiBkb2Vzbid0IHNvdW5kIG5pY2UuIEkgdGhp
bmsNCj4+PiB3ZSBzaG91bGQga2VlcCAiRE9NMExFU1NfRU5IQU5DRUQiIGFuZCAiRE9NMExFU1Nf
WEVOU1RPUkUiIGFzIHN1Z2dlc3RlZA0KPj4+IGhlcmUsIGJ1dCByZXBsYWNlICJET00wTEVTU19F
TkhBTkNFRF9CQVNJQyIgd2l0aCBzb21ldGhpbmcgYmV0dGVyLiBTb21lDQo+Pj4gaWRlYXM6DQo+
Pj4gDQo+Pj4gLSBET00wTEVTU19FTkhBTkNFRF9MSU1JVEVEDQo+Pj4gLSBET00wTEVTU19FTkhB
TkNFRF9NSU5JDQo+PiBQZXJzb25hbGx5IEkgZG8gbm90IGZpbmQgdGhvc2UgbW9yZSBjbGVhciB0
aGVuIEJBU0lDDQo+Pj4gLSBET00wTEVTU19FTkhBTkNFRF9OT19YUw0KPj4gVGhpcyBoYXMgdGhl
IHByb2JsZW0gdG8gYmUgdHJ1ZSBub3cgYnV0IHdvdWxkIG5lZWQgcmVuYW1pbmcgaWYgd2UgaW50
cm9kdWNlIGEgZGVmaW5pdGlvbiBmb3IgYW4gb3RoZXIgYml0Lg0KPiANCj4gSW50ZXJuYWwgcmVu
YW1pbmcgaXMgbm90IGEgcHJvYmxlbS4NCg0KVGhlbiBsZXTigJlzIGdvIGZvciB0aGlzLg0KDQpD
aGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+Pj4gLSBET00wTEVTU19FTkhBTkNFRF9HTlRfRVZUQ0hO
DQo+PiBJIHdvdWxkIHZvdGUgZm9yIHRoaXMgb25lIGFzIGl0IGV4cGxpY2l0bHkgc3RhdGUgd2hh
dCBpcyBpbiBzbyB0aGUgYml0c2V0IHN5c3RlbSBpcyBldmVuIG1vcmUgbWVhbmluZ2Z1bC4NCj4g
DQo+IFRoaXMgd291bGQgYmUgZmluZSBpZiB0aGUgZmxhZyB3ZXJlIGRvaW5nIHdoYXQgaXQgaXMg
c3VwcG9zZWQgdG8gZG8gKGkuZSBlbmFibGUgZ3JhbnQtdGFibGUgYW5kIGV2ZW50LWNoYW5uZWwg
b25seSkuIEhvd2V2ZXIsIHNvIGZhciwgaXQgd2lsbCBleHBvc2UgYW55IFhlbiBmZWF0dXJlcyBi
dXQgWGVuc3RvcmUuIFNvIG9mIHRoZSBmZWF0dXJlcyBhcmUgc3RyaWN0bHkgbm90IG5lY2Vzc2Fy
eSBmb3IgdGhlIGdyYW50LXRhYmxlL2V2ZW50LWNoYW5uZWwgc3VwcG9ydCAoZS5nLiBiYWxsb29u
aW5nIGZhY2lsaXRpZXMsIHJ1bnN0YXRlLi4uKS4NCj4gDQo+IFRoZSBuYW1lIHdvdWxkIGFsc28g
cmVhbGx5IGNvbmZ1c2luZyBpbiB0aGUgZGVmaW5pdGlvbiBvZiBFTkhBTkNFRCAoWEVOU1RPUkUg
fCBHTlRfRVZUQ0hOKS4gRG9lcyB0aGlzIG1lYW4gdGhlIGRvbWFpbiBjYW5ub3QgdXNlIHRoZSBy
dW5zdGF0ZT8NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCj4gDQoN
Cg==

