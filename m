Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D64D7B5633
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 17:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611638.951195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKjL-0006sq-OR; Mon, 02 Oct 2023 15:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611638.951195; Mon, 02 Oct 2023 15:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnKjL-0006r5-Kp; Mon, 02 Oct 2023 15:21:07 +0000
Received: by outflank-mailman (input) for mailman id 611638;
 Mon, 02 Oct 2023 15:21:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnKbK-0001wY-Nj
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 15:12:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25683fcb-6136-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 17:12:48 +0200 (CEST)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 11:12:46 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BN9PR03MB6188.namprd03.prod.outlook.com (2603:10b6:408:101::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Mon, 2 Oct
 2023 15:12:43 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 15:12:43 +0000
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
X-Inumbo-ID: 25683fcb-6136-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696259568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=M5aez5rTFO1GcCEIbyWKBylmYkINX0+kBsuOD8esuJs=;
  b=BYMcWqLtIVgXXy2yoNejAGe+RDPStvEOdm3rG7gTPDb7AWKRPKUJL4rr
   +kNAVTdFikM/zyA/9cLD61R8zWGzBnM6mInSAgFPiwQ1JLvRZezxaiWUC
   QFRTaSAuEvZugduONv7uxb93fpFxm9hDSmEpGF026pLfFdVyW1jrqXYQs
   4=;
X-CSE-ConnectionGUID: FfrCwBCfS+WA7M+9Ex6pVg==
X-CSE-MsgGUID: RXbDzZ0qSWiHNEwZIFbhMw==
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 123016667
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:c2gaVq4aXtYG0AATmD9QawxRtMnGchMFZxGqfqrLsTDasY5as4F+v
 jcbW2zTMv6LMGD8KNlyPYS//UwGucOGztE1TQU/qitkHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPKgT5geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 /ICAy8nRR64xN2fn5f4G8R82NwdI5y+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOaF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx3ijAdxMSuLQGvhCum2Z6n4hUAQtalqbh9SmuG+QUdJ6N
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQNwrstUnAyMj0
 FChlsnsQzdotdW9S3iQ67OVpjOaIjUOICkJYipsZRQBy8nupsc0lB2nZtR+FK+4iPXlFDe2x
 CqFxAAlnKkah8MP06S9/HjEjiiqq5yPSRQ6ji3LV2es9StlZ4qoYYO55Fyd5vFFRLt1VXGEt
 XkA3sSbsuYHCMjVkDTXGb1TWra0+/yCLTvQx0Z1GIUs/Cis/Hjlep1M5DZ5JwFiNcNslSLVX
 XI/cDh5vPd7VEZGp4cuC25tI6zGFZTdKOk=
IronPort-HdrOrdr: A9a23:eXu8K6GmunLwH0YQpLqE7MeALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5OktBpTnwAsi9qBrnnPYejLX5Vo3SPzUO1lHYSL1K3M/PxCDhBj271sM179
 YGT0GmMqyTMbGtt7ee3DWF
X-Talos-CUID: =?us-ascii?q?9a23=3AH4+nMGudeBVQZjEBFPtkxXAS6IsLfGf20137LXT?=
 =?us-ascii?q?7Nk82bf7EZE/O4J1rxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ATg3LXAxcBFlDaV1Uxz6Zpl8xLBGaqJ6eAmwfo80?=
 =?us-ascii?q?fgPaFFQpdJAW8oj63Z5Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="123016667"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7gP98FmDvxEZR9AXljjEsXv4sCfAhk6acHtKbHfxOsFnOMZy2+D1PdizlgoeTc24qY1EqnLaFBGQh8W47O4YTiyHy3S7f1NKvA+f5v7ptCFI4i5yqYjod4y2yAHstEn2OOozFB26FiGNhIrZAk8kYhG425+hC8tHTq+PyZuCP3Bs457VsPmtvuiQLMwvnZ61aNV3gz1zfjzS7istGxt6OJXpDg5jP8VTiJOJTlVND4LctfZaT6LdzLaTTGKctqVYRvnysrwDny5tRvf8ceEVMUFbEMljj2vqz7Z4r/ZLK1+JgK5bZCeKfy+ER/J2CoEODmkctFb2evKVCBvJ5Rnmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQo4moAla6ceZD4asYRXJVxG0xoZsU0KKz3b6MGdn7Y=;
 b=bLsdfpYphoyKNWpH8hH2+HpMucYaCMuJ4BMrd4shm6oGjFEYUqL8qsd5elAX/ZbiwcS2/lW+SUXi/ARN3hxq0Db07jHeJpsaEPffJtRDC039qYKjKxrA303nccO7CYdeipD+mHJkhMJ8n3qKQ+DhSTzymnjf+JhsDOi35AWjxum9VBiFx8YIjJIGWupSU2RP4C1/0ZOcpOv7VbR8EtbFLlwrb7V/0S4f93SfnEh3QOQL3Y8aR8+WTp5n3R5cDZQcQ7CMmavCrJMjTCJ9AaPkewDWZfCP4jzJqstTaPAg4+U6a7RGSpU8sdXB69tJoiHtnAD3/SeevzqdJDe53UBIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQo4moAla6ceZD4asYRXJVxG0xoZsU0KKz3b6MGdn7Y=;
 b=HuP51X/sGh8XUvd9Nd/a+lbCDwdFG5WWAmql7oHvqxCb9aFslea53Xv6DERsHAtxbt2I6DQMvWlBcJoEfdp5ZczcO/B7EzpStaMxFF/yJlno80QOgy51DLE5/gnl1FocgiC0K0PpUTGkoY397O43UoO4VW6fDRQYt57QJ3Gy93Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	henry.wang@arm.com
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v5 10/10] common: convert vCPU info area registration
Date: Mon,  2 Oct 2023 17:11:27 +0200
Message-ID: <20231002151127.71020-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002151127.71020-1-roger.pau@citrix.com>
References: <20231002151127.71020-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0320.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::19) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BN9PR03MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: afd83ff3-dc1a-44ff-ec75-08dbc35a067b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G57wTZ1WuyOBN8gewh/nw3IL39EtjNdSLqVNu7IG7vqCn+6lFMf/9x+yMNQnDOagnh580z3gbgLYS75fRR4tlNx1XLOyUA3lH45I1cX2LkDYTtexnGT/0flFipPggEfUNf/HVqsRiqjQDWGn1LRqEBHg/pCaLSy0ceqvuUHBAkSbbsBdp4C9e2bPSlUzqAmX9Ap2E4bQ4wVh9XJOu6k1hSeJ4lVYn7l/5grZ0VPHVozZ+gLRC3xx1kPTqSUY50p/bAcP3zG4lXXaJyjo5kQj4Zo8kpBbNe3zqUhlu1PIfztvzOXCJcOfQRJimQTFN/qF6oiqDriBaVqrqeY5KcUczdpPiSlMtaZl8KHEuGzcb/0We5Kfa1BfeK6SYXMzCS2Tjzk+pCvhQWkOx2og6UiBvoTRpnYSywJqF0o9h06NtZsc4teHlceJ8SIDzo6eY7+JoYq9rKkrgYtWDWHbcvY/VtuO7s6byY2M+hZJLB2DE3cG/xdt9toBR3MuDrM2MBVXqw5btgTJDAB4sF9sYgVKamgB9UvEEkZzLNGzlUUgVKlaAsrnOLJCL3JXq70L+vjAslwQ1lv88OymjzvxTdqqrsyvvum8DdzhXXjEMB+FKAeMMgHpGT/WfT/RQzrK3xT+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2616005)(1076003)(26005)(83380400001)(82960400001)(38100700002)(86362001)(36756003)(316002)(54906003)(8936002)(8676002)(4326008)(5660300002)(41300700001)(66476007)(66556008)(66946007)(30864003)(2906002)(6506007)(7416002)(6666004)(6512007)(478600001)(6486002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmhEanJTMXkyYzF4anEzWThTNlF2N0JvaEE2OVNPb0loZXlGcTQ4bktYSnBI?=
 =?utf-8?B?VVpCSzhUTXM3YUFRdXNPRFRheGd3dUYxa3ZPVDJxaFlBWm94QSsrNlNJaVpw?=
 =?utf-8?B?d0plelVodit2UTJoT2dTUjJreEVuOHN3a2IxVU5xS0xPamxCWHpKYWRzMUcr?=
 =?utf-8?B?ZU5WYVFlZXc3SlZ3bTkwREhidTRCZWZNdGJHKyt5czhITUp6NHU4T2FSdm14?=
 =?utf-8?B?d0NqZjUycHc2c05BeTFDbEpPcE00elBqQ3N6bGQ3RC9zRlowVVhCWWtaWlhl?=
 =?utf-8?B?VHJxQmRLY2tmMHZMbkdWblhjbEhoL1VKK2dWVkZOc1UrUVQvK3dEcXZ1Znlw?=
 =?utf-8?B?bXU0eFdLNHhOZVU2elVKRm1OYnd0eDR0NHdsVkRtTXJCSHlhRUN4eVpVTTd5?=
 =?utf-8?B?dllZekxqNE44M0p6YmNiT0UyS3ZBSll0cnk4TTI5NmpqR2tJWk5YMmtPaThN?=
 =?utf-8?B?UkxoV2REN2hBVlpmVXBGTGVhd1IxMkR1ekVCVGVwYlNUMkN2OTlFWXVLOE1C?=
 =?utf-8?B?azhwZFVkZnNSZGQ0WTluWkpVa1NzYWI0eGJEMkpNeTFCZDRFV3B6ZEh2NzRm?=
 =?utf-8?B?TFRQcDRQVUZnWTk5d1pDQ1Y2SkYvYkdraitjSEc4dWN2bWR3eUxsdGMvTzln?=
 =?utf-8?B?UjUySHRPN0krYVFXbEFJNDlIN2doVlNza2doUEhQaGtHT3kyMlZPeHozQ0V3?=
 =?utf-8?B?YWdIUEpFRXlDckFxQUFmdzZrK0V3MTJCWTJyc0NkN2xIdFhzekpCNDdZK0lJ?=
 =?utf-8?B?OHg1QnpUS1h1c1BzOUNyaUxuQ1pkdEFXMjd5ek1oUmoveGJ6Vm5jNlFycitq?=
 =?utf-8?B?VDVIR3dtWTU1SUMwNDBEaGZFRFYremJyanZUNzU5VmlGZW43VDNtREV4TmJm?=
 =?utf-8?B?bkMvc0tYOUJtSE51blhRbTdWeDArbFZNRk5rbWJzaDlDL2VWRmwvZjdtYU5V?=
 =?utf-8?B?a2xLamM2LzBSYjlmNmgvbGtrZk04ZjlLNFA1bnhDVlREZnhxSUllakFMZUhz?=
 =?utf-8?B?bU15NTAyam1qM1ZJVWh5SDJpUUE4UmJ1U2JjNThEczNHOEpKamJiTXJQVUZv?=
 =?utf-8?B?bW81Z0ZaL0NMaVJrTUNnWDQxRmM2TDc2YWcwdGFtR2hWQmhNcUFNdHZxTjZN?=
 =?utf-8?B?Y1MyMTRTNmtjQ1JsNkFtY1N6YmxuSFgvUTdCQUNyaytXSlNLR1E0VXVBdXR1?=
 =?utf-8?B?bkUvVVJyR1hGaHlpa0Nqb3NpNXRTbjRnc0x0b3ZaS2pKcksyNTR0TGlmR1ZW?=
 =?utf-8?B?b1U4SFRRcnZOZkdkVDNSUm4wTGdMVzYrdk80NkJ1VWViUVdudHhoTCtXdm9P?=
 =?utf-8?B?dVFkcktReVNtYnFBbmtIVmFrTW5BWVBXWFJ3VG5GajBHU0djU1dZQVRZNWdr?=
 =?utf-8?B?WmlMU3R0K0ZXbCtjOTArNDFXTzMvTlVNUjN3bHc3dnErTXhsR2JiZklOT25Z?=
 =?utf-8?B?NXl0R0E4c1FWRkFsWUJYTElhNFN0a2xQTW9mRGx4Q09EVHhueXp4dlhKUDh4?=
 =?utf-8?B?bDI0UFZiU0FqTHUvUXkrdFZ3Zkw5Q2I5SUZ4Zyt4MHZ2SjBka3NoMWRLcTJr?=
 =?utf-8?B?Qk1hTk9zK1ErUHJxRWRuOE1CNng4dEtBSFVrcDJQeUpVMzZIVy9KRncwSEVt?=
 =?utf-8?B?NXNaRXNHOXB2K2s2WFVOOEExY1ZWOGJ3TVBkT3pYZUNURFl6eGZYRWtzN3FB?=
 =?utf-8?B?ZVFaWm13OUVLTHVUNTNpR1AranhYRDZ3QUVURWtFYnRyN0dWd1dZM0NuQ0R1?=
 =?utf-8?B?SnZNU05sZVdtZGQ1RFNIQUNaNkt4SkhXRHp4M0xidjEyVCtmK0Z2SCtsbTls?=
 =?utf-8?B?aFZXV3dqRXNuQmtLYWt6Z3pMNU4rbmhFT3pOSjJHNXhEVDltV3FvVC9ZdFVT?=
 =?utf-8?B?aDMvL2laM21LTmhNRHJsdXN6cHRvVFU0MWk5aEZOdmlKUHFqckhMbmM0cy9q?=
 =?utf-8?B?TXR1UHBRR1RTZXM5ZDR1aFdaK0hXQ0ZqSUNOMStickpIaW16ZWtsNWNKRmtn?=
 =?utf-8?B?LzlTalFybkc5ejRYaGx0M3VhWjVLeFlHamRDMThyWnZUYWVlOEwrRWxVaEYw?=
 =?utf-8?B?cjBwbG55NjFwdkdMd2tzVHA3SUVLYXIzRmFFUHZ0U0gyY0NadFFYQjR2U3JR?=
 =?utf-8?B?VXJFSmw0VmtFaC8wWlFRMUxBZE9tN3JmcExTTXdxY3lBV1gwejVYZG1DN1ph?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NuiRyTm66hd3N/pIqk6ntBTI7IwKAkW50ho6I+dIAT1DNRrD+/NIG1SyhkiP2X3mH+w23L7o76HpEJDmwRfkQtwAT7w5HaWvyjWav9D/9vlIZUKd3MMdriQyLwOTY4/zFg3gBF4IEiE6RrUMYRr4obsD1+GPYkrA6G3xWzmjwOuTOQI0rOh2wt0xAKYfGkFaMSAMQuw4NPcjm626F4csCoHSQ4pHbCJx9Dj5mKP58JoX/caC9kjiRiBEBwDb1d9c5k7Q8BprMKB++V0JPSjpcjD0AFYl+4udVn+GVYgqslIFCthpEHVlBmKnJek039jcrFr+zPOPDu8JxD876O3ruwe+us82NFZAtM5Dvizl+DsfJwKUv+m2JQJzvIbQqB54El0S3ThYTg69tTx0lgVdTwwySNFvE+cNpJMSb4nUP2r8u/Wjwjg8L26ZYkh9AWTyrSWtOJ6uqWL0wjn4EWNjzKiZOMZwWgln2/zcOTQqGw9MtvxE8kg5vigpi44EJvq+hyeiTh6h2D2nF2XAl0kQZkxGj6Tl1zSPuhKiFpDcyw90yFmIxC/L4ZF3VwyMPnpb0RrV/rqB0ZMiByZELvkZusPFVTW0WkYfZCr9+hgyay8AVeV3eu572umyJwiRNA3HLKmoBfjP+m4lRNiAnTaaAIis7vmB7l5Jo4E+55mqLd1+vKC5Pnh3qhqYLBYcJiHMOv2+xlnXOc2qN0N3n8bKFCjkuD9O8Uw5ZbLOBkzfBnoJpm6PdXnleNTJF+CeRvmfUMuavaWENuUHPiuSiNsoWsjZ4enI9co8Fzjzh6Q34QUtCXfABouZS2wNo9lkubCHTirh/M93f6pRo10CzAGX3hsPRN1ZcLqUDt5mBRka7ARON6RmvJQXOYQSomUA13EovCtkNIr/OTobP5oLLjrq5ZK9/mB1k0jI8WXCnE/XJCQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd83ff3-dc1a-44ff-ec75-08dbc35a067b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 15:12:43.1126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmvT/V2p7WFtkhuJfhpjQKnoyezqdWK1jfV5lSpDqNZr9415IYxyHBasABMYWUdm6l8IVRbAsw6NbiJuv4enFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6188

From: Jan Beulich <jbeulich@suse.com>

Switch to using map_guest_area(). Noteworthy differences from
map_vcpu_info():
- remote vCPU-s are paused rather than checked for being down (which in
  principle can change right after the check),
- the domain lock is taken for a much smaller region,
- the error code for an attempt to re-register the area is now -EBUSY,
- we could in principle permit de-registration when no area was
  previously registered (which would permit "probing", if necessary for
  anything).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/shared.h |  19 ++-
 xen/arch/x86/mm/mem_sharing.c     |  20 ++-
 xen/arch/x86/pv/shim.c            |   2 +-
 xen/arch/x86/time.c               |   2 +-
 xen/arch/x86/x86_64/asm-offsets.c |   2 +-
 xen/arch/x86/x86_64/traps.c       |   2 +-
 xen/common/compat/domain.c        |   2 +-
 xen/common/domain.c               | 204 ++++++++++++------------------
 xen/include/xen/domain.h          |   3 -
 xen/include/xen/sched.h           |   5 +-
 xen/include/xen/shared.h          |   3 +-
 11 files changed, 112 insertions(+), 152 deletions(-)

diff --git a/xen/arch/x86/include/asm/shared.h b/xen/arch/x86/include/asm/shared.h
index dd3ae8c2639d..60b67fa4b427 100644
--- a/xen/arch/x86/include/asm/shared.h
+++ b/xen/arch/x86/include/asm/shared.h
@@ -26,17 +26,20 @@ static inline void arch_set_##field(struct domain *d,           \
 #define GET_SET_VCPU(type, field)                               \
 static inline type arch_get_##field(const struct vcpu *v)       \
 {                                                               \
+    const vcpu_info_t *vi = v->vcpu_info_area.map;              \
+                                                                \
     return !has_32bit_shinfo(v->domain) ?                       \
-           v->vcpu_info->native.arch.field :                    \
-           v->vcpu_info->compat.arch.field;                     \
+           vi->native.arch.field : vi->compat.arch.field;       \
 }                                                               \
 static inline void arch_set_##field(struct vcpu *v,             \
                                     type val)                   \
 {                                                               \
+    vcpu_info_t *vi = v->vcpu_info_area.map;                    \
+                                                                \
     if ( !has_32bit_shinfo(v->domain) )                         \
-        v->vcpu_info->native.arch.field = val;                  \
+        vi->native.arch.field = val;                            \
     else                                                        \
-        v->vcpu_info->compat.arch.field = val;                  \
+        vi->compat.arch.field = val;                            \
 }
 
 #else
