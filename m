Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6946952A33C
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 15:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330861.554287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx9c-0003sS-Dj; Tue, 17 May 2022 13:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330861.554287; Tue, 17 May 2022 13:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx9c-0003p8-9f; Tue, 17 May 2022 13:22:24 +0000
Received: by outflank-mailman (input) for mailman id 330861;
 Tue, 17 May 2022 13:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PCXU=VZ=citrix.com=prvs=1296e7181=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nqx9b-0003EP-7Q
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 13:22:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 610414a6-d5e4-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 15:22:21 +0200 (CEST)
Received: from mail-sn1anam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 09:22:14 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MWHPR03MB2863.namprd03.prod.outlook.com (2603:10b6:300:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Tue, 17 May
 2022 13:22:12 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 13:22:12 +0000
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
X-Inumbo-ID: 610414a6-d5e4-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652793741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1NnK6uV3ib0UW4lXjhVSINBMuSLjKvS6LIHru8qbsbQ=;
  b=NUx6Pm1m1XdbL/ZG4gDpjv3J+j9AlhFdwoHyxq0fyKM2X9w665jttv7x
   n/4nAJV48dx7EcbgokF+j85yYiw5Z++96Zt3KU8NPeXLceDzLP1fuA8lD
   Yl1hRvMcXmU22IoJJnY7fvWSna5TskINt26hMONqTvtCjLSIzvw9t+pbb
   Y=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 71351309
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Xbo3AKosqwNwJw5TV2xCvxJJwBheBmLaZBIvgKrLsJaIsI4StFCzt
 garIBmHM/nbamPzftgkbo209kpT65KBm9NlTAdk+ypkRXsV9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvQ4
 Iyq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBMIjSlvkDdz1iSx5cYIp3yuHtGVORmJnGp6HGWyOEL/RGKmgTZdddwcAuRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFg3Fs2qiiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgA3M/vduuDCCpOB3+P/2EtP+VNCAfpl+mF67p
 HnX70/TUg5PYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQomOAvxMac8pdFas98g7l4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDht8ztLSxitvuSU3313rWJq3W0MCscL24HbAcFSxcI55/op4RbphHCUNdlVrK0h9vdGDfsz
 jTMpy8774j/luYO3qS/uEvB2juqr52RFAotvF2LAiSi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02DaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:pNRCiaEPexpi2s2tpLqFYZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAnhHP9OkPIs1NKZMDUO11HYSL2KgbGD/9SkIVyGygc/79
 YeT0EBMqyWMbESt6+TjmiF+pQbsaG6GciT9JvjJhxWPGRXgs9bnmRE4lHxKDwKeOAKP+twKH
 LajfA31AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGQ9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9wwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgjf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3FosPD30E1wsK7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VfN1xJ/dfKla9Ny4kY1jiaGgOKsk8SgDwgq+yxokJz8eXX7FN5KcOuf
 36ISZlXCgJCg/TNfE=
X-IronPort-AV: E=Sophos;i="5.91,232,1647316800"; 
   d="scan'208";a="71351309"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxux9H1nQubDTLutIuUjwg5hCM8WRZt14A5g+wZYjup0XF1IVPcO3Fihms9KQyokBcoVqD+CuZs/U0tMd5hG5utpiUxGMGFni/JyAG/j6hPfQjk4NmWiasd9HvR+yw3PMfk2aVraf117UYB4KMG2gDPtkbySvR5E/0kRJd844BlbBdiq2VtAvQxu9zve7K5widcXGI0jYZKGR5GZtrPaEkteLOBwsxw8ddzyqJlegZu6d1S8AZsjXKRINpQAPRmgpCy+kiLTTkZeLgv4T+AFgYmQci4xT4BRaRCGQjngmFPIWiuuEqgT4SlCHvyhQKRlhLq7ny6/Au88TXxqwNZAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wL5+yQNrse2PhUfI4MIRngtSyTQoDYLPTdJvdUZMQQ=;
 b=hx1Nrj3S/f2/fh0qwQPFd7yfEFqZ1L/WWOdSy2vyiuYe4Y2WeJjVXN/bMBVkQ4SGWkvb7NFsB7eY8I+2S0m1NSTkcH8UkgBdEgIw2+TdIoajAL6QpbUXwu3xvXOpwk7t8ytNPgFua/g0bxdXFuvzyk2n8V0vPoMZNUqtsLJPrCeMLW0hrKamC0eKz7ltUB6XPsJ/EzEQb4ErLEEOl3Y+JWbkmPwagMmh5UIUHsKHVvZLsT8W/Aewh98K2Am8zlK6k/w7wdxkin4cR3EsKgVnQuJi2o+NYEXnxPvX9D/r+bJo0NQLLGG3Al7A9tIZkZAn0OLqz6pghqI67kr1dtPb9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wL5+yQNrse2PhUfI4MIRngtSyTQoDYLPTdJvdUZMQQ=;
 b=ir0FHIrjGgGnV/fSk8mSEWmFz/i/+w/jKe9/lKTJ4y2638X09bLgoGrAt6HlSde+TDLbXiWS7gGcqTlBhJg+shggcHFBbOcUiuvVGXTuIbbee0BKBFWGhpvvKtlsHIpCzt5fBtqJUF6qGxpG5Jn7ikq1H766YW5kZOg3E1NEdzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 2/2] x86/vmx: implement Notify VM Exit
