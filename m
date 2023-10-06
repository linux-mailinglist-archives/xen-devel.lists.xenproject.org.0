Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B17BB876
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 15:02:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613594.954218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokSr-0007ZT-Dp; Fri, 06 Oct 2023 13:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613594.954218; Fri, 06 Oct 2023 13:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokSr-0007XH-A4; Fri, 06 Oct 2023 13:01:57 +0000
Received: by outflank-mailman (input) for mailman id 613594;
 Fri, 06 Oct 2023 13:01:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qokSp-0007X6-8k
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 13:01:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 831a10e2-6448-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 15:01:51 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 09:01:44 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BL1PR03MB6024.namprd03.prod.outlook.com (2603:10b6:208:316::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.39; Fri, 6 Oct
 2023 13:01:41 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 13:01:41 +0000
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
X-Inumbo-ID: 831a10e2-6448-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696597311;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=qCYyTpNPjOJv3YwKIrbsK2yGzwNUnBZobPvDDFnwikM=;
  b=Xxjko2gwh3hhXZmltOM0CRPWPxaEPM145GIOolXlb+YHCnqlGBJEZD/D
   dmEukHxdQWV43iAM5MmfRHFC+6vZoaj4ZprVTnRhZQte0jWIRPjruk33c
   smnR1qa/sWJVJTxoVUM0ylxkFSzdAuvgNVQ/BnlfxXdapowwMDwUrHveP
   U=;
X-CSE-ConnectionGUID: XFzr78a5RXOQcs84/sxXQQ==
X-CSE-MsgGUID: BbymaxLBSWWX5rKspncfzQ==
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 124080199
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:EiJK86M6+tXDF0jvrR0hlsFynXyQoLVcMsEvi/4bfWQNrUorhWcOm
 zFMWT2Obq2LNDT3L94lb97k9RgC7ZGGmoI3Sgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42pA5gJmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tZZE3sRp
 fVFEgAqVxuY177x26KLc9A506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyjw3r+XxHKqMG4UPJey5/tjkHm5/VMsOEAMdkCjp/K3mHfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAkQzhbeZoZvck5bTUw0
 xmCmNaBLT5lvaCRSHmd3qyJtj70Mi8QRUcAeCsFQA0t89Tl5oYpgXrnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqYjyKGT7V3BxTW2qfDhRQkw4xjRX360qAZwYoeqapaA+VXd9exHLouSUh+Gp
 ndspiSFxOUHDJXInirdRuwIReit/6zcbmyahkNzFZ488Tjr42SkYY1b/DB5IgFuL9oAfjjqJ
 kTUvGu9+aNuAZdjVocvC6rZNijg5fGI+QjNPhwMUudzXw==
IronPort-HdrOrdr: A9a23:XUPKrKtYtSfVzalwnrStegwO7skDRtV00zEX/kB9WHVpm6uj+/
 xG/c516faQsl0ssR4b9+xoVJPgfZq/z+8X3WBhB9eftWDd0QPDQb2Ki7GSpgEIcBeOlNK1u5
 0QFZRWOZndCkV7kNa/wCTQKadY/DBfytHNuQ4J9QYLcT1X
X-Talos-CUID: 9a23:IDvgK2Du3PCGMYH6ExlJ5lRLSsl4SE369XzLcxP/EnZZcYTAHA==
X-Talos-MUID: 9a23:Ts15swYNKCF2MOBTnTX9gThyEO1T3JueVVouio0AsMeWDHkl
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="124080199"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2NAUgN85FUHdF56MxCMtx1dab/t+/ufj3caF6yECRf8j00ZH30QaS3KcftXl5fLf8bmJMV+YECs6fygsRMKus82d4BmGu8+5TNrw+nbXkOHvsl6creY2CN2p0ypn80o66rQ7wXEoFscO1vPESZXF3Ts3KuOkmMEaCHv2P19PXeYcEbV96oKAF9yaF3e5xNR6r2LtfNn6i+axwrWeYUPo+LMmP5tjaBxSGiLrlaNRUIelWahyzThi0Y9VYtVf+/V8cn8KQufSGumJZ5zNFnOUhTtmlRFxIWVWBv+VWFIEWxNQn4RM4pKFp6tB3jS6p9hxbapLS8lzh5fSSb8pkU1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IH1pis6T8jQ5sk2PQzURXM10ZzAg16i/u9FM25oCPQU=;
 b=PYOhaGDnZcMmYSvm7dkJjqNPfD1gyS1DzcF/0ktBsQI3TRo4FesAaeLJjq1TwnRRBFmhS/lLoITd9Hpg1k5dIBelFODnkNUimMrduFauap5elDfAwwoDbQFZrzh0fRWAFGHUDFer52Ws2LJsDyBj3hTf9QLPYqdzYBOLAlXosTBFz5Y9RBxyQ/qTmTVDAQ7QXp8RSm+QDoe1WhQe2VFlVpo++LpJDiA7V+WtQ3ZLKPs9O3GpXcFpZUbUgDFBMzkHbcyv3+XpAN64Ok9TFEEHDBDTLSvCwXiFpUjF4VqF8ZohxMMxIjwfGAwrA86pnzG5U9mPFTiD8KUqC1v5SfQN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IH1pis6T8jQ5sk2PQzURXM10ZzAg16i/u9FM25oCPQU=;
 b=Ldx49kGozEcGLaCw5aVBxL8UV3PJBQimmMDjL4v7hozAM6+DQGHXEp91npG5G2mWKuK51ZkaSUIYPME/NeSgkngQOb5fdxwKGkVcUqHklRN9r3LnvEhbh4ic6GBNPrksTKNEhEGlxydqc7rTzrW9tPA5pIpGb7MjB6iF7yBh234=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 0/2] domain: followup for phys address mapping series