@@ -57,12 +60,16 @@ static inline void arch_set_##field(struct domain *d,       \
 #define GET_SET_VCPU(type, field)                           \
 static inline type arch_get_##field(const struct vcpu *v)   \
 {                                                           \
-    return v->vcpu_info->arch.field;                        \
+    const vcpu_info_t *vi = v->vcpu_info_area.map;          \
+                                                            \
+    return vi->arch.field;                                  \
 }                                                           \
 static inline void arch_set_##field(struct vcpu *v,         \
                                     type val)               \
 {                                                           \
-    v->vcpu_info->arch.field = val;                         \
+    vcpu_info_t *vi = v->vcpu_info_area.map;                \
+                                                            \
+    vi->arch.field = val;                                   \
 }
 
 #endif
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 99cf001fd70f..6f1ce1623b8d 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1705,7 +1705,6 @@ static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
 static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 {
     unsigned int i;
-    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
     int ret = -EINVAL;
     mfn_t vcpu_info_mfn;
 
@@ -1717,17 +1716,14 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
         if ( !d_vcpu || !cd_vcpu )
             continue;
 
-        /* Map in the vcpu_info page if the guest uses one */
-        vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
-        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
-        {
-            ret = map_vcpu_info(cd_vcpu, mfn_to_gfn(d, vcpu_info_mfn),
-                                PAGE_OFFSET(d_vcpu->vcpu_info));
-            if ( ret )
-                return ret;
-        }
-
-        /* Same for the (physically registered) runstate and time info areas. */
+        /*
+         * Map the vcpu_info page and the (physically registered) runstate and
+         * time info areas.
+         */
+        ret = copy_guest_area(&cd_vcpu->vcpu_info_area,
+                              &d_vcpu->vcpu_info_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
         ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
                               &d_vcpu->runstate_guest_area, cd_vcpu, d);
         if ( ret )
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index f08b16bae2fe..81e4a0516d18 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -383,7 +383,7 @@ int pv_shim_shutdown(uint8_t reason)
     for_each_vcpu ( d, v )
     {
         /* Unmap guest vcpu_info page and runstate/time areas. */
-        unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->vcpu_info_area);
         unmap_guest_area(v, &v->runstate_guest_area);
         unmap_guest_area(v, &v->arch.time_guest_area);
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 73df1639a301..d0b0986509b2 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1542,7 +1542,7 @@ static void __update_vcpu_system_time(struct vcpu *v, int force)
     struct vcpu_time_info *u = &vcpu_info(v, time), _u;
     const struct domain *d = v->domain;
 
-    if ( v->vcpu_info == NULL )
+    if ( !v->vcpu_info_area.map )
         return;
 
     collect_time_info(v, &_u);
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index fbd6c54188db..57b73a4e6214 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -53,7 +53,7 @@ void __dummy__(void)
 
     OFFSET(VCPU_processor, struct vcpu, processor);
     OFFSET(VCPU_domain, struct vcpu, domain);
-    OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info);
+    OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info_area.map);
     OFFSET(VCPU_trap_bounce, struct vcpu, arch.pv.trap_bounce);
     OFFSET(VCPU_thread_flags, struct vcpu, arch.flags);
     OFFSET(VCPU_event_addr, struct vcpu, arch.pv.event_callback_eip);
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index f4d17b483032..e03e80813e36 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -96,7 +96,7 @@ static void _show_registers(
     if ( context == CTXT_hypervisor )
         printk(" %pS", _p(regs->rip));
     printk("\nRFLAGS: %016lx   ", regs->rflags);
-    if ( (context == CTXT_pv_guest) && v && v->vcpu_info )
+    if ( (context == CTXT_pv_guest) && v && v->vcpu_info_area.map )
         printk("EM: %d   ", !!vcpu_info(v, evtchn_upcall_mask));
     printk("CONTEXT: %s", context_names[context]);
     if ( v && !is_idle_vcpu(v) )
diff --git a/xen/common/compat/domain.c b/xen/common/compat/domain.c
index c4254905359e..7ff238cc2656 100644
--- a/xen/common/compat/domain.c
+++ b/xen/common/compat/domain.c
@@ -49,7 +49,7 @@ int compat_common_vcpu_op(int cmd, struct vcpu *v,
     {
     case VCPUOP_initialise:
     {
-        if ( v->vcpu_info == &dummy_vcpu_info )
+        if ( v->vcpu_info_area.map == &dummy_vcpu_info )
             return -EINVAL;
 
 #ifdef CONFIG_HVM
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 486c1ae3f7f3..b8281d7cff9d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -127,10 +127,10 @@ static void vcpu_info_reset(struct vcpu *v)
 {
     struct domain *d = v->domain;
 
-    v->vcpu_info = ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
-                    ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
-                    : &dummy_vcpu_info);
-    v->vcpu_info_mfn = INVALID_MFN;
+    v->vcpu_info_area.map =
+        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
+         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
+         : &dummy_vcpu_info);
 }
 
 static void vmtrace_free_buffer(struct vcpu *v)
@@ -993,7 +993,7 @@ int domain_kill(struct domain *d)
             return -ERESTART;
         for_each_vcpu ( d, v )
         {
-            unmap_vcpu_info(v);
+            unmap_guest_area(v, &v->vcpu_info_area);
             unmap_guest_area(v, &v->runstate_guest_area);
         }
         d->is_dying = DOMDYING_dead;
@@ -1448,7 +1448,7 @@ int domain_soft_reset(struct domain *d, bool resuming)
     for_each_vcpu ( d, v )
     {
         set_xen_guest_handle(runstate_guest(v), NULL);
-        unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->vcpu_info_area);
         unmap_guest_area(v, &v->runstate_guest_area);
     }
 
@@ -1496,111 +1496,6 @@ int vcpu_reset(struct vcpu *v)
     return rc;
 }
 
