Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A63336F6962
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 13:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529685.824352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puWhM-00031C-9e; Thu, 04 May 2023 11:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529685.824352; Thu, 04 May 2023 11:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puWhM-0002zj-6M; Thu, 04 May 2023 11:00:32 +0000
Received: by outflank-mailman (input) for mailman id 529685;
 Thu, 04 May 2023 11:00:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puWhK-0002za-1G
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 11:00:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df9734d9-ea6a-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 13:00:27 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2023 07:00:19 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7224.namprd03.prod.outlook.com (2603:10b6:510:244::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Thu, 4 May
 2023 11:00:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 11:00:13 +0000
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
X-Inumbo-ID: df9734d9-ea6a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683198027;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6BFBWRNJT8gQpyjBB03kfOs52D8txaObxzukCNgKSwM=;
  b=hjp5r0SqJxirZFX9z8He3aDjITK8kvN+L/tf1VQh6G87+6zuwcNVK73M
   vyiDB51qQwXoAJhVx7tJzF5+SDfgrRhr65OH77aWVleB17+kenkqXg540
   c+S/ghoA9Xl4Wrlv5IYuxwuUirhjFOqeXKwbBsEgyltsWlKZ8GEeX7t3w
   8=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 110287718
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pUq2oK5/MYKorbHwjBWTBwxRtBXGchMFZxGqfqrLsTDasY5as4F+v
 mEZXWGEP/iDMWr9eNF2Ot/n9B4DvMTXz4RhTwBl/iFjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0T4AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m1
 OU7JQpOMzy5g++E+uPmUfJJueoRI5y+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOKF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLTOfoqaEz0DV/wEQeLy8ZDXedkMKYk3ynC/54F
 XUS6BQx+P1aGEuDC4OVsweDiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceRzYny
 1uIlNPBHiF0vfueTnf13qiQhSO/P24SN2BqWMMfZQ4M4t2mrIRtiBvKF45nCPTs1oezHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa8owFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:0eVjXaq46fcsqMRpJDudUKcaV5ujLNV00zEX/kB9WHVpm5Oj5q
 eTdaUgpHvJYWgqKRQdcIi7Sdu9qLbnhNdICYl4B8bZYOCUghrcEGgC1/qj/9SEIVzTygcz79
 YfT0ETMqyJMbE+t7eI3ODaKadi/DDkytHYuQ629R4EJm0EBdACnmEJczp3CncXeOAFP+tIKH
 P23Ls7m9PUQwVpUi3NPAh4YwGsnayxqHo7CSR2ZSIP2U2igS6l4qP9CDi0mi4EVTlC260v/A
 H+4kbED5GYwrSGI1LnpjTuB1s/oqqh9vJzQOi3zuQFIDTljQilIKxnRr25pTgw5M2/9Vowl9
 HIghE4e+B+8WnYcG2ZqQbkn1CI6kdy11bSjXujxVfzq83wQzw3T+JHmIJiaxPcr2Ywod1m16
 pP/mSB875aFwnJkijR78XBEztqik23i3w/lvN7tQ0EbaIuLJtq6aAP9kJcF5kNWAr89YAcCe
 FrSPrR4f5HGGnqI0ww6gNUoeCEbzAWJFOrU0ICssua33x9h3Zi1XYVw8QZgzMp6I89Y4Ms3Z
 WXDo1Y0JV1CuMGZ6N0A+kMBeGtDHbWfB7KOGWOZXz6CaA8PW7XoZKf2sRn2AiTQu1c8HIOou
 WRbLoYjx9tR6vWM7zQ4HSfyGGcfI2/NQ6dh/22qaIJ+MypeFIsWRfzDGzG2PHQ18n3OferEM
 pa4vptcrnexFvVaMF0NkXFKu5vwFklIZQoU4UAKgqzSjSiEPyligQtGMyja4YFVwxUBl8Wbx
 M4LW/ODfQF02TucnL0gB+Uc2/xeyXEjLhNOZmfwsxW4IUBNooJixMShEiy++uMJDEqiN0aQG
 JOZI7C1o62oGmo8X2N1WVmPRJBEl1YiY+QeE9ilEs2FwfRWZYn/+6yU0xz41erYiJea+++Km
 RijmUyxIbyC7Sx4GQfN/KLW1j2s5PXzEj6Z6v1XsW4lO7YklRRNOdxZER8eD+7YSCdsTwa4F
 t+VA==
X-Talos-CUID: 9a23:x0CT82wNl3CEj71CVkmtBgU1A+MoSD6A4E3ULn2CWDtyU5iqZ22frfY=
X-Talos-MUID: 9a23:W/gM7QYKRlKAZuBTuhjei2lOEvZTwr2cERAhtqs/vdu6Knkl
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="110287718"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qrk8bSQHTzdzlHYqqbQsxXSS+YV8LOYSk4miGAJzizONwQS8JcSCgKBeey0CrViFXVaGYgMMIpEiiNxx2Pw5D+c9fHW/7QLdeYNa5fKwqr9e10e4Cl2Weuu1sTgTEfPRh4bMCw7dk8SkN+9w7VxchmQs9AdGZiad6f9ZvCkrjCx6medDX9D98f4sYBMu2asChGsXyBUZs+xLOAxTxVlglsFkWOTjaYXpKXF2QW95eWzbmSOQ6+KyDssbFJ/V6DYf1OE/RuHMJINCWXXpT4jgN+C73TOUN/ErBL3U+wPp6IlVw2tqHqTdXmYFIj2XuNfrkl4wVsyEf9Rl/oYkOZcDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kf6e6xuLsE0l5KJi49O5tulDMMCfKntruNGAkxmvoEY=;
 b=avE7O3nyofZMUqu5yyc/gCmd0u0nsGHeQMsMaiyrMbWHjOLlx8gsdnDpYZUZJLucSOIafst0yGtPTIhd3pijPxwj5BW9NrJlVEFTXK01Jg54/Ahuynr23I3ltukYkAnSgId6Dl+DHPfAHI/7m9st8URB2sH9+ZQIQ1miulJeVv5HQiwtFh4jmNYAMiG/Xz/pM/n7mYuSHXrbTk49HwsNQ9k+b0DIKyyNbEiNVXsidlMGj+bl8XRNmbiWXfRb6cgMi5iDUHCgrGJWQPqL/40IPp0Ziz+MUc+HgO21f/RjyZSoPY6FG0/nQx7zxkycBe1mxYT3Fk4C8OVCKII3F/N/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kf6e6xuLsE0l5KJi49O5tulDMMCfKntruNGAkxmvoEY=;
 b=E2D/51umChD67baLcQqn3tLDb8qeOeAngZQd2JJ93issaYvDVYcYUw9/o80H/noojIuapGCpZVTDLP2QAV4rXKSjFXjyuFVEzvoeP/3BXq7cONubNHC1MsNMdsHNjzKD4RnkN3VoAF6dGum6mlthSeTjW/eiBunMiWQlcTtfqSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e9e60c7a-2db5-3985-356e-3a039e44d1a1@citrix.com>
Date: Thu, 4 May 2023 12:00:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/ucode: Refresh raw CPU policy after microcode load
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
 <20230504102607.3078223-1-andrew.cooper3@citrix.com>
 <ZFONUdkG2ow9uckX@Air-de-Roger>
In-Reply-To: <ZFONUdkG2ow9uckX@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0441.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8365ff-dc0f-44a3-a98b-08db4c8ebbeb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Ue5BuW7t6nQ8kRPetenfUcP24CJg2T0aXN8Rj1Zb75gx4EPL8oCK3QHWtTMzNg3nlER27sEikOPHwgHOKqzrJA30O/XQO0oOOPQDP5LX3KRQG7YpcvumDANNkEoMWZ6V/XS5KdJ0KolSy8AJT6sAHqAtUZCOJ9nLjdbIpXVyfy1LtIaXDyhO0HZSb+b8dp1Fq6k3aHnXqdGmIrM0sfdP6lvsOBOEw/k44IUpLGnnTp32cl7KaLZnjxaOPSq/1r316F4BOdCs+07JM3wdNYPhdkcyv7iaRwmlbFG4LcQgq3Vcyaicp8CxD172I19IAhdhXKStBAQUC7Ir4PPJ6z1r17nqWR2tmorflBHYl2pByH0aVSpvJgA3DasBnKmlMmHJuYP0yZv1tw46LK1Q4J/TpPotuwXHhfJHQ5ShN8TXSskbz4VGRsPDz3kiY8tNtPnv2HKpc+SR/gHjCJaX8I+U9KgmssS1ociVLoYvJAzRwPsFep5XtzKgg/pKKzhaUgK17NbSAt9lAlHLtzAAF7CRbgsmwEY9I5M6yORw9abD1dBiOAvswqScudYC0pn9A6dZixKSeHK7bZkpD9wGF4UT1Qu4ZyYuyMXrBBnb+rMtFkcBpRrIJ+7SOmTL/1nkeHMYebOhZk2cbIJH/qWraD4oA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(53546011)(31686004)(2616005)(83380400001)(186003)(6512007)(6636002)(6506007)(41300700001)(66556008)(4326008)(8676002)(66476007)(66946007)(6862004)(8936002)(5660300002)(2906002)(82960400001)(26005)(316002)(478600001)(37006003)(86362001)(54906003)(31696002)(6666004)(38100700002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU92aHJLMmVIa0JrVkdQbUZsYlpHYk80V0JIVERwMEU3QnNIdGJzUmo1bCti?=
 =?utf-8?B?L3ZiVTBpMXBNTy9JOWZBd1B4SDBOQ0M2VGhESkhrR2ZKNzdyM2Y4K2RjQkZW?=
 =?utf-8?B?NVJJL0NWRTlBL090OWliK0ZXR2t0VytKQklSZk9PejNiekpYZGpCMW95SmFk?=
 =?utf-8?B?UjdCT054ZTNzbDBqejZjdGk3Z25zMWF3Z1dEV2pvVjhwZmFuZ0pQZEdHTEI5?=
 =?utf-8?B?TGJ5NmovOEdvakpXTXdZUlc5dWZFYlFwYW41d1U0enlkb3lLR3g1K2tqTW84?=
 =?utf-8?B?Uzl2SUZ6d1I4K3RPREgrT3BReFVLTzNtcWlBRnpTYlBCL29YbnVBMmh4L3Bn?=
 =?utf-8?B?eVZjQWhwSGlOSWtlVFlPRmJSQWNwQ1RiVlluSk94TW5hd3JlUnNLUVkrcFIr?=
 =?utf-8?B?OTNreTB2bmwrck5VZExJZ1I2bk8ySFYzaWdqS3NGYW1zY1hNSW9MN0JuajFM?=
 =?utf-8?B?TTdrc3dtZlhXRUhxSndFdjV3ZWxnTlV2Vm1IRFpEVTdrcDk5Vk5yeU5xMktw?=
 =?utf-8?B?cklhczBlNjN5YzJ0ek8ydEJaRjBvWFVzMmhKNTFZRllKNlQ2cHAvM3NRZzhH?=
 =?utf-8?B?bE9laHRxeXFuNDQrWGlLT2NTZkRSM1F1Tjcra1dKaU15aE1DTjlrVEwzdTdS?=
 =?utf-8?B?QUxzR3JYc0svSllVQnRKSUNKbGN6c3hMOCsxOTFXRHg4SUd5em42aEk5amlt?=
 =?utf-8?B?YWtnMVhiK1FHbUNTNzhmbG9wdDR1WlVneHorSkxJSis1YTRzeWJsR2Jnck9V?=
 =?utf-8?B?YUE3NVlIR0VYSmxFcW9tTDExSlp5STduK1NqNHFvVE1oR1dGT1E3cWFxRUg1?=
 =?utf-8?B?NU1Ecnh2RXhKMEtsRmNWdURVanY3dzZnWDVKNlNyWXB3alNxajFHeFVVcldV?=
 =?utf-8?B?blhYN2FadWdZL0RjcnJEZlRBbGRPYUx5d296eS9UQlMrSHk5bG04QW9XektW?=
 =?utf-8?B?YmFUSjRXVlljRThPMVFna0RuNEpqWkRtOWpmcWcxOUovUXE5UTIweEpPYVd6?=
 =?utf-8?B?dUNkRGJBVjdBT2p6dnlLSGg2MFM1SkR1azFJVVZmcnlwU2NDaVBVN2hWSml0?=
 =?utf-8?B?SVFOV04xL3pTd09nWU8vS1RvQVFOTGZ5akNralVNRnhONTBJZjVPTURIWExv?=
 =?utf-8?B?VGQ4b1dFd0xvaHI4anRSWlJzR0R6bXE2SnhSYUJrNjVCeUFMMWV0MldtVi9J?=
 =?utf-8?B?Q3hZOU9BY3JqWmI1L1JhTGNNTE5vemJxTjF3L0N3RGpQeXE4dHNhR25mc0Q3?=
 =?utf-8?B?MXBybDBSOGVlSmRTdVM3cHhONXVFWmhYYjh2cVNnZGYzU3JTVlpuQ0dJWGhH?=
 =?utf-8?B?aVVaMG0zYkxTeDZhclVGKzlnTkoxenl3TW9WYjBEVzJZUnovUDVFcE9yeWc5?=
 =?utf-8?B?dWtvU0lOdVpjbE5FL2tvV1kzTEtnQ2ZlZy9pU1VBeDFiYzU1ZTZzQS9vbEtq?=
 =?utf-8?B?WlcxUGJPeHlOZzk0Vjd2blV4R1ZZWGNPYVJpdnJrZnczSDZrbkVHb3UrNE1O?=
 =?utf-8?B?SkEvVlZtRUVOMnZORUtqMDdCbGp1bDQ1NHFiSXFXaHNZS2hQNEFudEpMOG8x?=
 =?utf-8?B?NmFZMFgvd3dhbTBiVEl2dURRTklSZlZhRm1OcVdvNzhZZ1IwUDN1ZE92VjVk?=
 =?utf-8?B?ZUFYdkFhaDR5TVp3ZWVJSzg1N054UThtTkJmSWgrbnI5RG5PV2Z6dDdnMjZK?=
 =?utf-8?B?bUVvRTMvSFdUUXFFWUh4Q01TQXRmZk9tRENjdHFZbnVPbTZRUXhUUTlrZ2Vx?=
 =?utf-8?B?VTRuQnNudnFBSHJFeldOUCtoemowMEQzdkZmN1BlMktKYkJBdlVJd3poRGpn?=
 =?utf-8?B?MjlCZ1Z1TnJLTHFOOGZ2TTY3NEdXVmV2eE9ITFl1Wnc4UkhRZ01xc0dXTks4?=
 =?utf-8?B?UHZvNkZ3Q2tYWGlIdldrblkzNlIxN3JzNFdPWVZKUjJaVGIwTndWcDBkeHhN?=
 =?utf-8?B?alhEVVdTN2lCUmRvM2FtdUtlK21JaUNYRnhUTE1rRkhXdzFaZzRkQkhzZ0dp?=
 =?utf-8?B?Tm5GNUhEdFBkcmYvOW1mR2ZxYjZUNGtaNjNTVkRnWnhJMC95Wml2TDVIUjBo?=
 =?utf-8?B?ZXRFclAwWi9ZdDNXSXVIU1VSSFRIZUJycG82V01idjBmMGNpUHQ3d3BDRnBk?=
 =?utf-8?B?NlFwYlYyYWNuWW9LenpMMFJmWEI4c28vaVpLQXIwTmhVS2RHd0pTemU3RjFS?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bOtmzGK2bBs5p4SUJXBkwJmfRhgQaWO4yz0ptzGF3SO7/RpcZ0KsjNEnbMAEMa0OLsF5zjy/3GwEeY00ZxzMF+qIV/45gjGvcJ7dXLY+JHoKBUneOOMShjs1d4H9q0WE4T6rkOQyRHB/Hvv3oQF6ocRco7Dw7yq8WRjhffIr/GVI/kxHYlJE0+C9avryfESET1yIcK7FiCFO6kOzobuAh5jbyh8pPWZS8X3dEb/o1mMahYS0NoPh/ga2Xc8WgXwTLQFmrqIQ0OVo3fctYjtbDVOKavKHclKrbpl0af2fykO61yye9MxO+7FfZG6vYzl2LTEJ7Rc1nejOpBwBk43Zq4XenbkB0frINBWeTmntJcREeNDjgrXu8U57AJtiOpIt0Ytk5cYnk1Md5VZL9+jakprsHhNw7/E6SxKm8FmGF+5cembKSHbK5fdsC4dO8KykkrU57eIvWPCr2mSJCw48IgGpsgIq4mnhTWYggUIRZZ1wHi7X3r2bvJ2qCYwMpmXbHVU8tZ5CONfBh4mx5apVOU+FMBLKSX6Ez0QQ1pFwUwyXw8ardDhsswdeXBu8Rg7g4gPevMEA/yMlJ6kugZDyLR+/zU5yYmTPteiNjbQWZwbK96OR5XMyD70dEG/aHP7ydnSboFR2tNl7J3zmfM9OrgeexpHdwGMs85aaGVDBLl2SNSP9F/hAK5SRnaSXJRQvcYacDA/7xn6zxMDjZoOtolNpPWa1Jhepuba97dS9Wu59ZY0K32SXmqsU8sNvsfq+LTKS9+Fbj6OW8yF7L0INoQVlKDsrFF/sAJFwXjX64m5gLy/UanXZpfMwb4K31wf/
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8365ff-dc0f-44a3-a98b-08db4c8ebbeb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 11:00:12.9018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvV309/W5NsM/y4g14uMDgvugpWDTFjPQ6iqyBNMMXlzBaXIzIxr6sHP9c2HtCWfWallPG71SVpZkmzfwkXUTLuSIlgwFKZtFQiI43ij9Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7224

On 04/05/2023 11:47 am, Roger Pau Monné wrote:
> On Thu, May 04, 2023 at 11:26:07AM +0100, Andrew Cooper wrote:
>> Loading microcode can cause new features to appear.  This has happened
>> routinely since Spectre/Meltdown, and even the presence of new status bits can
>> sometimes mean the administrator has no further actions to perform.
>>
>> Conversely, loading microcode can occasionally cause features to disappear.
>> As with livepatching, it is very much the administrators responsibility to
>> confirm that a late microcode load is safe on the intended system before
>> rolling it out in production.
>>
>> Refresh the raw CPU policy after late microcode load appears to have done
>> something, so xen-cpuid can reflect the updated state of the system.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I'm not fully sure it's worth calling calculate_raw_cpu_policy() if
> updated != nr_cores, as it's possible the current CPU where the policy
> is regenerated hasn't been updated.

As said previously, updated != nr_cores may exist in principle, but it
is not a corner case we should care about.

If the system really is asymmetric after a late load, then it is
probably not long for the world.  There is nothing Xen can do to recover.


It is awkward that we're not on the BSP when collecting.  I think that
part of the logic didn't survive the rebase over switching to
stop-machine.  I'll add it to the gitlab ticket of minor ucode work,
because it's not the end of the world.

~Andrew