Date: Fri,  6 Oct 2023 15:00:57 +0200
Message-ID: <20231006130059.97700-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0263.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BL1PR03MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 80384a8d-6586-4d52-95db-08dbc66c6247
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d1AJB5EHqzaFzDtyDd/m4h2NRJh3iRRRaEbKMyD0aq2h+HbIzHSYe3dH/mKPqYLlrbK2NWX5D5ALTiTdx0mJIkiYamc2Uv11JG6n1JLFYGTeUSRIeJBOpDoCmDR9bvBH9hv1zMDKPUw+bIYquGCswydrWsOShP0rsYHUwGmppbvA4mdQOzQQYja3BmCItluz9F+ic6pAWIMkRigD0cTqJupM17EIdzEmF61qPlpA+vNa5K+ROhom5KS6/7e3CI0DYiu5bzBYw/HtIQQm+x1rBEz7On+vcICvLZWug9F+45AB5ItOo5Hnif4AvBe/AwlfoKId8+3PqUHw2iqkaplQFgs/VS77ir5wh8hFyfUqnYGuN0WkndEnuRcb+sRZZ5xErSmaqXMs+MMz2BFJPq0rf0Od8qH5RKhxS/c5YPIn1X+hKPG/QWyG9UdsQFAf+RtrieMAT7Xi1wKeGIvola5Pq16jWrG/Rzlg1eGgzR2IS2aCkQF0Zx2KyhXSk57zh7a/+hw3poHHr1YEdwvFHmhRXkgINL8JEWbwNt9QsXPOnQ9r/zEP7DHPEVYTXUkYk1zg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(83380400001)(6512007)(6506007)(6666004)(478600001)(6486002)(86362001)(82960400001)(38100700002)(7416002)(2906002)(4744005)(1076003)(26005)(2616005)(36756003)(316002)(66556008)(66476007)(54906003)(66946007)(5660300002)(6916009)(41300700001)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0tCbFBtbjZiYUZJdzJQV2VJcFM5WU12RjhBMG9CRWZJZU5VVUo0RExRdVht?=
 =?utf-8?B?dCtEZHVjd05WUXovRkpVUU1BKzNZSU5QWVQyNUtZcTB2QmwzTEU3RkZnNUdn?=
 =?utf-8?B?WEcrcW1OTnFnMldDZ2w4d1YySkVzUEJPTjR3TWF1dVBiN2d4aUcxSkl3eVpo?=
 =?utf-8?B?OGlDSFhZV3hHTHJ0ZWFCWGNIWWFQK0lYWGlMdW1NQkFjZnlhMTBUM2RDWUlT?=
 =?utf-8?B?QUJTOUg5dVhXUzJEWVpQWm9pNGtOTE1PWHF2L3QydEJKQnlLQ1BHS3YyNEU4?=
 =?utf-8?B?bG13MFgxQUlra1dOQjdpNVZrMHhLTU5rSEd6WXhid3NzSUNERUV3N0xEVlNh?=
 =?utf-8?B?UitjczdWTmhvZHJxbHZwdEpBenZxYU9jN1pXM2xXNWUxeUVXenMxNmFTaXl5?=
 =?utf-8?B?SklkU2Zzb1VITkZVcE52SDlNMWRibGRkcjdiVjVtbll4NUIxVFI2RnBWVldK?=
 =?utf-8?B?TnhUOEQzc1YyOWJ3cSsxOHQ0TVhXYnFnOWJ1eU5WUTVRY2I4dWRJaGV4VW9s?=
 =?utf-8?B?SWlZa2l6dXRqSDV0WVBwazcvWDErZ01lSkJHZkpwSCthaWZpY081Nk45YWVK?=
 =?utf-8?B?bFpxdlo5Z1FqL0lsMFNaQ2VWU09DcmIvVmpmdDVKUGtyNlJPaHJvd3VLRGVQ?=
 =?utf-8?B?RzRTV0pwM1lvUkI2NzIrdHNnUFZWUjVsbU5yRjhxVXVOUU1YWHhHK3dEN00r?=
 =?utf-8?B?ekRPbHVmZVN0RzNWRk5Pb2lneXczTGlxbFM5bWNzQ2hYTi9LZVU1WkYxTWRW?=
 =?utf-8?B?MFFnbTdoa0dqcW85U3h6amRoWHVKaWNRb2E0RDJWTjlnQ3FpaHB0TG40MG9U?=
 =?utf-8?B?aUtuVU9Rc0hhV0hxeEkxVHEzU0pEUGQ2NTVnL0R1RVRHZlZBYTVobzdpd3l2?=
 =?utf-8?B?eVRaenZVMTZUNzd4S25pOXYybldNWFBDMzhIdXlRZlFXbkFCeSs1YkZnNmFC?=
 =?utf-8?B?dlBIZ1AycFYrREZpVXlPK0JGWGRnZjRsczR1Z1ZKa25VZW9EaWtlWHk2TnpB?=
 =?utf-8?B?cUVDVURhRFY3NE5HR0N6SDZyU3dFTnhESHNKQS9US01abG55ZWY5eDhyNkhi?=
 =?utf-8?B?RnY3Wk1qV1QrZ2NQRmRMVCtYWmZ0SG5mcUtONFJOVXpPN21jR0s1NVFrMUR4?=
 =?utf-8?B?dmJQVmV6ellHcnQxc0N1enRRa1V6d0VrRGY5L0ptMXBESHdzVjlXUjNBVExq?=
 =?utf-8?B?QmM2bnhjRTZEYTNmcmJXS1h3Tjc4NkZGcVE1Q0JkSGp4WnBFTTEvY0wrQzNz?=
 =?utf-8?B?MWRhbXg0R3lpV09EclQwK1BxRDlKQWtGbUllY1BYeTRxd0dOM0lpZE0xQVFK?=
 =?utf-8?B?Y0pUK0Y5MHQyREUxVXl6MHNFM0t1a3k5SHNXcmRWTm1LSy9keFFISGpBOVI4?=
 =?utf-8?B?NytlcFJuSmx4dmYzSHl6RSszZkxJL253enNFbXR6NDQ2SlVESmd5VWhlc21G?=
 =?utf-8?B?OWt5bVdGZS8zYVBMNEphVms2aUV6dUF1aE9SdElJeHVVL3VtQUpBRFR1RFUz?=
 =?utf-8?B?emlyenNjbXI3T3YrRThYU212QVJFVlVFUlZHM3p5WTdWVk8yQ1pFVDJkSWxS?=
 =?utf-8?B?dVpvTk1UdHpWa0tyWVlDWm9lZXVJYmoyclM0SlNBbkZvMk9xODBrNWMrZ0FM?=
 =?utf-8?B?Q29jNFg5VXR1U3hJS0pnc3RzbTdPMDQzbjBUM3VMQlI2NUxGdnlvQzJXZjQy?=
 =?utf-8?B?ZW1ydkErc251MTlkRmlUVy9sR1J2YUVsMTJERFF6a3lqektpZGREWGxGSjVh?=
 =?utf-8?B?S0xBNkdIbzcrbXJ1OUVZMVhPYk5sMU43U0VOS0cxMWFUVTBlTWl3TmI1aElq?=
 =?utf-8?B?YzYyajkwUUhsNG91Zmx1Q3M3Z2xUYmI2TzBTQlNMbHZpRW1QZE1maHU1NTNG?=
 =?utf-8?B?b3hrTy9rZFpQa0JsSnZRY3RSeXI5d09WbWFLMFhmcDZHZnRQc1V5YWFUZlRk?=
 =?utf-8?B?R1NBc3hwVisvZjVyZjk5UFFTVHkrV3U5bEgwWDU5UHE5dytwYk9RWVozZ3Z2?=
 =?utf-8?B?eE5tQVJQTDVabkhKZEJLNERLOHJRQUVxamVIcEt4SDQvbW5QbG5NSUpXRDVT?=
 =?utf-8?B?VEZ5TWdqYzFISTg2aEREUXhFaGs1QkFxWjREN2tIcmlBemtWcm01NE5YeTZK?=
 =?utf-8?B?VUkyU1dlV1RPaDQ5aE1MdlB5RGw5NXlxNnBZSjllbW5DQk15eHBUWit2cHIr?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XHE0ovjxPuf5ZWk7DfNq2a3bhT3xezF5XNkW6NIKWJniCcj6V8D0Ek/ZdMLUB34FncEhcvFgI5uFy2xTAyS1YGOs4b4rO+SeZXy+55OXrUD2LUeOD76pP0HDbdvCAAp+I7dYYZhx/08qcIxfEt5xwZoU1vXGsnaMPtAMU0IuEE3igiX4YWS/kxkSNS6LlnyHMiJz/tAScvJUn9J4drbDaBJ/qUM9Tcg0QBGNtfZoRQ0zasWJRvPIvpYlP7Hwhvd5N9jTM8bh6A7tXfTXU0zAK3+AllQ4ulG7avmBbd7sn6GuuCkeTzvn2mBnNYul1ME7u+2qx4xXBi8tygMcNDk4PYl2Dex2NdQH1y3ef/z7WazYBUvS7wg0Kf0KBCwS/C8qLcPsPFgzg0D6s06Tq8fOrOQV5AmNCSmThu5AwG6JpEvjJ+PVc/qqQjbsMIj7TuGu0imJj6dsBBOVRiAPtxxYoNWPGKVl5wWnHNzD7ZVKz3e9FpFpYDeX5o+ItuSQwxamLNYNv6lNqYM4FOwOy1nHo9Ziry8kkLidsGXapthFKuBuGf7rJI6i84/m9krVSK4iyZzYwlbwiICRg1sAIfGy6qv2SCkGdRJQJcRyTi8NQ9K/BKT+6GERH6ldhHQeizv3yitmLNHP1KmPbqdAVGpbAhI41XQ4sVwX28l8SMmZVCzz6zUvNW4QkIc2EcmR8I36Q22TBI3GSw8hlNved1BTaGBKdorCPEvCucJY+j8TewVGDT6hbkI63Q35nrFCqHpqxAB2eh7i50HSvIFL2sq4UW+PbX8mzJcWvk6JlYDHZtIyZ8sObSl31DBtNFPBrH4vMvu9uSZx7XQLKWUu7vMrwms2vNrZq2lFGGf7PzuXT325mindxqGyiJ6k564aXKeACyKmtYMo9ruMiwH1IndvAupUg0hLTA5q76DA/Rn+BQo=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80384a8d-6586-4d52-95db-08dbc66c6247
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 13:01:41.2142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omb4638B1Gccx1IljFEYptL4rOC3+tMGRpJwUuKvTBucal4FENQFAUB3nyj9ombsMOSvUMUwYtLs9/M77Sx8gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6024

Hello,

First patch fixes a bug reported by osstest, second patch is an addition
requested by Andrew, I think this should remove the blocker raised
against the series.

Roger Pau Monne (2):
  domain: fix misaligned unmap address in {,un}map_guest_area()
  domain: expose newly introduced hypercalls as XENFEAT

 CHANGELOG.md                  | 2 ++
 xen/arch/x86/domain.c         | 4 ++++
 xen/common/domain.c           | 8 ++++++--
 xen/common/kernel.c           | 6 +++++-
 xen/include/public/features.h | 9 +++++++++
 xen/include/public/vcpu.h     | 3 +++
 6 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.42.0