-/*
- * Map a guest page in and point the vcpu_info pointer at it.  This
- * makes sure that the vcpu_info is always pointing at a valid piece
- * of memory, and it sets a pending event to make sure that a pending
- * event doesn't get missed.
- */
-int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset)
-{
-    struct domain *d = v->domain;
-    void *mapping;
-    vcpu_info_t *new_info;
-    struct page_info *page;
-    unsigned int align;
-
-    if ( offset > (PAGE_SIZE - sizeof(*new_info)) )
-        return -ENXIO;
-
-#ifdef CONFIG_COMPAT
-    BUILD_BUG_ON(sizeof(*new_info) != sizeof(new_info->compat));
-    if ( has_32bit_shinfo(d) )
-        align = alignof(new_info->compat);
-    else
-#endif
-        align = alignof(*new_info);
-    if ( offset & (align - 1) )
-        return -ENXIO;
-
-    if ( !mfn_eq(v->vcpu_info_mfn, INVALID_MFN) )
-        return -EINVAL;
-
-    /* Run this command on yourself or on other offline VCPUS. */
-    if ( (v != current) && !(v->pause_flags & VPF_down) )
-        return -EINVAL;
-
-    page = get_page_from_gfn(d, gfn, NULL, P2M_UNSHARE);
-    if ( !page )
-        return -EINVAL;
-
-    if ( !get_page_type(page, PGT_writable_page) )
-    {
-        put_page(page);
-        return -EINVAL;
-    }
-
-    mapping = __map_domain_page_global(page);
-    if ( mapping == NULL )
-    {
-        put_page_and_type(page);
-        return -ENOMEM;
-    }
-
-    new_info = (vcpu_info_t *)(mapping + offset);
-
-    if ( v->vcpu_info == &dummy_vcpu_info )
-    {
-        memset(new_info, 0, sizeof(*new_info));
-#ifdef XEN_HAVE_PV_UPCALL_MASK
-        __vcpu_info(v, new_info, evtchn_upcall_mask) = 1;
-#endif
-    }
-    else
-    {
-        memcpy(new_info, v->vcpu_info, sizeof(*new_info));
-    }
-
-    v->vcpu_info = new_info;
-    v->vcpu_info_mfn = page_to_mfn(page);
-
-    /* Set new vcpu_info pointer /before/ setting pending flags. */
-    smp_wmb();
-
-    /*
-     * Mark everything as being pending just to make sure nothing gets
-     * lost.  The domain will get a spurious event, but it can cope.
-     */
-#ifdef CONFIG_COMPAT
-    if ( !has_32bit_shinfo(d) )
-        write_atomic(&new_info->native.evtchn_pending_sel, ~0);
-    else
-#endif
-        write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
-    vcpu_mark_events_pending(v);
-
-    return 0;
-}
-
-/*
- * Unmap the vcpu info page if the guest decided to place it somewhere
- * else. This is used from domain_kill() and domain_soft_reset().
- */
-void unmap_vcpu_info(struct vcpu *v)
-{
-    mfn_t mfn = v->vcpu_info_mfn;
-
-    if ( mfn_eq(mfn, INVALID_MFN) )
-        return;
-
-    unmap_domain_page_global((void *)
-                             ((unsigned long)v->vcpu_info & PAGE_MASK));
-
-    vcpu_info_reset(v); /* NB: Clobbers v->vcpu_info_mfn */
-
-    put_page_and_type(mfn_to_page(mfn));
-}
-
 int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v))