Date: Tue, 17 May 2022 15:21:30 +0200
Message-Id: <20220517132130.38185-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517132130.38185-1-roger.pau@citrix.com>
References: <20220517132130.38185-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0469.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94656900-73bb-4d6d-50e7-08da38084095
X-MS-TrafficTypeDiagnostic: MWHPR03MB2863:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<MWHPR03MB2863A448D29A32CFFFBA704C8FCE9@MWHPR03MB2863.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xVdmDcHfjBkjzmOLC4u2KjkZc3lHOD0N5NjQVbybF2RhdZOTonk+eYneRCsdjrj3DgZuZUrbe0wzXukLn8ubgMZGIFNtgdRI8EBeL07AIvDp4K5p9KcdBXttniu/5PcAzHsUlCk++I/1yqjrjv1Ax8GDieUH+FteLhB3Xp9wfQiFY1GHadMl2TPkfNkNNAmi4m7RBAQJ8qOcsqAz8URZNiV3dDQLmb8MrWiqquZqFVBBN1lRJj8u6cBAI5XA+RMePHSs+fdKvF6WOklW0+0WCB9t3oIZ1XWvLFfHdHHBcVJjA+2TgFFursUtF8HkBAbnOSjtLjA371bJP9N10HXKdkYx/pM53gA3Md1cPqQJ8gnxhqx4oQyAHLO7hTOjoqiYHPdw5oEv7el0EDC4he+UnpAF5AziON5sH/Vtd7REjfmd3Eo019Dn2xpJbvRjjiIPKdl05IT/bEPhhvZQ0znq83vD5fEl+eNaxfpErm0jGqryp9YNP9bxOZ4WUYEDsIdFpx3civZjUUC9wnmZN7+2L6hQqveWcEv/vNPPdVMNHXKbaj37dsFSNTBn6WrPSJ5J1ELVs2wJMPeTrBN1bxwyY/rzaKLPFJtklIzkx2nSQAHeZ4SWDV/stIoTaI3Yi2pufWQfKKNx7ceCE2DPjcC+Fg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(5660300002)(6666004)(83380400001)(2906002)(8936002)(1076003)(4326008)(8676002)(186003)(2616005)(66556008)(66946007)(26005)(6512007)(82960400001)(36756003)(86362001)(6506007)(38100700002)(508600001)(66476007)(6486002)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REp6YkdZQTIrbFc3S283UXRISE5hem9WTjcrdzJsQ1RwMzEvZnVtcHVzMUd1?=
 =?utf-8?B?UWhYOUQ1T2tKYkJPMEZXclRkN2FGd0xVaWtTbVdlamkrOTlNai9udS9UN2g2?=
 =?utf-8?B?ZElYUXU2UzZ1QzZDaUszL1pTSmRld0R4Q09EVUdaQ3p3MmlJdzlxYnB2MWlF?=
 =?utf-8?B?VW9NL1J4dDdiYmw5M0w5bTh5c0ZLa1hrblBGTU90Mk8zQ1o3SUM3MXF0UUpI?=
 =?utf-8?B?S2xsNVpYTUxGOEszZHBNNnF0SC9TcWg2SVJVT3lHc1craW8xdlZEdEM4WHoz?=
 =?utf-8?B?NjcvM2NpRFhNcGhMc1FJcTE2SVRFeVY0WWJvQUtqK3JUR2QwUDFwcjZxS2lo?=
 =?utf-8?B?UkpxL3dqdXNQR0RtNWl0Si8yVnEvMW9JVjNxbzlLZzZ3WWdMbkx1VExHZE9N?=
 =?utf-8?B?Q1JORlFIS3hPOGhtL0xUUmNiOVFtT0NKQzdHVS81YmtBdU1ORzE3cUlGdGZj?=
 =?utf-8?B?KzRrY0hJeUIvTkRTTnlQdFRITmNyd1hXbWZ1WHNQSlBsTmpUeEpEVE01dEI4?=
 =?utf-8?B?aVBOclNZYklDOUhNZC9GSXp6VUhnTjNONTd3OEhTcFpQdUpZRFVaZ2hqWkpn?=
 =?utf-8?B?Z29Ba3greGRNN0Z1bjVreHB2ZjFRV2I2N0NuZUE0Sjc4UGNxYm83cWx6WGhL?=
 =?utf-8?B?S3I3alZaUFNEaXdMaWlmWjcrRGcwc3FqZUZQS095YnUrN3RQY1J6anFGbTg4?=
 =?utf-8?B?K2dNRmxTa3g5L3dYRmcyRkN0ei9vbXB5ckExbkJVeUNLSlhoOGNRLzJyRHpi?=
 =?utf-8?B?OEh1TXZWNldYWlR0Qk1VNXl4ZUJTanl2N2VRV1NTeFp2U1ZraExpemJuLzNJ?=
 =?utf-8?B?Rm1HSU0wUnBPQlk1MnFIcTlWUUZhNXhJbkF2SmU0TTE4SGR4MkxaYStGZjRG?=
 =?utf-8?B?N0VJYm0ycC93THVVdkhqQXlMaGJzN3BzL1p4VVc2TGlid1pYQU0wQWZTbWNI?=
 =?utf-8?B?S2xOMEcrYTlMaWUzVC9wLytZUEpwVUxES1JXRDNkZGtpMVo2YytrZUYyVVlz?=
 =?utf-8?B?QUxNZzQ1R3hCWU5sWVRCeEhOSnh6aW5xamJnbVFtbWovN21RY0Y3VFRBUzRM?=
 =?utf-8?B?S2s4SlBRVTE3VjVya09nbUI5ZFpkV21qTlJBRUYwUUZMS3hSekt2V0U3OWcw?=
 =?utf-8?B?bWJBZmFrTDZyUXcyUEtEVFpNblRjaGJaZVNCNC9LUnJKdUxwUS90YjZFSnJ4?=
 =?utf-8?B?UE02NVlzS1ZPdU9iTGhpNUVDWE93ditCUUpVVHQ2dkRNMUhYZ2tlcnVrQURR?=
 =?utf-8?B?SmxqY0NDSWJOK2dPRk5xRWFhTFFNNW04bGpReTUzU25wMWw4Q2FjcDAvOGpu?=
 =?utf-8?B?Y3ZHRkNnbDdFeXVLamdzZWJBMTRHWEhMK0tVbyt3SmR0NUt6c3UxU1czUWNK?=
 =?utf-8?B?NE50VWhUa1ZzOHQzeS96aWVFU01LRTJUZWRvbWtqT09LWXd4MzVUKzBKTVdQ?=
 =?utf-8?B?TElrUXIvelBQaFdrM3VaUTlmYnN4ZGdSWEQyYndiR1hLbUF3QUZiR3U1YS9K?=
 =?utf-8?B?dFlTY1ZlcXhnQkNSTjFnSkxweGNidVc0ekhYVExHZTlDc1dmcEpoa3NVekxI?=
 =?utf-8?B?YjVIN1A1T0pVQWRDdUpoWDNueVhkUmt0VVZMcXUxQTJNK3JuUjJJQWdlTU84?=
 =?utf-8?B?OUJ0cVZ1SFdYS21LRkJSQk5DRzlSL2NJYU1vbHNldmRrdVhiY1pvVXFiMHpK?=
 =?utf-8?B?c3R4K29iQ2d1ckZSbys4OXNNMUJWVzhJN1NZaUFieVNwUFZ6d2pOcVFRRUFM?=
 =?utf-8?B?V0JabGNHVGNYK0NObVZOS3hnVlIxbEdTY0lPRGNCTFZNNDZVVE5EMmpneHNa?=
 =?utf-8?B?K1JPTzV3VTJEVHk0M28yUW5KMll3bVpSUDZqN2JKdVI2RjlwNU9vb29BTnZ6?=
 =?utf-8?B?Vk05cVlPRkxwUHZsT1FxYlM5eVdVdWsvK2djNW45YmQyYVV4SC9LMlROT3V6?=
 =?utf-8?B?NkJvUHhITjlhNEJUVFZzUVZFa3U4d2FvN3hGa0JYZkpSOW1VVWREYXd0aTFK?=
 =?utf-8?B?UFpBck4zZ2xwYXEzZkxzSjI1UUF2cDNIMXZ5SWZBQkJuY3VjcmoxMExTOWRq?=
 =?utf-8?B?c0wzbEZOeEJIMDAwNlQ5Z0pPSUFZaWpzTkF5ZkRPdU9ZYUpXU2pPZURtNi9R?=
 =?utf-8?B?a2hwdmJSdmJVV1pFWk9lNmpMK1dFelMycVBTL2ZXQjFjOTluQ2E2ZHV6N0wr?=
 =?utf-8?B?OStCS2RvUmFyYmsrVmlIenMwRGFQM2xlYzdNM0x4QzYxQTJhS1kzUUJHdHFr?=
 =?utf-8?B?ZWdnVHBram1DZzRWWm5xK3IrUUt5T0M3Vll2NlI4bHhZTDJ6UTdITGNuSUd5?=
 =?utf-8?B?OGx0RmhML0laMVU3bHBEQlZRNUIxTFlDVjI1UFIwWGo2S2V6aC83ZFB6L08r?=
 =?utf-8?Q?uR/YbXFJW4bOVxFA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94656900-73bb-4d6d-50e7-08da38084095
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 13:22:12.2486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXzJF0Q2zAk2tywkFmvc6Pt6tHm6Zcj/zHkNDrpbHuyAKrZdyBvV+3f0SMAZ+D6+ZjMU+gIlACXW816vB4sp9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2863

