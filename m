Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D032F7BB875
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 15:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613595.954223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokSr-0007dc-KY; Fri, 06 Oct 2023 13:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613595.954223; Fri, 06 Oct 2023 13:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qokSr-0007ZY-Gd; Fri, 06 Oct 2023 13:01:57 +0000
Received: by outflank-mailman (input) for mailman id 613595;
 Fri, 06 Oct 2023 13:01:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qokSp-0007X6-T5
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 13:01:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83c65d31-6448-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 15:01:52 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 09:01:49 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BL1PR03MB6024.namprd03.prod.outlook.com (2603:10b6:208:316::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.39; Fri, 6 Oct
 2023 13:01:47 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 13:01:47 +0000
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
X-Inumbo-ID: 83c65d31-6448-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696597312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=YjeDujQhkCSuotTmusn7paGxFGmyKhPrDHPA33kBIm4=;
  b=BAe215+o82Di3fEQwSUMDhbsRoz/oYiuGWFo9vEU35BiDMVsgtWTihvx
   s+mKhXffeTHNQ38ANjtYRc/7OQvRpapI2vmX8jpL4ZvTdFNYPgmBIo0J6
   JmAYUhLZM+qCb9ZPA49uNUBuplsFs2qEp9SqZ4DadKO7xd2QD5TCeBx3M
   g=;
X-CSE-ConnectionGUID: Bv6MBkPWTUaSQC83zpI/Xw==
X-CSE-MsgGUID: AHSINDi/TGKhUBe7OGi3kw==
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 125254119
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:jGq7zq7kU4eKT5he9G4WvQxRtOLGchMFZxGqfqrLsTDasY5as4F+v
 mEYXW+Ha/6CMzH0LYt+adyyp0MPvsOHztdnGgJtqytmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPKgT4geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 +JGDRoOVi+/uuuN+ZnrEft0p4MTM5y+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojumF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx36hBd5LTezQGvhCqX2o50o/CVoqeni7nNO01WmRWolcN
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQPwrstUnAwMj0
 FChlsnsQzdotdW9S3iQ67OVpjOaIjUOICkJYipsZQkY59jupqkjgxSJScxseIaulcH8Ezz0x
 zGMrQA9iq8VgMpN0L+0lXjYhxq8q56PSRQ6jjg7RUqg5wJ9IYSjN4qh7AGC6e4addjICF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8wWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:YLL766k8auY2aYM1r6K4Arf0GUvpDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-Talos-CUID: 9a23:8GjBYmMOc11BFO5Dcjc50WQXIv8ZT3Tm9VyAeF2gKCFZV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AtltEJg70T3HFeMQHZKaipBrixoxBw5+PLmwM1qk?=
 =?us-ascii?q?pmMm5HyEvHBic1zeoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,204,1694750400"; 
   d="scan'208";a="125254119"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnMzNDRQq8o8TcWWguHw07fZkaPcaLuvv+zoCKL8D+ornZfO6eD9VmXRUUmD0P/2yomvWK1FyItNvvMdM9xINv0QNeLk3aLEEh5z/9jaCsL1I5e0RC2PY11HFqtMvPUR+eojs1F+s0v3v2vR4gIh7wl8wskKlX6K6U0yFwE3GuVaRrbQDzDWkXcyfllhk9gJuaKa9hKOoqu2wW0RSNKBNKtMd8lXDbA8bTkDSM92xAg/Odnn2Qj7pJuW1PqdIWcue3a1/PkZbosJ7fFx/5FTC4jnHdBSB6lBi1S1bMRpfgx4IGNZZo1vMEOF3ixXmvLx43VZZCejZcCSn1a+HFwbCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thBVzZHE25HD5UvaIrP9q3ANVbkmnqpnKglf4PdZI5g=;
 b=O/NGxsXNcSyi481lwWl1aPdP4ZZpPK38mbI8SJpVNc7fJzcsZaDRdTfKLPAxS35WYSeRHY684+ubNrrAyJatDIEBuK2PcM5xSy3bgf+hW5u8NvEFJOOk5tUyZBvg0OWJ2L9Geoc32numoBWhRrcsQYYctbLC5Iumm5FbIotdu7EbieNYjjHdfrjeifRAlpF8xhwy6NJUGmXPO1e+7W9Ede517zr2var5p8eF6p6ZPo71QPAJ8egAN6cBzuFUIjdqYkwi3dWw18fkmMlbQSelLyFw6EpWePlJ2Cdouhw2Lp9wXzUjXku6BhCJ+qscqdy2fmEmdfforODYk3V9akbdRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thBVzZHE25HD5UvaIrP9q3ANVbkmnqpnKglf4PdZI5g=;
 b=jvTh7cv7p/TSLw/YuO/0kZ+G9yHeS107kBSvNbs5YSq0uu9U+EoQPLefl2KUfV/CssV07blNPdcrUv2PaQ60u8yHW7Q1qJjAzxliHsr8D4LQ+DNOZdZkPh3ku8QKyF4wqoGVncMsYKFbVhoKagWwKc8MIOVQkvYVMS2wwC0kLxw=
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
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] domain: fix misaligned unmap address in {,un}map_guest_area()
Date: Fri,  6 Oct 2023 15:00:58 +0200
Message-ID: <20231006130059.97700-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006130059.97700-1-roger.pau@citrix.com>
References: <20231006130059.97700-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0324.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BL1PR03MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 99255386-b674-4109-6966-08dbc66c65d1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GyqUK8a882Z4hYNiTVVbpqW+6BqtwGKgS5WgBCITGd5shvPy2XalVQLu92H4H1+1KWccteCTwknHZcfuDFkPV2ZCbtE8wMsJh907QutxVQT8TAxdCB/G3Cu3VQfnKjBLiQwOXMlLxH1Yx0UZCiV1HJGrHUykgkr3xStUpmA2Dvb0rnq7R19KQI3NFz1beFB0aLM7xD8OF7r25vXq1ZxpFYd3uINdqoC2FNNEZInpJkGXKg3aBvgMwHVATCfTAiJftGPtbjcKhu6B1r6yLrUOlRYewV++/Yy+LJCL6BX016mNiJqogc7VrXhyBH458lzPVO+LY4HCK0E8bXv0F6b3c/G1hfPaB+Sd452iaEcQin6NM1f+jeJvA2UXzhlc2fDzeajqjrQ5UpbyFvyExHtl5bd5Z+Xfji0+/AHvzuISkxOhT3f68/dW8qCH8PFndypMwJijhqXYZTua/d+I9mLpB+gbgYMTiPW9c1kTt7M7BWeyM1ijrSi2TevCiUyi80Be2V3NTS0bZVf1AhZbEnq1JsDb+OTXtkCjjUKJuCW/bU7dA2qdk/ANV+CWzDju9bDB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(83380400001)(6512007)(6506007)(6666004)(478600001)(6486002)(86362001)(82960400001)(38100700002)(2906002)(1076003)(26005)(2616005)(36756003)(316002)(66556008)(66476007)(54906003)(66946007)(5660300002)(6916009)(41300700001)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0ZBcy9BU3Y4STU0SFVVc1htaGdoZ0NhNUxRYXJRMlpkc1RxUFdtWXNxYXlv?=
 =?utf-8?B?U1YrNFFVREJ0TnFiZnkvemc3aEk4dktSWGRreU80Vk13RUNlUGtMbFYrZDMv?=
 =?utf-8?B?ckhkUm1GZzRYZjJJWUZJQkNudStXZTFjdjNtLy92L1FDbkcxeFh0VDB4Q2U5?=
 =?utf-8?B?T2lOTW1xVVJFbUhaTjlWOERiRkswa3RXY3k4UERuMXhBYkxNSUJCSlR5NDBI?=
 =?utf-8?B?Z1pmKzVhQklYUTJrLzNJRjRIN1BaNjRuMzg2Vk9oWWdHQWdFeFNtUTY3ci9q?=
 =?utf-8?B?Zzl4NTRvTHl3Nm9yZ3AzRmNZVmRJc0dxelJjWXppSDU5S2tZZi9sUXVjYWFX?=
 =?utf-8?B?VUNjMDRLT0pLVm1xU083dWJnYkhXL200ODJKZ2d4Sk8xbmt5dVp0RHZEbW9T?=
 =?utf-8?B?VWdxMUtRdkkzaW9DMFkxVk0vWUdEZmRoUEJmZzErMDQ1NjRHUHdjUWxncjVG?=
 =?utf-8?B?SnlsWDFzVko5K3ZvOTkxOGFtZEhJQzI1eHk0KzFjWDZ6Y0hNcWxVZW9RU0t0?=
 =?utf-8?B?bTNZT1lWdWhQejltMk9Db0QwM0c0b2xjVzVuKzV6OTE3V3dPTmUyMGd5dXk1?=
 =?utf-8?B?cHRTUm5RQ1A2V2VXd1hCeWU1a3BhdjVQV09nK3NJWjFHVlZkZEhqdS9oQWdn?=
 =?utf-8?B?bmdldjZnTnJwbGdoR3pwZjBJVTBrcWd5TGNacUx6NXl3RDdpNnhiWjAvaEZv?=
 =?utf-8?B?YUhuaHcxTmVYVVBJajlDaUlYTHpoQW5hV3hiemNBVEFqWGEyaFVzT3k5SDM4?=
 =?utf-8?B?WW9TVzByVnBQbXZoN1NwSjN3M1Y2ck5wVGFueWs3ZjVWR1NYUksvM1ZObEdH?=
 =?utf-8?B?TzZ1dzB5Z09WVEZ2azNNNXFpMjk5NndBZTRrWjl6OHdQclpNYU85NWRBZFJI?=
 =?utf-8?B?Z2tQTjZFdmlLRVpydWlVemR1REZGQzlGZ0tZVEY0dWpreDF2RFJZR3pZa2dC?=
 =?utf-8?B?QnYrUmI5MEVLYk5aa3ZHZU1WdEgzTHo4Qk9JTmxISFFNWTA3TEdmY2gwSEJ1?=
 =?utf-8?B?RitWYTUvbjdxbDJUL0YySWw3a2oyYkZHL2NxeUc1Y1h2VXZQeGNxMlpZTVBo?=
 =?utf-8?B?ZUtYYlFyNkpkZ25zdWtnZGVxYm13UnFOZi9zekJqMFZKdTZWOCtiNmZyVEZx?=
 =?utf-8?B?U3ZpSnphVTN6a1JFNWU0bERYVnhmZ1RsQk10U0Ewb0tIN2JSMjRaODVMOU9J?=
 =?utf-8?B?Rzg5UkhyMWVTQzdSbzdSbkNVSHVFSGpsRFJ5WDdCOWJNenhXTXg4L09nK1VP?=
 =?utf-8?B?WVlTRHdxRnU1Ym50dERHQ1hyeFN4LzhadnZZZnNyVlFTUGFPV2lzNFp4VmI5?=
 =?utf-8?B?SDdiNGduRTFIaUl5RlhtdGd5NVZIcCtVSnhQOFZkVTFFWUN5VklCQm91R2NN?=
 =?utf-8?B?Mlg3UlF5eGw3ejQ0ZjdlL2RjeUQycnMwMURKTmtlb0h2THhYNmhmZDlCUE5G?=
 =?utf-8?B?eHYwNlBoL1dTU0dmMHl2aDIxVnBCNndKdTVRWjRrY0d0aEM2T1hhTGtpbXFV?=
 =?utf-8?B?TFNMU0ZDVXZEd2oxUkY1OXUxK3lkNVlMYkJnSXVpdXoxK3dmYWFLWUZrbnNi?=
 =?utf-8?B?WDhyZ3FWSzlNYThyNUlkTU9EdUJHcTZKVjg1M1BaUVExWVBPdDJNRnQ5ancv?=
 =?utf-8?B?Q0ZiRjd1Wk5TQ05mM3hyV2VGM01wenN6MSt4bDZGUUpIWlFmVnkvVkZYVEt3?=
 =?utf-8?B?cnRncm5TbXpZOEJZTTdjWVhDSmE0UmVxa3ZwZytDenMzN2oxNDhvY01VM2tJ?=
 =?utf-8?B?MWJDWWxmeExERUdhSzc3alhJMnZOWnZTYVU4cWxHbmc4Y1JXY1pmNW15bmtC?=
 =?utf-8?B?MkxxYzFxNi80TGFoSHIxV1BMQzlGaTBZcytJMDR2Z0xqMUpNYVoxRmtLcXc5?=
 =?utf-8?B?enBjOGlGak1kYUh4K2htd3lWNFFzdnBWMjdZMnNjZDFKQy9nUWI2VG9DVVB5?=
 =?utf-8?B?bnVoUkUydEFJNVVVeGRVSld0dlIwOUFvUzN5NitFM3pNWHUzZU12UGs5Mm5D?=
 =?utf-8?B?WG1JVDg5cjRWWnRBY2dwdXl6K08rK3BRcnZ5ZW90S21ZMkpqMHl5dXUyZlo1?=
 =?utf-8?B?ckF5aVJBdnIwa0NCZ1F4S0pwL1liNURWZ3d3Wmx6bHJwYjBPRHRRMnVSZkgz?=
 =?utf-8?B?R0tRV2pCZkp2QUxyRVM1ODFhZFlEYzdqSTE0WG9PenlvKzNWR0hyeG9uVmQ1?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WxTWDjgMzwZOV+DMCnzTgPR3AZL6hIbcH89lwR6ZwsA24Y9WTgLl6orLaamhg4uxuLN3MLdwyWhlrscgKiApYTjDKKS0O38S6PrhD+/MmxVXDOJYZozH7rSGyNOiFCtz7gPwaLw0wzRIWthENg+xAyMAwTvwZ9pQSgeLAklwEdFEzm/or+eFO/GPkksciecsBv3RkS3391UDu+w6vNesipZiMXEGbNS+vP0mWkBsoRTWUPV/LF2DPHLoWaIKtrZiy6ADwJGTc36QsbFVRXk5fhFgf8vT9bQL3IguRSBIi59bSMUa0Xpc7chjj+XoEjrZ28Ta0VQF/PzJ2wkCbv9jj3QnNY/YjRErD5oPJ1VOk2niLdEU/dWM3OhX57w6RPUhBud9wroj3cp3S6HleyYT/ND82TNJ7SlQFWwOWv86R/gKcywF1xPercGdpx74zt+p/BGm/AW1XQo1f3jTG7oq63qfx2OllXUTAa+qdEQTzu6/jnsrDRkVLLs9DBO87ZlaYlE1KZTY0r9g1OLWBKa6ARXr450fKl1sIPHco+lBmOAMn0xP/Na9fMTTsS0AnU2cHBolVfw11KcASTzEfsEw7hx7tJU5sbcaDHcEtgEGwUM9dTJ+mx9Dec+sQh2BYLgMFHgLb5Qsuvl7tY9pgotLAq/3J/VZUPE+4ZmbZ5OgWNzX9eiMUP2BVBPmHOTxpx7I0fEGzztY5/XGRhsTCgldHG9yrOQD64XL+GJ+Gc219CZ23HzceXAJX+IcbJSiSLWTtd3iO+Ylp9EuVmPU3l6b1Z1yuleteYP9VOskGPZpbshKme36AAIYxfLluxMjPbr9KHh17yRAVcfom+QxAoHto1DB3IaWkECKOVBzUq8L0uJMXwO63BVUiJgR/hGhCpNT
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99255386-b674-4109-6966-08dbc66c65d1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 13:01:47.2479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MN5H1GtDzUNrxPub1u25HtNOLAMQCQgI8JV1XL4WYX4lTkhH0E1SNLbJ3lsJnTEAsY1nzwo8WsobJiqDwtJPlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6024