@@ -1662,14 +1557,44 @@ int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
 
     domain_lock(d);
 
-    if ( map && populate )
-        populate(map, v);
+    /* No re-registration of the vCPU info area. */
+    if ( area != &v->vcpu_info_area || !area->pg )
+    {
+        if ( map && populate )
+            populate(map, v);
 
-    SWAP(area->pg, pg);
-    SWAP(area->map, map);
+        SWAP(area->pg, pg);
+        SWAP(area->map, map);
+    }
+    else
+        rc = -EBUSY;
 
     domain_unlock(d);
 
+    /* Set pending flags /after/ new vcpu_info pointer was set. */
+    if ( area == &v->vcpu_info_area && !rc )
+    {
+        /*
+         * Mark everything as being pending just to make sure nothing gets
+         * lost.  The domain will get a spurious event, but it can cope.
+         */
+#ifdef CONFIG_COMPAT
+        if ( !has_32bit_shinfo(d) )
+        {
+            vcpu_info_t *info = area->map;
+
+            /* For VCPUOP_register_vcpu_info handling in common_vcpu_op(). */
+            BUILD_BUG_ON(sizeof(*info) != sizeof(info->compat));
+            write_atomic(&info->native.evtchn_pending_sel, ~0);
+        }
+        else
+#endif
+            write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
+        vcpu_mark_events_pending(v);
+
+        force_update_vcpu_system_time(v);
+    }
+
     if ( v != current )
         vcpu_unpause(v);
 