Under certain conditions guests can get the CPU stuck in an infinite
loop without the possibility of an interrupt window to occur.  This
was the case with the scenarios described in XSA-156.

Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
if no interrupt window occurs for a specified amount of time.  Note
that using the Notify VM Exit avoids having to trap #AC and #DB
exceptions, as Xen is guaranteed to get a VM Exit even if the guest
puts the CPU in a loop without an interrupt window, as such disable
the intercepts if the feature is available and enabled.

Setting the notify VM exit window to 0 is safe because there's a
threshold added by the hardware in order to have a sane window value.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
This change enables the notify VM exit by default, KVM however doesn't
seem to enable it by default, and there's the following note in the
commit message:

"- There's a possibility, however small, that a notify VM exit happens
   with VM_CONTEXT_INVALID set in exit qualification. In this case, the
   vcpu can no longer run. To avoid killing a well-behaved guest, set
   notify window as -1 to disable this feature by default."

It's not obviously clear to me whether the comment was meant to be:
"There's a possibility, however small, that a notify VM exit _wrongly_
happens with VM_CONTEXT_INVALID".

It's also not clear whether such wrong hardware behavior only affects
a specific set of hardware, in a way that we could avoid enabling
notify VM exit there.

There's a discussion in one of the Linux patches that 128K might be
the safer value in order to prevent false positives, but I have no
formal confirmation about this.  Maybe our Intel maintainers can
provide some more feedback on a suitable notify VM exit window
value.