unmap_domain_page_global() expects the provided address to be page aligned, or
else some of the called functions will trigger assertions, like
modify_xen_mappings() on x86 or destroy_xen_mappings() on Arm.

The following assert has been reported by osstest arm 32bit tests:

(XEN) Assertion 'IS_ALIGNED(s, PAGE_SIZE)' failed at arch/arm/mm.c:1243
(XEN) ----[ Xen-4.18-rc  arm32  debug=y  Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     00271a38 destroy_xen_mappings+0x50/0x5c
[...]
(XEN) Xen call trace:
(XEN)    [<00271a38>] destroy_xen_mappings+0x50/0x5c (PC)
(XEN)    [<00235aa8>] vunmap+0x30/0x1a0 (LR)
(XEN)    [<0026ad88>] unmap_domain_page_global+0x10/0x20
(XEN)    [<00208e38>] unmap_guest_area+0x90/0xec
(XEN)    [<00208f98>] domain_kill+0x104/0x180
(XEN)    [<00239e3c>] do_domctl+0x8ac/0x14fc
(XEN)    [<0027ae34>] do_trap_guest_sync+0x570/0x66c
(XEN)    [<002019f0>] arch/arm/arm32/entry.o#return_from_trap+0/0x4

Fixes: eadc288cbb0d ('domain: map/unmap GADDR based shared guest areas')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Also page-align the address in map_guest_area().
---
 xen/common/domain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index b8281d7cff9d..1468638ade8b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1601,7 +1601,7 @@ int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
  unmap:
     if ( pg )
     {
-        unmap_domain_page_global(map);
+        unmap_domain_page_global((void *)((unsigned long)map & PAGE_MASK));
         put_page_and_type(pg);
     }
 
@@ -1634,7 +1634,7 @@ void unmap_guest_area(struct vcpu *v, struct guest_area *area)
 
     if ( pg )
     {
-        unmap_domain_page_global(map);
+        unmap_domain_page_global((void *)((unsigned long)map & PAGE_MASK));
         put_page_and_type(pg);
     }
 }
-- 
2.42.0