@@ -1699,7 +1624,10 @@ void unmap_guest_area(struct vcpu *v, struct guest_area *area)
 
     domain_lock(d);
     map = area->map;
-    area->map = NULL;
+    if ( area == &v->vcpu_info_area )
+        vcpu_info_reset(v);
+    else
+        area->map = NULL;
     pg = area->pg;
     area->pg = NULL;
     domain_unlock(d);
@@ -1830,6 +1758,27 @@ bool update_runstate_area(struct vcpu *v)
     return rc;
 }
 
+/*
+ * This makes sure that the vcpu_info is always pointing at a valid piece of
+ * memory, and it sets a pending event to make sure that a pending event
+ * doesn't get missed.
+ */
+static void cf_check
+vcpu_info_populate(void *map, struct vcpu *v)
+{
+    vcpu_info_t *info = map;
+
+    if ( v->vcpu_info_area.map == &dummy_vcpu_info )
+    {
+        memset(info, 0, sizeof(*info));
+#ifdef XEN_HAVE_PV_UPCALL_MASK
+        __vcpu_info(v, info, evtchn_upcall_mask) = 1;
+#endif
+    }
+    else
+        memcpy(info, v->vcpu_info_area.map, sizeof(*info));
+}
+
 static void cf_check
 runstate_area_populate(void *map, struct vcpu *v)
 {
@@ -1859,7 +1808,7 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
     switch ( cmd )
     {
     case VCPUOP_initialise:
-        if ( v->vcpu_info == &dummy_vcpu_info )
+        if ( v->vcpu_info_area.map == &dummy_vcpu_info )
             return -EINVAL;
 
         rc = arch_initialise_vcpu(v, arg);
@@ -1990,16 +1939,29 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
     case VCPUOP_register_vcpu_info:
     {
         struct vcpu_register_vcpu_info info;
+        paddr_t gaddr;
 
         rc = -EFAULT;
         if ( copy_from_guest(&info, arg, 1) )
             break;
 
-        domain_lock(d);
-        rc = map_vcpu_info(v, info.mfn, info.offset);
-        domain_unlock(d);
+        rc = -EINVAL;
+        gaddr = gfn_to_gaddr(_gfn(info.mfn)) + info.offset;
+        if ( !~gaddr ||
+             gfn_x(gaddr_to_gfn(gaddr)) != info.mfn )
+            break;
 
-        force_update_vcpu_system_time(v);
+        /* Preliminary check only; see map_guest_area(). */
+        rc = -EBUSY;
+        if ( v->vcpu_info_area.pg )
+            break;
+
+        /* See the BUILD_BUG_ON() in vcpu_info_populate(). */
+        rc = map_guest_area(v, gaddr, sizeof(vcpu_info_t),
+                            &v->vcpu_info_area, vcpu_info_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
 
         break;
     }
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index a6b22fa2cac8..54d88bf5e34b 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -80,9 +80,6 @@ void cf_check free_pirq_struct(void *);
 int  arch_vcpu_create(struct vcpu *v);
 void arch_vcpu_destroy(struct vcpu *v);
 
-int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset);
-void unmap_vcpu_info(struct vcpu *v);
-
 int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v));
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 6e1028785d8c..3609ef88c4ff 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -176,7 +176,7 @@ struct vcpu
 
     int              processor;
 
-    vcpu_info_t     *vcpu_info;
+    struct guest_area vcpu_info_area;
 
     struct domain   *domain;
 
@@ -289,9 +289,6 @@ struct vcpu
 
     struct waitqueue_vcpu *waitqueue_vcpu;
 
-    /* Guest-specified relocation of vcpu_info. */
-    mfn_t            vcpu_info_mfn;
-
     struct evtchn_fifo_vcpu *evtchn_fifo;
 
     /* vPCI per-vCPU area, used to store data for long running operations. */
diff --git a/xen/include/xen/shared.h b/xen/include/xen/shared.h
index a411a8a3e38d..5b71342cab32 100644
--- a/xen/include/xen/shared.h
+++ b/xen/include/xen/shared.h
@@ -44,6 +44,7 @@ typedef struct vcpu_info vcpu_info_t;
 extern vcpu_info_t dummy_vcpu_info;
 
 #define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
-#define vcpu_info(v, field)        __vcpu_info(v, (v)->vcpu_info, field)
+#define vcpu_info(v, field)        \
+        __vcpu_info(v, (vcpu_info_t *)(v)->vcpu_info_area.map, field)
 
 #endif /* __XEN_SHARED_H__ */
-- 
2.42.0


