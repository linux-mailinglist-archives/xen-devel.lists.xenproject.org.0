Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4947B0195
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 12:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608844.947599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRZQ-0000DN-Kw; Wed, 27 Sep 2023 10:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608844.947599; Wed, 27 Sep 2023 10:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRZQ-00009c-IJ; Wed, 27 Sep 2023 10:15:04 +0000
Received: by outflank-mailman (input) for mailman id 608844;
 Wed, 27 Sep 2023 10:15:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUTS=FL=citrix.com=prvs=6275c33bf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlRZP-00009W-6d
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 10:15:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b616adce-5d1e-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 12:15:00 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 06:14:50 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by LV8PR03MB7472.namprd03.prod.outlook.com (2603:10b6:408:18f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 27 Sep
 2023 10:14:47 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 10:14:46 +0000
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
X-Inumbo-ID: b616adce-5d1e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695809700;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NvO3ZIJy0+83XkhKziI/BAuXzPy1eSp+zp5Cy+P5xY0=;
  b=UvFdkWn3gtSBloA7Mltln32JwLaP1PraRP4kvQHnyDHLFGXiyO7zG72+
   PerBVIejIMn7oRaq4LyiwEJnrUyfYTaB8oqTuuJfHuO9JISIiXbU0L9R9
   gZ+YuPrJcRLO211E3tcpmzuqrl/O4qrdcKbqzXAKs8se0sIQMgnz93BJm
   c=;
X-CSE-ConnectionGUID: sA55fg2fQzy3Q9PjHAoR1Q==
X-CSE-MsgGUID: KVV8NQ1dR0+ZDAmHR9nsqQ==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 122569197
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:ia6aE6qk0HIBwT2ehDGf8rKisQxeBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBmAOqzeZzTzLo0ibtiy9k5U6J+EyNRlSwA4+302HngSopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5wePzSZNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACskM02NiLi4+aCqEdA9vsYDBc7RZbpK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSFEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdhISePpr6816LGV7k8tNk0wbAK3m6H6uGKXXvJle
 koP4xN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zpptE1hxeWF9J7Svfr3pvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztp6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:Jyn2HK2mOhsrALpTmtpD4QqjBLIkLtp133Aq2lEZdPU1SL3/qy
 nKpp4mPHDP+VQssRIb+exoWpPwJE80nKQdieJxAV7IZniDhILHFvAE0WIg+VHd8u/Fm9K1GZ
 0OT0G2MrPN5f4Wt7eY3DWF
X-Talos-CUID: 9a23:vJDP1W7pW3sZ7gJzPtss72dJR84qKHPk3maLGh6AC0ZAT4fMcArF
X-Talos-MUID: 9a23:wicBRgldIMTdq9HkkiJidnpBCvk4xZ33BHpV0qcqksykD312IC6k2WE=
X-IronPort-AV: E=Sophos;i="6.03,179,1694750400"; 
   d="scan'208";a="122569197"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEIKqXjOfvV01Lrs/E+3TIHDPNMxN0FeSG62dwLIQ6IRzFykc5e7EaxAxKRxcoz9KO9Zs/HAcNSXX4WMZAMcfFzqQySWkh5R+Err5lXCGL5XGio202p/I5Rv/gROalJcRxuiRGhov3iyVWFof8N5QtSPztPLl/cBJgXOm+jzTmvsOfiNmXBk/fK8id27CGO0tiI3evbCWhaGNObSY274R/pG2zw713Q61zlZ25ESXLChs3LZ3WHX7R27YuHgN5jC8Cx6NmeuopBousDk3P/YkM3Rjb5CAnJ8UgAcHWdxgcgNQzFOx4Ba9RyT9WfOCOMWB57FUHbqJJU1W0xuxwW3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDC4qiSsCKmZiS2KKGzVp5yVwypRDfXXvGfr39vzRZ8=;
 b=PCMvOy7s45SGFN8z706crqJtG+DJE+e/EMr5kVNlR3HuD85DPPUXf+/VuDtMb3zqYu2MThAgSg39lMv1xCaVGzuJB30rYhIb7W4Mpr9cQMw+/9MkOo6CPUyNrcbPHvDN8ujFqAX13oBFcVPYCQKmI3HGF/TpOY7t22xydSvW+ScDH6TPuqnLYaSEJPIZWJ4iIk6k3DcJIxQ5oSg54fGwt/02M1MiIkuhFvHjA0x70ofbLFDZu1rwmxbyHBf3elP3/Y+0e96HV2sQ2NRDL3CfaQzk4jMkPEBeGX45tvKmF3GFVAs995ubGQsoBHq/VvJ1WsmV4MYh0eCIFDRDT/S+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDC4qiSsCKmZiS2KKGzVp5yVwypRDfXXvGfr39vzRZ8=;
 b=D6mW+EoN4nS1/nB5BdYne/BfzwfSzpSDdRUKEV4djZnr7YDfCGt6UMLXVP8mZKQkzNh0H6hID8wPv+Ja+cjK53Fr9HS8t7fC7cAA0ZHRNAwR9pqeMzqYC3RMqaexRS7WqNVh04C9wk6VmiLQkePSiqItrmay2whAFuXvkObf6P4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Sep 2023 12:14:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 3/8] x86: update GADDR based secondary time area
