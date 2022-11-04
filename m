Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD8A619999
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 15:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437604.692053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqxbL-00049s-KE; Fri, 04 Nov 2022 14:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437604.692053; Fri, 04 Nov 2022 14:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqxbL-00047w-HI; Fri, 04 Nov 2022 14:23:19 +0000
Received: by outflank-mailman (input) for mailman id 437604;
 Fri, 04 Nov 2022 14:23:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hilw=3E=citrix.com=prvs=300b5b1ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oqxbJ-0003sR-Lf
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 14:23:17 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38bacf90-5c4c-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 15:23:16 +0100 (CET)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Nov 2022 10:23:14 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6515.namprd03.prod.outlook.com (2603:10b6:806:1c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 14:23:13 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 14:23:13 +0000
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
X-Inumbo-ID: 38bacf90-5c4c-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667571795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=VYL+hzjB7lbIlUEHE09YaODWT83Im/OH6H2agw+itPc=;
  b=Z97IAN/u8bTNXjzxpvdMvGxyVUBfw08fO7JgxPn6i6piFhatEiekPWoN
   gqZDbnTHq3en2B5IQfiwFUPrskCzzy1W4rS9zOx0Hih7fblzYROHSAzSp
   +QIIE0VW1AM7mGP/9tgHvzyTIWZonGjIVp9nAXeox/7pNtu3BTa87XBl1
   8=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 84179918
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HhXwpaBNLes2mBVW/93iw5YqxClBgxIJ4kV8jS/XYbTApDxzhD0Fn
 WoaCDuDaamDYTT3c9olb4y/80oB75fTzoJrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpA4gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5LcwLGsW8
 rsjFBcJdRyOg7K/na2URbw57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrvgA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WrZqy3917af9c/9cLgzH5Pk/aFXuw2WxW8DBDgnBFnh4ubs3yZSXPoac
 ST44BEGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy65C24eX3h+YdopnMYsQHoh0
 Vrht8vgGDhHoLCTD3WH+d+8sjeaKSUTa2gYakcsTwEI/t3iq4EblQ/UQ5BoF6vdpt/oH3f2y
 jODrik7jp0Si9IG0+Ow+lWvqzGhuJnPCBI07wP/X2S54wc/b4mgD7FE8nDe5PdEaYOGFF+Iu
 SFen9DEtLxTS5aQiCaKXeMBWqmz4OqIOyHdhlgpGIQ98zOq+DioeoU4DCxCGXqF+/0sIVfBC
 HI/cysIjHOPFBNGtZNKXr8=
IronPort-HdrOrdr: A9a23:F1jHCqyKe3hpUU+USLB1KrPxvuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhORICOgqTMyftWzd1FdAQ7sSibcKrweBJ8S6zJ8l6U
 4CSdkANDSPNykcsS+S2mDRfbcdKZu8gdiVbI/lvgtQpGpRGsRdBmlCe2Wm+hocfng6OXN1Lu
 vU2iIBzADQCkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iosKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCulqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv60vouqhNDqWs3N
 60QpiApIs+MPP+UpgNddvpOfHHbFAlYSi8R156cm6XYp0vCjbql6PdxokTyaWDRKEopaFC6q
 gpFmko/1IPRw==
X-IronPort-AV: E=Sophos;i="5.96,137,1665460800"; 
   d="scan'208";a="84179918"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZW1uNpL2RIz4FzK0P7NXDgXTtzt8F8pYib+/gK7XxV5gb7xvPUEskJtLGypNMgn5XL8/dQ9dq7X/wqllQnofTfR6R/SaC20R4yCAFZVnLfBLK3CGEBAoq1q667bQXooija8i0kMalsykNRa6q2I/vxbdNDdQsnYC40vb0NnlHyPommGw0wg21j28/SHq0glJh5vRz6M15IfPdODoCXBzOKqQFAQYZWbTXPUqmJ2MsgeVxrjlG4sVOj+wfU/mSg1FWE4y2lWELnj4V133jhB8WoIUGZr7NHFOh8XyVcxb40SS/v/hu6eRPZCrKVuhdqxtUtEhwF0N0nC6D6h6KFJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0VcqjNzyHIxHH55hlOLAVdp/ZJFXM8586OjJ/vmBCI=;
 b=nAtH+xQkhuF9f4kMzwqaymzYe3vruj9HdlJsS7PbB+3lZtCRgM2X7nyxtobAjTZfHlzPOS6VliJqChQtGCyXmJAgbpyQiYlnul0pK0X21iktlCAg7fDOUYjTFDl/x35zNsILKotgvogR1ZYtu0DQtnsK7YFdfHEfITMr9LETvF1kbhPgXy7Sg0Xucnb2hW48UzIibCHFWfDzlbtklAEP6yJQPBKFBV6ENy7o8lTDwqbOSCq/nx9qymW4yWcbI0my5uIeYsbnjM+WXvHg2HAoOXVWBE9EKnMCGsxNJQURnd/QsJUfBTLnBKcvkY4tXF9tQcJmxVqLEsNUO8wK2ybAig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0VcqjNzyHIxHH55hlOLAVdp/ZJFXM8586OjJ/vmBCI=;
 b=f9+F9yhJ6a4bxLjU2gx+0AAlYFloArILsLYR2kseCVlFORt7EwahOM+bYwuIizojeD9qfZyBc9Vu07sVxlMUpzS5i2/1qkIOE3vV9P924KpbKCyT0mDO07hBXSzLU5CO4pOMwB3FUikRNu0Iib0M6K8Hfk4V54kn4OYg1T4/LuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH for-4.17 2/2] hvm/apic: repurpose the reporting of the APIC assist options