I've tested with 0 (the proposed default in the patch) and I don't
seem to be able to trigger notify VM exits under normal guest
operation.  Note that even in that case the guest won't be destroyed
unless the context is corrupt.
---
 docs/misc/xen-command-line.pandoc       | 11 +++++++++++
 xen/arch/x86/hvm/vmx/vmcs.c             | 20 +++++++++++++++++++-
 xen/arch/x86/hvm/vmx/vmx.c              | 24 ++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  4 ++++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  6 ++++++
 xen/arch/x86/include/asm/perfc_defn.h   |  3 ++-
 6 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1dc7e1ca07..ccf8bf5806 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2544,6 +2544,17 @@ guest will notify Xen that it has failed to acquire a spinlock.
 <major>, <minor> and <build> must be integers. The values will be
 encoded in guest CPUID 0x40000002 if viridian enlightenments are enabled.
 
+### vm-notify-window (Intel)
+> `= <integer>`
+
+> Default: `0`
+
+Specify the value of the VM Notify window used to detect locked VMs. Set to -1
+to disable the feature.  Value is in units of crystal clock cycles.
+
+Note the hardware might add a threshold to the provided value in order to make
+it safe, and hence using 0 is fine.
+
 ### vpid (Intel)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index d388e6729c..5685a5523e 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -67,6 +67,9 @@ integer_param("ple_gap", ple_gap);
 static unsigned int __read_mostly ple_window = 4096;
 integer_param("ple_window", ple_window);
 
