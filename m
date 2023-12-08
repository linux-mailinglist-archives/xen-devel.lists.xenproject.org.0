Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F6F809EBB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650442.1015964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWm9-0003kc-2d; Fri, 08 Dec 2023 09:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650442.1015964; Fri, 08 Dec 2023 09:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWm8-0003hu-Vw; Fri, 08 Dec 2023 09:04:00 +0000
Received: by outflank-mailman (input) for mailman id 650442;
 Fri, 08 Dec 2023 09:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrto=HT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rBWm7-0003ho-Fe
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:03:59 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c6f853-95a8-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 10:03:58 +0100 (CET)
Received: from DB3PR06CA0003.eurprd06.prod.outlook.com (2603:10a6:8:1::16) by
 GV1PR08MB7826.eurprd08.prod.outlook.com (2603:10a6:150:5a::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.27; Fri, 8 Dec 2023 09:03:53 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::a5) by DB3PR06CA0003.outlook.office365.com
 (2603:10a6:8:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27 via Frontend
 Transport; Fri, 8 Dec 2023 09:03:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.45) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.23 via Frontend Transport; Fri, 8 Dec 2023 09:03:53 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Fri, 08 Dec 2023 09:03:52 +0000
Received: from ced7b3041b91.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FF795892-5ED9-4BF1-8AA5-166BB1A5DCF1.1; 
 Fri, 08 Dec 2023 09:03:46 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ced7b3041b91.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 09:03:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB8083.eurprd08.prod.outlook.com (2603:10a6:150:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 09:03:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a045:911e:2349:3d8b]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a045:911e:2349:3d8b%6]) with mapi id 15.20.7068.025; Fri, 8 Dec 2023
 09:03:43 +0000
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
X-Inumbo-ID: b8c6f853-95a8-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jtk1ZCsfWYCtAgBXberhqRQVCHoX8Xd3FzjbP1zTEJlhDZTU2+DkMqUQR30IazxFvSbZqTiEi5sdZhcB8ZfimvqhcTQim+hwcv4yzWN9fdGE0VSI6Fas75Yk24zdeHnqfzeLq3609G3YlLBneMRW7ib8VQSgBVwclbstQhJJLx2D8jbxNQwCMMyclIFk4F4H6qweF/y3ky/hkAoAxbNXFUgQphOxA1icHexFb0/EDgKecyCSJZai9y+PqfZCs3B3iLqk4iMnJV+EUTDoEjwnIAA5eDTDNQrEsDOB6CMYsdoJNXXDVRqxxKmmnhMINvP7jC0guiY4R0gysKgM54JEeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPTzovDdluwKsIWWrxnQRvgGmk5L+tN9q7m3PFw0eIc=;
 b=heUO+x9VCn1rXTKMZ5WuH0/maaMeNeo7++lezYTM4kFj+nGbL+jW567rIGcpyxIZRIaYJHoY4M5O/+USrB4ZL7zF4QfaZmicKXmmfMk0cdaYStj97T38PO+oRGkFB6BEpTmopVOm007QMbogRLBky8JRf1zG7um6CgeE4MPeeGz61jZBPxibCPOvrnrXhXjGqNUD1x0Y3u2GGiStZE06cD0WxARmpkQZRHErwPrLKQmdeLzW+czMqnhFBfDirZKhTHYKJbG2uSQqS6dUL97GxBxnsfAJ6Pp9s93e37Fq0jW85k1TFjQbSlaXS60tqUfCQjQV6bMoVC9JITkU+J/CBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPTzovDdluwKsIWWrxnQRvgGmk5L+tN9q7m3PFw0eIc=;
 b=6YMxfScHdXlaFdGIWzMdQ6Bvj2c/vdR4Ol+ABFXbZYOomiaZPdC4UuV9vnp0+ipZOtlPCgEB8R20r88GuLoKM3BdiBRwjs1hi9riCA/NTeTa3VQiOaXI6IN+wUKaR7PQM4HLKSEvLSkpgKJI33e8Iuv68ATpbDWIeo1WBUazIPk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e84f0845efe72a2c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJAfzmNqDPwUKqp9uGaMrcIr4dX7oUyIrWSwbHC09xHLlkYcdWV4nFOP4TxsBjjAPOtuI5epceOuw5rVrr6NwEf30KYTN+XUkBIoIveviATMYf98yFc8pLgoJjzlbXVFMgbv9dFB3PDJmUlZhc6DjXoFVyd58Hy8bLCL0rL4yzsKCJoGXwObNcDqz6cxm9W9eK09MdLfNMCfmy9ZJGdFBv8tzLmUXtXRkzsk2PKifYVgJTQ8CeKntuIq57o1CR++regSz/vcu8iAXTH3siv21tYSfgEZqem3SmxYopKZb1NFbbdo9iL5pX17BtsWqvGTvqmzKL3Bz3GoI5VLt4YqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPTzovDdluwKsIWWrxnQRvgGmk5L+tN9q7m3PFw0eIc=;
 b=QUzYOt9z90f5ckBvPUTnmBhKVMkN9AIJE16dXtRKQoenMyMaDN2MYKn03fcMK3U1wyTrqUR9BddjRh6PxAYqocki2ph5V3jgIjXVuos7N9VQp+mUSWhlkxWGD9sCT2gWxJBfj4tdM+qoiNfVhsZOgL7S7YoLB/HSaGGpFggeEA1cAnKV1qN1YIf3ISpgOsoVyEmWKk0Hk9Hw7aKew1BxrC4mKGpBJyNRLTkvwgxyaqpSuisVwHczAaE3+G9ZcJnTgCWq4JTyw+XbIqB5VoGoXJ8mcHWF7pLUK5jp+rI+HZeuYhS4oeMsxmC0S37kZh0NpTlrFWgi/mCjpRsACHLS8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPTzovDdluwKsIWWrxnQRvgGmk5L+tN9q7m3PFw0eIc=;
 b=6YMxfScHdXlaFdGIWzMdQ6Bvj2c/vdR4Ol+ABFXbZYOomiaZPdC4UuV9vnp0+ipZOtlPCgEB8R20r88GuLoKM3BdiBRwjs1hi9riCA/NTeTa3VQiOaXI6IN+wUKaR7PQM4HLKSEvLSkpgKJI33e8Iuv68ATpbDWIeo1WBUazIPk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Ayan Kumar Halder <ayankuma@amd.com>,
	Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "stefano.stabellini@amd.com"
	<stefano.stabellini@amd.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