Date: Fri,  4 Nov 2022 15:22:35 +0100
Message-Id: <20221104142235.36556-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221104142235.36556-1-roger.pau@citrix.com>
References: <20221104142235.36556-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::26) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2831f5-099b-4035-1405-08dabe701b59
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+vcWNFWEx/JM/lHqulE0m2hQegcO5NY7RT68xMDFH4BaDJdSR0L/pDVPA90qYgWlESoVLnXJYgmNpN1XZp9bOtv/I3G3ECV+kW8A8QRzke4ykduAin4hBmeAR7Kvsh3Tq/+4irCht90A7gAgE/F6dbZZOqjWpr07IzqEBQi5Uv+ZaHHAfopuAsFDihlLLHnsrTlxWn2ymssxrKNQxT8fT11miFUJkFSkQbG2ccJLASdiZPl7+1GcVzVHSUX741epSAscY58sJEYRbzBueJYEl140MgcJbI9WbZcCURqoQgUbhCEvC467/acyE/AzZTUhyDYNUPoaGXw0IePBxNrLZ8/CmpJg9upmgwfhlzJrNi/U9t7u5hUEVWnCGG0ihcMf3c9OGbQPq2z3x/JdfygKACgRV0in9DvKoyMzoKbB7Y3au50OdqvQvmRkK3siMNts7JLafqx14YS8il+Be6tQSxjnQEbdHZPhDb5rRXdhrt7FFOust+xClelCBs4KLC4YUZHtDdFkaRA15y+OiEpaEbxdG9Z6okraYli39jLrKS0SDNunXk6u/gxZH1ocm6GJTFFCdeWtX/2ZD181HDNmdv7ranIknJWJwMYMSEF3nOrnjqxVp5211GHlVIUg1VeweIy7/9YAx7fqwHHYXExkZ+kxKeB2pKhvFd+P9PfB0SjzHlFmDCTQqyoAJzA3R+RZrPijFrNl1EGehLvQXyH3Kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199015)(5660300002)(82960400001)(38100700002)(66476007)(66556008)(66946007)(4326008)(316002)(8676002)(8936002)(54906003)(6916009)(41300700001)(36756003)(2906002)(6506007)(26005)(6512007)(6666004)(186003)(478600001)(6486002)(2616005)(83380400001)(1076003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2lXaDdwOGg2ZVM4dGdNQjBmZm9lWW1JQk1oODg0Q1pnK29YQ3ExaWJlRllY?=
 =?utf-8?B?dzJaSDVBNVZ0djJUY245c3dwYy83V1hBQnBmOVN6UnRVbDI1cGxXYkgwMG5G?=
 =?utf-8?B?UWlaU3Exa1M4WXFacFZhSzd5WloyOEhsMTlwblJ1UWswOHdsMzU1aHcxUTZP?=
 =?utf-8?B?OUlVYXR3MEl6UFI5a1dodkFnZGtXSmdlVnd0T0NJYVpoeUV2TjVabXFYSERW?=
 =?utf-8?B?UlR3M2lBWjlSRzlPQzZZTy93d2VyWXQ3b0RySWtMOURqZVR4TlgxMTVHYmdJ?=
 =?utf-8?B?dDl5NGRZb0RhQ1RGV1k2YXBtVFZkTW9rSWtFRjVUaDdhbjV0VHpvQ3E0ZFRz?=
 =?utf-8?B?Rk5wT1NaSTcwRC81SEcyOTBvZHJSL0FiSk1XNnllTGhaUHBMSjFOeUlVUmYw?=
 =?utf-8?B?VXU3bXRkRk5UQ0lOREtIV2F0b1BNNVpiL1FrMFA1clJqL2NhUE5obGN6NDVL?=
 =?utf-8?B?WXQzYlp2WUx3V1Jad0dqTnliWEFlWjNueGE1QWFPcXBSeFk2RWxDRW4xSDN4?=
 =?utf-8?B?N2c3bmtjaVBxQWN6ZWIwTnd1MnJvMnhiM1Vlc0ZhckpRdGNiaVZ2MWZ3MW5I?=
 =?utf-8?B?RzFBY1A0U1FpZGkxRkJWMGxTNmtoOVRLM1dwMVBMSnl6L2g5WHp2SW8xaVQv?=
 =?utf-8?B?Ui83VERubXNoNUI5RnlsaE9hSGNZOEt2dVUyUjJ0SWZYMW1tWG9oZnQwYkt5?=
 =?utf-8?B?SkhNNkJuR09GeUdhUWFSbTdKd2VuODhTNHU3dmZGRlYydGYxbEFoTENHall5?=
 =?utf-8?B?Q1piVjlybCtrUThKNlFuQVRFUFo2OU94aUdheDZia0JYLzYySjZaM3BibXI4?=
 =?utf-8?B?ZEhNdFlUM0xQTldBaXh4Skt6eHQ0SWQzcTFpNXlKRXZlZkVxazA2elF0bDRF?=
 =?utf-8?B?QUNFZHlDV2pJZFhDRG9VU1p2Ym1KaUdpaW9aTU1YNStKdWpWMjlhWFBKeFAz?=
 =?utf-8?B?RGt4UUtyY1g4N2h5SnRPK0pReDVCRFRrdDc5bG1oMkZEYmVjbkFNS1IwWGpS?=
 =?utf-8?B?YzgxZUdmMWNNQ3NReTI5NFBuYXF2QjJzVmtEbkxKZmVXanoxOS96TmhHemtF?=
 =?utf-8?B?QUNlNERtbWVybXhxZnpYcHVxaDYxNk8yM0hjaHlZbWhZYmZUWHd4SnFyRi9r?=
 =?utf-8?B?VmxXUDl6RnJ4a0ZIQi9DUHExTXpFVWR2U1cxK0ZYQWV3bHdJUFE4WnMydGdJ?=
 =?utf-8?B?eWdxSFdRQkpHZ28raDJOK0ovU3lOM2VTY2V3TXZCWnZYbFV4azhkNGQwK2xx?=
 =?utf-8?B?KzQ0MzQ5dUgrRmoxZ0JEOGJtc3hoQng0cUoyd1hlMm51N1M3bVZWclRQdWNQ?=
 =?utf-8?B?eTVrNEovUnNCT2U3LzU2b2w1T2h5WUFaNlhNQitjY0VmeWZXU0h5MzduK1c5?=
 =?utf-8?B?K1lHSEJBcEtGeVV6NkE5NHViaXk0SHRpdmN1MmFpYmFzekJxQjB5cUNTWUdl?=
 =?utf-8?B?QmJUK0ZrcGdGOEdqMjVrclNZVzBHNHFjeHRaSjd4MTlPemg1MGdGU2x0ZWty?=
 =?utf-8?B?RDBsTXRmQVhWd3JiaGlxVU1ITE5VRVZyQlYwMnJGVUFTVzFoZWhibXpqT1V3?=
 =?utf-8?B?Y2pkYUExTWhIZ2VKNVNvRGZKdDNVWmdrM3VVcWVWSkZ3bWtSd0N5TmNKV2I2?=
 =?utf-8?B?SjlCaVdIYjlXcU1YTHJvdDlKUjRCbHVoU3Bja2hDTFJTZ0R4OXRqUEVxdHBI?=
 =?utf-8?B?R21uMm5wRnB3VWVoUlZhMDlaYTJuOVRtbzBIUlY5N3VyaUlWS1dMeVhQN09m?=
 =?utf-8?B?bjBwSEdxRnFIZDZkd2NvNmZScHJwQVJoZk5XcUptTnoxKy9ZVUpsVldGOHVE?=
 =?utf-8?B?WTRiSFFyNythTDcrQlB0aWx2d2Noa3RYc1dINnZXTmF6TkJxZkFOMlo5dHM5?=
 =?utf-8?B?aTE5ek9MYWRaN09MM0IzblljbTlnTHdmVksrQzNRengxSFFRUlQ5Z3dJRHBw?=
 =?utf-8?B?WDFtK0VvZEhDVU9Pa1hFWWVKNXN4cW9iV2ZmZUVXcVB5c2ZwZjJyVmZNNkp3?=
 =?utf-8?B?MkpNOHNSU1ZnT0ZkVmprUGhuTjU0WTVUdE5PTG9Mc1B4R3Q5NHRmWjI0QzNo?=
 =?utf-8?B?cXBkUDdJWlVSUVJqNU1YODdzbFVzc3NTeGc2bVlCRnFVS05EYTVTdzBaYXJr?=
 =?utf-8?Q?K6nUcPJdiqcmxABu0wtB009FL?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2831f5-099b-4035-1405-08dabe701b59
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 14:23:13.2189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btSEP/TdS6ViwvNQzy7T6T3qutnwb4vU2L0tdaJCDrMRqnyaaE5eeh7pkYVPIL5KbxdnN6m1A3N9NQ5a2CTaiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6515

The current reporting of the hardware assisted APIC options is done by
checking "virtualize APIC accesses" which is not very helpful, as that
feature doesn't avoid a vmexit, instead it does provide some help in
order to detect APIC MMIO accesses in vmexit processing.

Repurpose the current reporting of xAPIC assistance to instead report
such feature as present when there's support for "TPR shadow" and
"APIC register virtualization" because in that case some xAPIC MMIO
register accesses are handled directly by the hardware, without
requiring a vmexit.

For symetry also change assisted x2APIC reporting to require
"virtualize x2APIC mode" and "APIC register virtualization", dropping
the option to also be reported when "virtual interrupt delivery" is
available.  Presence of the "virtual interrupt delivery" feature will
be reported using a different option.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I find the logic in vmx_vlapic_msr_changed() hard to follow, but I
don't want to rewrite the function logic at this point.
---
 xen/arch/x86/hvm/viridian/viridian.c |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c          |  8 ++++----
 xen/arch/x86/hvm/vmx/vmx.c           | 25 ++++++++++++++++++-------
 xen/arch/x86/traps.c                 |  4 +---
 4 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
index c4fa0a8b32..bafd8e90de 100644
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -201,7 +201,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
          * Suggest x2APIC mode by default, unless xAPIC registers are hardware
          * virtualized and x2APIC ones aren't.
          */
-        if ( !cpu_has_vmx_apic_reg_virt || cpu_has_vmx_virtualize_x2apic_mode )
+        if ( !has_assisted_xapic(d) || has_assisted_x2apic(d) )
             res->a |= CPUID4A_MSR_BASED_APIC;
         if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
             res->a |= CPUID4A_SYNTHETIC_CLUSTER_IPI;
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index a1aca1ec04..7bb96e1a8e 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1136,7 +1136,7 @@ static int construct_vmcs(struct vcpu *v)
 
     if ( !has_assisted_xapic(d) )
         v->arch.hvm.vmx.secondary_exec_control &=
-            ~SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
+            ~SECONDARY_EXEC_APIC_REGISTER_VIRT;
 
     if ( cpu_has_vmx_secondary_exec_control )
         __vmwrite(SECONDARY_VM_EXEC_CONTROL,
@@ -2156,10 +2156,10 @@ int __init vmx_vmcs_init(void)
     if ( !ret )
     {
         /* Check whether hardware supports accelerated xapic and x2apic. */
-        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
+        assisted_xapic_available = cpu_has_vmx_tpr_shadow &&
+                                   cpu_has_vmx_apic_reg_virt;
         assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode &&
-                                    (cpu_has_vmx_apic_reg_virt ||
-                                     cpu_has_vmx_virtual_intr_delivery);
+                                    cpu_has_vmx_apic_reg_virt;
         register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
     }
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index e624b415c9..bf0fe3355c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3405,25 +3405,29 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
 
 void vmx_vlapic_msr_changed(struct vcpu *v)
 {
+    bool virtualize_x2apic_mode = has_assisted_x2apic(v->domain) ||
+                                  (cpu_has_vmx_virtualize_x2apic_mode &&
+                                   cpu_has_vmx_virtual_intr_delivery);
     struct vlapic *vlapic = vcpu_vlapic(v);
     unsigned int msr;
 
-    if ( !has_assisted_xapic(v->domain) &&
-         !has_assisted_x2apic(v->domain) )
+    if ( !cpu_has_vmx_virtualize_apic_accesses &&
+         !virtualize_x2apic_mode )
         return;
 
     vmx_vmcs_enter(v);
     v->arch.hvm.vmx.secondary_exec_control &=
         ~(SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
-          SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE);
+          SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE |
+          SECONDARY_EXEC_APIC_REGISTER_VIRT);
     if ( !vlapic_hw_disabled(vlapic) &&
          (vlapic_base_address(vlapic) == APIC_DEFAULT_PHYS_BASE) )
     {
-        if ( has_assisted_x2apic(v->domain) && vlapic_x2apic_mode(vlapic) )
+        if ( virtualize_x2apic_mode && vlapic_x2apic_mode(vlapic) )
         {
             v->arch.hvm.vmx.secondary_exec_control |=
                 SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE;
-            if ( cpu_has_vmx_apic_reg_virt )
+            if ( has_assisted_x2apic(v->domain) )
             {
                 for ( msr = MSR_X2APIC_FIRST;
                       msr <= MSR_X2APIC_LAST; msr++ )
@@ -3432,6 +3436,10 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
                 vmx_set_msr_intercept(v, MSR_X2APIC_PPR, VMX_MSR_R);
                 vmx_set_msr_intercept(v, MSR_X2APIC_TMICT, VMX_MSR_R);
                 vmx_set_msr_intercept(v, MSR_X2APIC_TMCCT, VMX_MSR_R);
+
+                v->arch.hvm.vmx.secondary_exec_control |=
+                    SECONDARY_EXEC_APIC_REGISTER_VIRT;
+
             }
             if ( cpu_has_vmx_virtual_intr_delivery )
             {
@@ -3440,9 +3448,12 @@ void vmx_vlapic_msr_changed(struct vcpu *v)
                 vmx_clear_msr_intercept(v, MSR_X2APIC_SELF, VMX_MSR_W);
             }
         }
-        else if ( has_assisted_xapic(v->domain) )
+        else if ( vlapic_xapic_mode(vlapic) )
             v->arch.hvm.vmx.secondary_exec_control |=
-                SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES;
+                (cpu_has_vmx_virtualize_apic_accesses ?
+                    SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES : 0) |
+                (has_assisted_xapic(v->domain) ?
+                    SECONDARY_EXEC_APIC_REGISTER_VIRT : 0);
     }
     if ( !(v->arch.hvm.vmx.secondary_exec_control &
            SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE) )
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 7207390118..5c0aabe8a3 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1124,8 +1124,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         if ( !is_hvm_domain(d) || subleaf != 0 )
             break;
 
-        if ( cpu_has_vmx_apic_reg_virt &&
-             has_assisted_xapic(d) )
+        if ( has_assisted_xapic(d) )
             res->a |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
 
         /*
@@ -1135,7 +1134,6 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
          * vmx_vlapic_msr_changed()).
          */
         if ( has_assisted_x2apic(d) &&
-             cpu_has_vmx_apic_reg_virt &&
              cpu_has_vmx_virtual_intr_delivery )
             res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
 
-- 
2.37.3