+static int __read_mostly vm_notify_window;
+integer_param("vm-notify-window", vm_notify_window);
+
 static bool __read_mostly opt_ept_pml = true;
 static s8 __read_mostly opt_ept_ad = -1;
 int8_t __read_mostly opt_ept_exec_sp = -1;
@@ -210,6 +213,7 @@ static void __init vmx_display_features(void)
     P(cpu_has_vmx_pml, "Page Modification Logging");
     P(cpu_has_vmx_tsc_scaling, "TSC Scaling");
     P(cpu_has_vmx_bus_lock_detection, "Bus Lock Detection");
+    P(cpu_has_vmx_notify_vm_exiting, "Notify VM Exit");
 #undef P
 
     if ( !printed )
@@ -320,7 +324,8 @@ static int vmx_init_vmcs_config(bool bsp)
                SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS |
                SECONDARY_EXEC_XSAVES |
                SECONDARY_EXEC_TSC_SCALING |
-               SECONDARY_EXEC_BUS_LOCK_DETECTION);
+               SECONDARY_EXEC_BUS_LOCK_DETECTION |
+               SECONDARY_EXEC_NOTIFY_VM_EXITING);
         if ( _vmx_misc_cap & VMX_MISC_VMWRITE_ALL )
             opt |= SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
         if ( opt_vpid_enabled )
@@ -1333,6 +1338,19 @@ static int construct_vmcs(struct vcpu *v)
         rc = vmx_add_msr(v, MSR_FLUSH_CMD, FLUSH_CMD_L1D,
                          VMX_MSR_GUEST_LOADONLY);
 
