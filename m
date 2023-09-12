Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347B579D62D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 18:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600659.936383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg6Ae-0003yi-AY; Tue, 12 Sep 2023 16:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600659.936383; Tue, 12 Sep 2023 16:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg6Ae-0003x2-6o; Tue, 12 Sep 2023 16:23:24 +0000
Received: by outflank-mailman (input) for mailman id 600659;
 Tue, 12 Sep 2023 16:23:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIu2=E4=citrix.com=prvs=6128f91ed=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qg6Ac-0003ww-8y
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 16:23:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae3f6b3e-5188-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 18:23:19 +0200 (CEST)
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Sep 2023 12:23:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH2PR03MB5334.namprd03.prod.outlook.com (2603:10b6:610:92::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Tue, 12 Sep
 2023 16:23:13 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 16:23:12 +0000
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
X-Inumbo-ID: ae3f6b3e-5188-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694535799;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=YCa3ncEOXYI+eakEP6UK5hkV84JSrjle5EGZWEQ2xo4=;
  b=bvDgtQcq6QkBRmpbV0kC8g5QNE16ohxTXiTsCiA2lo+SctL1daYmJeyb
   kpFG+R/1gJL7hO1ST1VCMu1nv57v4FyKC3J0KofTBzRVFS1y1SwS3FfwT
   LutATVnmRMjEVezMQWB4/qd8aA94rRzZ2XqxcYIu4gq0Pd1wJFrMlmPgk
   s=;
X-CSE-ConnectionGUID: VZlXSnWyTe+rP16Yh2qicg==
X-CSE-MsgGUID: yp6eicw7SCen5wqHwoAJCA==
X-IronPort-RemoteIP: 104.47.58.100
X-IronPort-MID: 121071964
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:SMoxoatGCQAf5j5m3fPuTdQTCufnVHBfMUV32f8akzHdYApBsoF/q
 tZmKWnQPfnbajahf99xOYSw8E1VuZbVx4dqT1dtqntjE3lE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A6HzSFJZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFgIJXiuFuPOKzfGhcrAyt8R5NcjgM9ZK0p1g5Wmx4fcOZ7nmGv2PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60aIK9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAttKS+TpqKICbFu713RNBRwdSgSAivS/11Gne81YA
 m4/0397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM08SCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptXm/oc6i0uXSs45SfbtyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CBhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:Pw5H/KqM6KhoWtxRq5jaeA4aV5rseYIsimQD101hICG8cqSj5q
 aTdZUgtSMc7Qx7ZJhOo7G90cW7MBbhHP1OkPAs1NWZLXHbUQKTRekMg7cKqweQYBEWndQtsZ
 uIHZIOb+HYPBxWt+u/xi+SeuxN/DCAysqVrNab9VtWCStNTI5BwTtDIju6NGozfiV6bKBJd6
 a0145Jpz+tY3QFYt7TPBQ4duLevcDMkJ78QTNuPW9E1DWz
X-Talos-CUID: 9a23:0yfcQW+qWNh00ajXl7yVv3AmHvAedELM8HqTOXfhV1dpEqSUQlDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AZhZquQ2sODAorWDkOoBziXPpezUj8rzwBUEGjso?=
 =?us-ascii?q?9kMSCaDNpGyiapRaca9py?=
X-IronPort-AV: E=Sophos;i="6.02,139,1688443200"; 
   d="scan'208";a="121071964"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YH93UOs5REbwneQb+uclG/qoDDk7aVspwbLbrzSxsCpfrEhHmov0NenKvGr/FkuG9xmddh9I4c7hYrsaJ0pqvXVlM9YWss4jBSo+dUJrY8H5Dm+/ifUbXz6td5k3fCRiJnBYgf+Oz36y1+l0MOwJNpNEIEDJTcgLFbx9lU4TcHQIbzt3CjAPsWJmo306GvcVzDedRHVuV4Y0VSqlLrUv4Mi9YBUsgho9fLeTyL9/G7v540dpJ38vWymlA6z05kxVrLSsk3T68BlG5NGUF/utEMiKQIG+uldxJgoHH8zw+KQSH2+QklfSz9vdH0bdUOC9Dr1UkpJznJQr3AbmwZ7EDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUpOKr6vyLC9qpX+lF7k9otlROwoxEYvztY+ih7pXy0=;
 b=GtsbwNV0ydzRwFon4lgdWtZr6TLHhopiHN9VId17p0euB1A8DzllNV2v8e2rIQ1W+24aVpl9vW9UmUfRXHC0Z215e+uigp4MSjD3OnU9NSL3QCcUj5RbQqcgLWEXenRzeZN+Wo4t6arcfljWB7tKbIEnKOyfw350cdXdzX23r3WOiehAHTUqgbntoblecjzEQ5LrE9tAMZN8rMVzhvYjv+m0Kiyc2b/xDMlN6hHDbIYCrszNc3Cp/HqRHHUOhWCrXTHPhGM2ykX715HosvFPAiK3kurS6hwb2HzEiosxP6f5ytfSZF6vHKLTWvqXFcPmR9nBsr/+58aLk4g1xT6iMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUpOKr6vyLC9qpX+lF7k9otlROwoxEYvztY+ih7pXy0=;
 b=snOs22ZoPgEkt3QLNaVJUdNFPtP4t+DSnoZ6a8/RPNAQHlkSAcoMmBwGKp+1ZC2hip/ljA7Q+o/+G8uNBQK6ix7B7YjuIA7Nze4Ro6+eQ8WyyN7784zycyNguUtPvQPuDcSc7Auuv0FJ1QKWnqPo+C02v7MFewuevSVuZR9EhqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Date: Tue, 12 Sep 2023 18:23:05 +0200
Message-ID: <20230912162305.34339-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH2PR03MB5334:EE_
X-MS-Office365-Filtering-Correlation-Id: 223d4bf5-ba68-44e4-26fb-08dbb3ac8f4e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KG8bk11i0wHBQ+ErNfgknw3Pzy+339bkiCfFbgEbkFRvtdA9dLQ0h9kV24BRgQohIvIaaza3ei/kkEdf4b/JM9RriCNMiP5b+lGu6P9//2OH7aHfYrFjPfP2qUG/pUzP/SiBr3Z6NVjgeljgjNUgsZN88z7ay+osneoSyD4LDZwoBgGgC7vI4jk724rF0c88UgY9a47XdZhYGSrpFN45oT17H5ZmpM9HejcP/cTdUnOpP7RjuWlKtJ8gZmR3UakDLbYe4QgJd7BLHsJjkK0WbXZdOrMFnPj2N41ZI0sd55QTe3HGV7GBW8HGcj1wYCbm9MieB8zYvS8XXG1PtGocdwMTUzG+S8Kk9j/MfYK20GBodR5VdT3JxmjuZ4sh816wq0abivz+SAlWg5TZfhGSZrD8BC/qyD6UTPx38izVo0izN9sDmBrFigTkdbi/Y7qHpeKW/kgolo42LUP/ydtee+iUi/m7IaQQj7Ng93UoXBVqADvQPcsPR5tGblcSdFyYOheukyRPp9DQKhjjll0RE2eiTwuPq2PiwPu3bnTGHPlZEgkVBD/Lxpt6mHwGkrgDmTxCW0fAJKDXCPytpB29tSl6ERrfjbTHyY91cE34SFY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199024)(1800799009)(186009)(8676002)(8936002)(86362001)(4326008)(5660300002)(2906002)(36756003)(6666004)(38100700002)(83380400001)(82960400001)(6506007)(6486002)(6512007)(26005)(1076003)(6916009)(478600001)(2616005)(316002)(54906003)(66556008)(66476007)(66946007)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW1MVTVKMlpXMUkrSFJMVUk2Y3FRQ0tMYUI1SEJLTCtLdFRDSHMxVWQ1YlpS?=
 =?utf-8?B?WEUvdnNrRHQySDhON1IyeHlwbUlFK0I5QUR6cDF4U29wa0VyUGo4VVhoS2xt?=
 =?utf-8?B?S05tUnl0VkRuaU9FS2JpcUFrNmtMUFptcCtjSFlGbzlCT0YzYU1zSTFKVkhJ?=
 =?utf-8?B?V1pNVGM5NWhHZnZBbWd0TGdrYWxXbGZvcndiR0VCdmhRQ0pRVWw2Z1FwWlk1?=
 =?utf-8?B?WlZaOU5JY3FGemd2TUNUcjBOKzJNcktudzdkN3dUN2dzZzNad3RFcmgrZk45?=
 =?utf-8?B?Z2ZmYWVTUThLSmJLL2RCRldNYXZWWm5qVW1zQkloa3ZmbXVkTEY2VHVMMXFa?=
 =?utf-8?B?VEhZSDFDVDdFSTRhbU5teHordFptcTJ6RDZ4Yms4dGJDMXF4MEs4aVhYeUJD?=
 =?utf-8?B?Zy91T1hQU0dJb2hmbisydXZsQlo1T01NMG1KSkZBTk1QaUxwM1Z0TjExcitn?=
 =?utf-8?B?bXhPbUpSZzZsRjlpa3pkOWFvUk1DcVJuTm96QVZWSVVVTFUzYlVUWW1TMStz?=
 =?utf-8?B?MW9CTWxxa0NsOWxDQzJDRk54N0dYTm8xdGdCQ2hwU3FycXJOYkxWSzhaTnVV?=
 =?utf-8?B?ZGViYkFlYUx2ZFVCSitZa3B3YlFoQ3ZWTDdha1VXQ3pXYmlMVnVoN3F5cVV2?=
 =?utf-8?B?VWNlbVdwcDNQN25NZmJsQ01ERDBZZmxMazZ2aElUWjZVb1BWR1paMDd1dEZL?=
 =?utf-8?B?QUlwOWhhWHhFR3hINFdXbmFvNzhzNUNUWGJnTDdLTWNqR2tObTJWRjBuK3FJ?=
 =?utf-8?B?RWNSQkpCeFFrWXh6ak04T3ZvY1NrN21PVkRCMllvVk5rSlBVVjlxemFGR01I?=
 =?utf-8?B?cDFyNHMyaVdDWlJGTjBoSGwwRTR5cjhMV2w0ZS90dWh4TjdTRVVBOUpuRi9t?=
 =?utf-8?B?L0hSa2k4L1FhU0hZZjg3V3RFc0lFY3cwdXlqOG5NVGZGRWJ0bEJXZjdwOVVr?=
 =?utf-8?B?MTFrbWhCRWJWamZ0bWdNNXFSMlYzM0NaRkFZTFBKRmNrd2w1KzZMYkF5NTll?=
 =?utf-8?B?bnpLVW5CTTBtUEFZUGNaUUZUeVNDUE9lMTdySTV3NDcyZ1FEOWsyUERnZFh3?=
 =?utf-8?B?TkNlUFh3K2lxZUUzb3RWS1IrS0RNV3BxOGVFcDA5RHJlWUhnZk4xZElyc1Rs?=
 =?utf-8?B?YmFvM0gwYkxWa1I0OEgvZTFRNWkvVXo3bDFKbUgvcUt4cXp2V0svSENNemJE?=
 =?utf-8?B?MENGcVZpVUdlb1VOYXpPNVkzOW9nUUhPTjVKRThBYVZTS1FuQ2lIZVgwa1Nh?=
 =?utf-8?B?VWJub1pzZlpLaG0rdjVmbkN1ajBKY1BLdSs5VFNIUGc1Q1B1NXhNNnpIbGg2?=
 =?utf-8?B?K1VqYUM0MUVQSEhMRVc4YXFrWGtwTVdVMHc2Z0lWZG8vMmpEUDZHL2tlTjR0?=
 =?utf-8?B?RkdXRUZiNEIzZ0pnL3U4Z0R5VU5aeWlJNWxoUElOTG5Nbk5VUWNMSS80ZzNr?=
 =?utf-8?B?ZFNMNEp5R3MweE9yVUFDbzBXS2V0K3ZYSnJmVGNMS0pWRzZEVDdVcDE2VG9r?=
 =?utf-8?B?b1lzM0JRRFZ5MTVpMzJWaU9YRTd2VmNES0R4UXRuWEFUZllnQ1IzN3Uva2Rl?=
 =?utf-8?B?MEtaaXVTZTRRbURzellJMG1vWjlONkN4WWhlem83VW1XVEY3bGdOV1hMSnp2?=
 =?utf-8?B?aUJLTlVIdTYvYzY1RGIvK01pdUNRd0w1TFNtc2Z3U2tTcXJQemYwWE9UWUph?=
 =?utf-8?B?R2tzZnFXY09sMmNvZElGRXNSSCs5aWpDSnhuNnc0MU1uWW9VTjhUTVFvalZH?=
 =?utf-8?B?T1BWUkZPMzMxV1h5dkd6M2dOR2VtbFljRGpickZkVU92L0hNbUlmMkQrUjlK?=
 =?utf-8?B?V0ZNdkdoNWl3cEhRdDhjR1hndXB0OE5mV3BKOVY2c1pUdWhXYmFIRGZDazVH?=
 =?utf-8?B?bWk4NnFSUWxMQ0NwSDliWnVhcXhjWVQ5SnJWSGZjdzR0eSs3YjN4c1drMUlN?=
 =?utf-8?B?c1d5N3F5MzJHeHB3VE1jQVI2MzdsK0ZYNlZxVnlTVm9ZdXJjNUZtT0dNQUtt?=
 =?utf-8?B?cEJmL2N5c2E0RVlNc3FKa21XRFcva25XUjVHME9xUEphT2VmYXNqejU3dmM5?=
 =?utf-8?B?NkQyWDJMbXRuVWVnbEVGWk16aUVkVUUxWFBkNlB3YXN2TWpxK1gxc2YzeVVF?=
 =?utf-8?Q?n/6yYiCECYPI5JgG+sV3eyc0g?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7JwmohV8m0Ppx0lwW7+d4yWrqo8Qh4s/3apC1aOcaIUlVYQb3YcDRb3jUhVWj+1LdTqEIuDnlIU/mqaQ6bN0YznSLqxlyBvDjBkN+baqF9tx5UwpNqpq+4erDlQLdoI473b7xGlIjmvIujtc7tg1BkCT8piB6XD4N+xhIaa/Jqz+tOK1lmqIRErZ0CC2yM8tdV4ijZC0ji15845qEAL7/OD0m1xzYH1YRt43mjPMeeJ/wyBZa6o1/Y0iJYju6hvcohisd5sFSupvgo49nqA/sOHfm0SxPtwnJKoGm3yi/HpdS/hxsl+YnDxmZgVQuA+sMnvWFaxv3D3Af3vDGH1xs8m3DjfPzZtWdK8OtGo0vpDZGVKOL3LDkPmaL1CNcX5OTMv9g4FbN+56a6egAqXS2oTrOZP3n0RUl9qJbvog5tJ1exKJghDZrJQosdCn+rY7Vwp9QXjMkGkAJPP8Cu1nAwzEk17wR6v1Rpkr695UA11c+TEY4AED51xzcHsJz86oaqOc/r9fp+0+eb15++obLRL4fJs5CCCMcAQ7U1TvMmvVT8wpnSB3U2+6Klq1pH87JwCJWlrq4Prp5KLpE4FSQ59pDZNt4KC+26ZKDy4vW6lsURCoOgfBLg6NGZ5BlmYGxrQ3XOHOU4G7700dLxixps3VmA+6FF7bb087K+btyJIK1VT+xiE95WupZwdHSnCZbalB02cAguLRWlGoamXEQu4Icp/qZeG+FnQKMmW4NlnPzQs9P5uxEFvQLlxAaSBfzDOxr76U4Tgjmocqamne8GnL+HuVvWilAuk5N47xxVL5yIFyiVUw60rB7aeqePjd
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223d4bf5-ba68-44e4-26fb-08dbb3ac8f4e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 16:23:12.6250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8hW/QfgQdeMqO73gQ9+Az3SamR3Msp4RH9IycWAzMqb2qepFkiwtB2/nkboxTdjKRSazSxCeoW7trdqR4t3WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5334

OpenBSD will attempt to unconditionally access PSTATE0 if HWCR.TscFreqSel is
set, and will also attempt to unconditionally access HWCR if the TSC is
reported as Invariant.

The reasoning for exposing HWCR.TscFreqSel was to avoid Linux from printing a
(bogus) warning message, but doing so at the cost of OpenBSD not booting is not
a suitable solution.

In order to fix expose an empty HWCR.

Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Not sure whether we want to expose something when is_cpufreq_controller() is
true, seeing as there's a special wrmsr handler for the same MSR in that case.
Likely should be done for PV only, but also likely quite bogus.

Missing reported by as the issue came from the QubesOS tracker.
---
 xen/arch/x86/msr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 3f0450259cdf..964d500ff8a1 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -240,8 +240,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_K8_HWCR:
         if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
-        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
-               ? K8_HWCR_TSC_FREQ_SEL : 0;
+        /*
+         * OpenBSD 7.3 accesses HWCR unconditionally if the TSC is reported as
+         * Invariant.  Do not set TSC_FREQ_SEL as that would trigger OpenBSD to
+         * also poke at PSTATE0.
+         */
+        *val = 0;
         break;
 
     case MSR_VIRT_SPEC_CTRL:
-- 
2.42.0