Message-ID: <ZRQAkKzIR7dxnY_H@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <3cbc92ac-7817-e08c-0e7a-bddd0a4ce070@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cbc92ac-7817-e08c-0e7a-bddd0a4ce070@suse.com>
X-ClientProxiedBy: LO4P123CA0477.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|LV8PR03MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cecd5f2-9ff9-48bd-d17f-08dbbf429392
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8dg4cJTvRod583v9rSg9vV9HldLHSK/Sak4qYjFV2dkGzFyJqW+QtgI4BiDNxYWJF9J8zfZ88Ly9CpD5Sgy8CBW+eUyMCV5NVvW/vSwQK/usNlGqRYIPCP0Hbxi3eH+V9dyze/xkagEkYEwGl2EP0fxqALmzqZeGD0fyg6eO6frIASY/92MIPgH9E4RMcFYdMDQczjKOUvHhqs9Ij1yb+A0/ymKy/l1s77dt2dkVPQus+IJhRsAR25QqsbHhICF6MzfzI/tgBq4hVqWPupJKnOcWsFMjOyBvDnszLSyp+iVUoQgrDki9QZ+RFz6FxEUU1VdRZrCZ4MntlstXguyz5HjC1/GWEW1yEXS9p0Chq6F3+mfPw0EeY3zd8yR25dk5esLnpsg7ZwTbSAULsz1ppAK/xDoz2A9r1hCpTKFodq7xdCuGMHrFlqyn8pn2shP3AIfvn3Da5ljGxHDOzivw0PEp+U/UDIBmRoei7xa0K8r4K7h7ND+6728DXSB50avJLMPhw2mdWldvJNYQoguJBZMy0x1soZdR1iV7K6V6rOIFuM8CAJgZYPtVpYDVnSpv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(396003)(366004)(376002)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(66946007)(66556008)(316002)(6916009)(86362001)(66476007)(41300700001)(8676002)(8936002)(33716001)(5660300002)(4326008)(85182001)(54906003)(2906002)(4744005)(38100700002)(478600001)(26005)(6512007)(9686003)(6666004)(82960400001)(6506007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVJPdUZVelFGaEw2a2EzQllTNXVaZXRldGI5a2I3N21ucUxwUVlyZUkvU0pn?=
 =?utf-8?B?L1pKUnpKV2tZRnRXTmxqZUJtTGh2VkJjcVR5Y2o0dHRFanBwRkdaQm4rUXJV?=
 =?utf-8?B?d2xkMDc0SXl0TG4yamkxY2hyczd3NFZERFBIV1N1bm1rUWpOTW1ZRXhmVjhJ?=
 =?utf-8?B?eWlKY2dkYmtkbm1zM05uZnIwd0Q4QlRrODZPU21PUXRNZ2EwREVueU1JNzlk?=
 =?utf-8?B?cVVJTzYwMGJwU1JJMlVPQVVhRXdjTGpHZmc5dEVCdmhYc3BHb2hLWGpRNVp0?=
 =?utf-8?B?Y29HYnBTbE1VTVl4SG9IMjF6blBFUmhNeDRubEU4UDJPSTVkM0Q3UGFYZnYx?=
 =?utf-8?B?YmFBZWlncEliQmh1L3ZNTThsWGQzbzZyM2pnRFBUL3I3QThXTmNUTVJERFZw?=
 =?utf-8?B?dE1OTHhodCswSTNBVWVoRWtlZUIxKzZiVUtIeWpZdDF2YkJrRVE1eitVODhw?=
 =?utf-8?B?Nk5PL1FRcGxzUGl3c3owQkErRlJMNmpmZXMxN1NYSVM0VDU1VUJzRnBzRDZZ?=
 =?utf-8?B?NU5HY01MUUV2TlFQcVZTZUQxMllGdFJBSFdycDRSbUdiL1Y5cmdubGk4YnpQ?=
 =?utf-8?B?Y1FyK01CQjZRR09SZUxLTVJsRHhhVzA1U1BMQWUxSS90Uzh0V3VTTi91QUxn?=
 =?utf-8?B?czNpRWJDMTJ3cnBzWlhSQTlrWjlrZjFMSEp0eGtYazg1bkNpdjNHYk5JNFRO?=
 =?utf-8?B?RmllMGNqTjZUa3ZjVWN3R2VjVDFiOGtnN0EvUkZoeENRWmw2TFVqVG91UnB2?=
 =?utf-8?B?NmFkY1l6dUZVU2NjcVdBU1VhQU4ySktlTzBNNzJXY0VoS2V2S09tQWVCc2ls?=
 =?utf-8?B?UlhBUGVsaExaYVlpZGliaXU3dFFQeHJ2QlJ6OFdOQWNZT2NVTTRWLzdmU3RB?=
 =?utf-8?B?SEFzb1hTa1UzTUV6YXRESHBoT1FpZ3dDdjZEa3VKTUhRWmRPaUVSek9hU1Fm?=
 =?utf-8?B?VkF3NkRlS3ZpMkxHN1c1N1BuSzRSajFqZjY3eXdXS1FUTWY5NkpDeEtXUVh4?=
 =?utf-8?B?OUZ4ODdoYnJ2a1Z2NC9UTjlZT2M0YTc4L055dmFWQVZneklQd2VleWNYTHNr?=
 =?utf-8?B?VWdwT0QyRDQrbU8zb0pETWlyNjQ1N1loQkRoQUpzWFVTN3RjWVBUSkZ3bHNi?=
 =?utf-8?B?bm40Rzd5Wkt2UHB5anh5dGdZTURTUUlhSmZicDRHdk5yTEN4TUtWWXNTOXJk?=
 =?utf-8?B?RUxvUHcxQ0NycEswT3ZzTkJtVy85TlQ3dWE4U0tiT21EeEJRTW9kamh5MG1i?=
 =?utf-8?B?bE9DSE1FS1hvWGN6cjArVkZDTHJxejhCSWtybG9jRDdrendvNzdEV0xyL29U?=
 =?utf-8?B?TXFScFgrcUZlaitzTXJLMGtLN0xiMWRIVWxtOTUrZk16MnRuU1lBS2NtaTJ2?=
 =?utf-8?B?S3RMN3E1Q3ZRRDkxdTZZalo4SmFhd1VqSDlWYU4veVl2UDc1VVkxR2RsaFBt?=
 =?utf-8?B?dVB3QXJNZmJ3VndGNDg2SDE3SFpsMVhPeDliS1dCN1NidGxQMWpCV3dhU3pl?=
 =?utf-8?B?Skd3RzNQRGlyY1hpWGRCcFNYOUtOMkpEY1NSYWpTSHRjT1ozeElsVnA1cURn?=
 =?utf-8?B?Q0thNUhDL3QwWTYyWlI1UW1DNWd6dEZuWjBjbWlpWTVEL3F1eGlIYTdIbzJu?=
 =?utf-8?B?U1J4dFNFSzVvbmtyY0N1NDZpdXE5TVM1Ky9LTGxGTFZnTGU3YmszWm1OSGxv?=
 =?utf-8?B?WFhVZjh1aTMyeEc3K014YTZhMi8vTTRnN3hTamU0T3E0RUtvSWJhSjU1bUw1?=
 =?utf-8?B?cWxVUVJOd0dWS3dXdWlhVjhLbzN4NnVzZkF0b2crUVZKWlFVREJweFJsa1Nx?=
 =?utf-8?B?TktNenNORW5DNkZZeEtQMmphdkZ0dUJydENjVkRVdWM5NFlhRzVLSkEydWdH?=
 =?utf-8?B?S1N1M0tiNXNXdjkveDJoWUl1Z1dEa1Z2Y3lGYUNqMmNmWTVWWnBITGNlRmVN?=
 =?utf-8?B?dTNmeERqSEwzRUJ6RW8yRS9EVU1NdzBiVWRFYUJDYVNmRHRBZzRYdjk5MjZH?=
 =?utf-8?B?WmdZd295UHpmMXNhZHpVM1hRc0c4Z0RMSnFuSHgyeUQ1cUcyS3EyaHd4aEE5?=
 =?utf-8?B?ZFF0ZmVWMTA4QWZHNy9TRnRQSk9lL0lCVHNpcHVxMXVFOFlUeGtBR0RiTFNB?=
 =?utf-8?B?MlBUTkVFTlE3U3g3Z1BjblpsYTMxV2g2aFhXQ1dBRll4RWpZRE5DV3FJUkZ1?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hPZx98A6FO++wd5LfUphlHmTDLbNnZ2J0hpy7WgxypVRM2UATCzskLYMIJzpq1CesgtRp51uH8LXSaq0YmJYHGnaXxXDlrbY4yNIVTCQD1KCAikGLKN6d16a7l4FI2T3WRj5bhlA2j/jcOFt3A9eAldLMYnCRTRX1Fx39TJDqNT0Wbogxqy+ITUGmpvNXsb3F/RZy+m9sBjRnXR3BPfr/JMDSryBQ7I3zDO00oAL+RLAIHFSptMI2nOchQeYEeMekJAiVrPMQZQyuLzt19ujD0uO7HoHz2ZU1eMNBasfgv4sY/bRDi1B1lpzWG7gA6cZnz61jC7nRqFbU6blTJui3btK3KUCfPmgfh6xpw6iVntSyRHiigk87Z+j0n70rWL9uDqVwmyiMR3Id2IxmMp/HsLJWNELrEFagokC1IpHk8jZH3QWjqn4/fCGwBN+ZYpIjlsa+EgonUkD9GsbVD8BzwqAYyuuyjxxgkitmmnuk1q3wdN9UEyj1Q26sE9e5g2tl4bCLvwXpiPiWY/Mcs2TR7KXydb4AO8L7S4tN0YSYK+YyuhIxgNHWZUpMX87iFQrcH+eCzmsbUrYDihvb7cq2q9zJ+pY8zeHjGqP6ma2/7VrBSRpUzwP1u4Ru2wYvMC4UMgDKf0egnLqjdBjKpYhaLKuoFHNkuzfyX3n1zpRPwU8RKhWt5FukkY0s/mNdV648rW1o5HcMSYHYgkJiv8s53i0iTU94w1enjkYMPO8ybvWi+6/c0GBaFfn4+cnWBZvOk4yV3wiMCPOF2OX5TNC1mH74IOqkNJhjFOpSAAy3rEf1SjgiYsM2SP5Teix4Tmp57jtnRG9xcfmb0BKiCN9UA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cecd5f2-9ff9-48bd-d17f-08dbbf429392
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:14:46.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECL+nzkbWtLWgOUHZ3wv1vbGdXgx3hb/yaaHiJiq743tbRdE22+tYlN9obIeXCY++bDQ6aZOnVJ1cPm0ae3TUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7472

On Wed, May 03, 2023 at 05:55:52PM +0200, Jan Beulich wrote:
> Before adding a new vCPU operation to register the secondary time area
> by guest-physical address, add code to actually keep such areas up-to-
> date.
> 
> Note that pages aren't marked dirty when written to (matching the
> handling of space mapped by map_vcpu_info()), on the basis that the
> registrations are lost anyway across migration (or would need re-
> populating at the target for transparent migration). Plus the contents
> of the areas in question have to be deemed volatile in the first place
> (so saving a "most recent" value is pretty meaningless even for e.g.
> snapshotting).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