+    if ( cpu_has_vmx_notify_vm_exiting && vm_notify_window >= 0 )
+    {
+        __vmwrite(NOTIFY_WINDOW, vm_notify_window);
+        /*
+         * Disable #AC and #DB interception: by using VM Notify Xen is
+         * guaranteed to get a VM exit even if the guest manages to lock the
+         * CPU.
+         */
+        v->arch.hvm.vmx.exception_bitmap &= ~((1U << TRAP_debug) |
+                                              (1U << TRAP_alignment_check));
+        vmx_update_exception_bitmap(v);
+    }
+
  out:
     vmx_vmcs_exit(v);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 02cc7a2023..9c37790c36 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4567,6 +4567,30 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
          */
         break;
 
+    case EXIT_REASON_NOTIFY:
+        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+
+        if ( exit_qualification & NOTIFY_VM_CONTEXT_INVALID )
+        {
+            perfc_incr(vmnotify_crash);
+            gprintk(XENLOG_ERR, "invalid VM context after notify vmexit\n");
+            domain_crash(v->domain);
+            break;
+        }
+
+        if ( cpu_has_vmx_vnmi &&
+             (exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET) )
+        {
+            unsigned long guest_info;
+
+            /* Exit was incident to an execution of IRET that unblocked NMIs. */
+            __vmread(GUEST_INTERRUPTIBILITY_INFO, &guest_info);
+            __vmwrite(GUEST_INTERRUPTIBILITY_INFO,
+                      guest_info | VMX_INTR_SHADOW_NMI);
+        }
+
+        break;
+
     case EXIT_REASON_VMX_PREEMPTION_TIMER_EXPIRED:
     case EXIT_REASON_INVPCID:
     /* fall through */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 5d3edc1642..0961eabf3f 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -267,6 +267,7 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_XSAVES                   0x00100000
 #define SECONDARY_EXEC_TSC_SCALING              0x02000000
 #define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
+#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000
 extern u32 vmx_secondary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
@@ -348,6 +349,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
 #define cpu_has_vmx_bus_lock_detection \
     (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
+#define cpu_has_vmx_notify_vm_exiting \
+    (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
 
 #define VMCS_RID_TYPE_MASK              0x80000000
 
@@ -455,6 +458,7 @@ enum vmcs_field {
     SECONDARY_VM_EXEC_CONTROL       = 0x0000401e,
     PLE_GAP                         = 0x00004020,
     PLE_WINDOW                      = 0x00004022,
+    NOTIFY_WINDOW                   = 0x00004024,
     VM_INSTRUCTION_ERROR            = 0x00004400,
     VM_EXIT_REASON                  = 0x00004402,
     VM_EXIT_INTR_INFO               = 0x00004404,
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 03995701a1..a16055643b 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -221,6 +221,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define EXIT_REASON_XSAVES              63
 #define EXIT_REASON_XRSTORS             64
 #define EXIT_REASON_BUS_LOCK            74
+#define EXIT_REASON_NOTIFY              75
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
@@ -233,6 +234,11 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
 #define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
 
+/*
+ * Exit Qualifications for NOTIFY VM EXIT
+ */
+#define NOTIFY_VM_CONTEXT_INVALID       1u
+
 /*
  * Exit Qualifications for MOV for Control Register Access
  */
diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
index d6eb661940..c6b601b729 100644
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 75
+#define VMX_PERF_EXIT_REASON_SIZE 76
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
@@ -126,5 +126,6 @@ PERFCOUNTER(realmode_exits,      "vmexits from realmode")
 PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
 
 PERFCOUNTER(buslock, "Bus Locks Detected")
+PERFCOUNTER(vmnotify_crash, "domains crashed by Notify VM Exit")
 
 /*#endif*/ /* __XEN_PERFC_DEFN_H__ */
-- 
2.36.0