Thread-Topic: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer
 Registers
Thread-Index:
 AQHaJIdEbUtN3QkqgUmgAoK4VfjZW7CY8R0AgAAqKQCAAHNEgIAA4yoAgAAJTgCAAAgBgIAAA4YAgAAFeYCAAB5MgIAADfQAgACiKgCAArmeAIAAT08AgAC+b4A=
Date: Fri, 8 Dec 2023 09:03:43 +0000
Message-ID: <C0ADC33B-1966-4D3E-B081-A3AA0C3AE76D@arm.com>
References: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
 <0bd65e25-aec2-4294-9a73-1cdaece52242@xen.org>
 <9ffe5a34-d1f4-4f4a-82eb-77c92f71040c@amd.com>
 <ca91f71b-9633-495f-9fb2-731bd250a561@xen.org>
 <8547fc3b-4e77-45d7-8063-1bee869d07db@amd.com>
 <3a9efd72-07cc-4b1d-8814-d4f6df4e6230@xen.org>
 <73554150-9880-447c-ac2b-e4f3ef0f76be@amd.com>
 <0d232ffe-1eb1-420b-af2c-70e16088a9b6@xen.org>
 <03a91b0f-eabe-47bd-b9fb-a9e15bdd121f@amd.com>
 <7420ada1-cc6c-48cf-9b2d-4c09e236dfdf@amd.com>
 <50372bd4-5e1a-4d38-abd3-19abf8e82591@xen.org>
 <alpine.DEB.2.22.394.2312051503060.110490@ubuntu-linux-20-04-desktop>
 <a4c43652-1fa6-4b42-b751-582cfd6324fe@xen.org>
 <alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|GV1PR08MB8083:EE_|DU6PEPF0000A7E1:EE_|GV1PR08MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 72829e40-7a59-43bc-2c59-08dbf7cc99e6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2ZWOVgiOgHjp2j6nEnRxKBZQeaK/2YbD78o561r08p59RVZaM3w97dfFkM7Vr5Y2jlHXKSHJTGCviQej+tobVYNgvEIw/se/v2aROfbxVN1dNF5CsfPIFbsmq9yBzqoP9t6NSTSEN//qritSNqSn4SpfujRjAjYCPPRoLfqAiKv6ts0qkrodKqNgskCTC7iX80i1Lua0xfoWEocHrOczelh/UzzOQAL/eCcaMrZFP0WNuB/j8Y9ZmFwujDZLwbnlDgQLOIuI73iZjIiwzkDxqzYVLEMj+KtGy8bfGVUCDwqWszXE+K+lJpzIzGvfrACdzS20Msd663wpZCHHFL0Wz2O3fUvVT/G8oQhpS09OFIomsSkXHWytzEZBEaWbXr4cKSJKmo8+uwGM16Vdwqx9T7KeWgQ+tuDV51cOEclvP1mbdYhZqT8Bvepn9RBOLkpV7iW9zxp2iho0Aj5x2O/z1f1c4Zj+oApfBK/nj7MtIzf+ZeJ/h9sxz0tMMYOtDrDQM9xGn7n3U0VgiYSBqzHMJ/2Yp0SlThgZXoshPnf0J4frlHaEqP+rmXqWePj0jGitO2q0RcemJ9EcO/839ACcRQu/hGxBPtubN5FUB6icEx6a5OLLToabMuZ37udbNs2M7U1rxfE5+xiWBpduK3f6GQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(8936002)(6916009)(83380400001)(36756003)(41300700001)(26005)(6506007)(5660300002)(66556008)(8676002)(66446008)(66946007)(38070700009)(4326008)(316002)(64756008)(86362001)(66476007)(54906003)(6486002)(6512007)(478600001)(33656002)(91956017)(2616005)(2906002)(76116006)(71200400001)(53546011)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <793E3CF8278F9A4D8EC8B659F8D9A2DB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8083
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3e5fe1c2-c1bf-4b7d-7586-08dbf7cc9442
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UuMhBNaKFj0Knc7Egmkq/PkKt++WToD3wYYwmMaiJm0tY1PoEyD8hYYeK8iOaQfFJspHvGRPEUyg1DkSK8jeVkJyNP2mZgtSzPfi+55GnqW/0pKcCYcNG6ZXMLPCUBjpGVVMtvnO34QX+RJN2Xw3RFjBTiMnydCy4nBZs3MFiouJbYYObwsTh/eu60HE2sUZqEk9/JWf+U6FsLTnN0I4+KL4S52gVk8fjK9AZ+upqirnIFG6IRncK2gC6nR0zzLRlRQTYVjFBxhIwiwrs2HaoDjkqgb6i+VG23S0OCa0SXTkuN23Q4AK52XLAp65fyjAbhd0Ouy55pN2Yns+pSk6rtpcbJxkY51MkOUa+4hs7PPOAu1JLGd2t6HbnbGSJ3/vg4m72uX4FtlQ1f/q7jsUgwiZtLda0guepS7EL2QIY/etUoyhka3esY/ZfBHwbWQ4ZZ3zthJQrzo8CeZjhGq3k2qTYyedO3hupPn/ezWaB7Su1InktjkjusxP+QpNCNlq+LKS+8oHKzWs1JX2yWSwlddZwni+Y3BNyu81Cq1JVQTVp1UF0GDI0kYXutrq4gj0TEjAmN1wd+8sqUdxDMxKQXyLU7O/3PoFuWIPCKw/i/kHYArHW0Z4LYEIYQIyA2Tus34N3flfLO6Jyd4dypXHBNsIMAqZzMph8fUKDY6Wvja88/K/k3aCXU1EYayUxwiMIE2xJ4GW2AFP3BhnrmrQVAKyqk7ELZFHNfOwjhiIrzEvgugCwZzrALC5nUnt5K0Y
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(82310400011)(36840700001)(46966006)(40470700004)(86362001)(54906003)(70206006)(70586007)(6506007)(47076005)(2616005)(26005)(33656002)(336012)(83380400001)(36756003)(53546011)(41300700001)(6512007)(36860700001)(478600001)(6486002)(316002)(40480700001)(82740400003)(4326008)(6862004)(8936002)(8676002)(2906002)(5660300002)(356005)(40460700003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 09:03:53.0444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72829e40-7a59-43bc-2c59-08dbf7cc99e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7826

Hi All,

Sorry for coming back late on this thread.

> On 7 Dec 2023, at 22:41, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Thu, 7 Dec 2023, Julien Grall wrote:
>> Hi Stefano,
>>=20
>> On 05/12/2023 23:21, Stefano Stabellini wrote:
>>> On Tue, 5 Dec 2023, Julien Grall wrote:
>>>> I agree that crashing a guest is bad, but is lying to the domain reall=
y
>>>> better? The consequence here is not that bad and hopefully it would be
>>>> fairly
>>>> easy to find. But this is not always the case. So I definitely would p=
lace
>>>> a
>>>> half-backed emulation more severe than a guest crash.
>>>=20
>>>=20
>>> I see where Julien is coming from, but I would go with option two:
>>> "emulate DCC the same way as KVM". That's because I don't think we can
>>> get away with crashing the guest in all cases. Although the issue came
>>> up with a Linux guest, it could have been triggered by a proprietary
>>> operating system that we cannot change, and I think Xen should support
>>> running unmodified operating systems.
>>>=20
>>> If we go with a "half-backed emulation" solution, as Julien wrote, then
>>> it is better to be more similar to other hypervisors, that's why I chos=
e
>>> option two instead of option three.
>>>=20
>>> But at the same time I recognize the validity of Julien's words and it
>>> makes me wonder if we should have a KCONFIG option or command line
>>> option to switch the Xen behavior. We could use it to gate all the
>>> "half-backed emulation" we do for compatibility.  Something like:
>>>=20
>>> config PARTIAL_EMULATION
>>>     bool "Partial Emulation"
>>>     ---help---
>>>           Enables partial, not spec compliant, emulation of certain
>>> register
>>>     interfaces (e.g DCC UART) for guest compatibility. If you disable
>>>     this option, Xen will crash the guest if the guest tries to access
>>>     interfaces not fully emulated or virtualized.
>>>=20
>>>     If you enable this option, the guest might misbehave due to non-spe=
c
>>>     compliant emulation done by Xen.
>>=20
>> As I wrote to Ayan on Matrix today, I am not in favor of the emulation. =
Yet, I
>> am not going to oppose (as in Nack it) if the other maintainers agree wi=
th it.
>=20
> Thanks for being flexible
>=20
>=20
>> The KConfig would be nice, the question is whether we want to (security)
>> support such configuration? E.g. could this potentially introduce a secu=
rity
>> issue in the guest?
>=20
> The important question is whether it could introduce a security issue in
> Xen. If we think it wouldn't increase the attack surface significantly
> then I would security support it otherwise not.
>=20
>=20
>> Regarding the  emulation itself, I actually prefer 3 because at least th=
e
>> Linux drivers will be able to bail out rather than trying to use them.
>=20
> I don't have a strong opinion between 2 and 3

Here is my view on it:
- providing a wrong emulation to please guests is not wrong as it might end
up hidding something that will be hard to debug so on that point I agree wi=
th
Julien.
- choosing a solution which might just crash a guest without any other solu=
tion
than recompiling or modifying xen is not something acceptable if we want Xe=
n
to thrive.

So i would suggest the following solution:
- have a Kconfig to surround this code so that "correct" guests can disable=
 it.
- have a command line option to activate this behavior and turn it off by d=
efault.
One encountering the problem will have to explicitly set a command line par=
ameter
so cannot do this without knowing.
- activate the Kconfig option by default and security support it as it is o=
nly active if
a command line parameter is passed.

The Kconfig parameter should be more generic so that this could apply to a =
bunch of
registers we would emulate with RAZ/WI so I am happy with that proposal if =
we say
that this must be activated through a command line option passed to Xen at =
boot.

Regards
Bertrand






