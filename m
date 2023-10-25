Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9054A7D6A44
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 13:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622841.970037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvcBb-00023Z-0o; Wed, 25 Oct 2023 11:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622841.970037; Wed, 25 Oct 2023 11:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvcBa-00020V-Tw; Wed, 25 Oct 2023 11:36:30 +0000
Received: by outflank-mailman (input) for mailman id 622841;
 Wed, 25 Oct 2023 11:36:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ/a=GH=citrix.com=prvs=655ba0516=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvcBY-00020M-VV
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 11:36:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b96e7521-732a-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 13:36:24 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2023 07:36:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5163.namprd03.prod.outlook.com (2603:10b6:5:22b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Wed, 25 Oct
 2023 11:36:10 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 11:36:10 +0000
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
X-Inumbo-ID: b96e7521-732a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698233784;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3FkM2wKXjZKjn4m7U1hb3SBilx05HDd5OrFf2UQw+vw=;
  b=X0KXCywNSBJtTiJBh+U03c02l7ID4opIis7Et1YzFnQxqUkDr5Me4d2T
   W3gTjnSDzAI4xR4H4LGkCYtYMwhfgPZAb4Lw+CiltEXYS1TsdasbuMShK
   RZRDo0XTv0/Ndtk80MyplkX3CLb80I2ZIJ0OUZK1ggrtBWJVL0+/fBiOG
   I=;
X-CSE-ConnectionGUID: JXLpHJByQJyYyKjCxQktzg==
X-CSE-MsgGUID: qP4yXWF+RmSXvSQ+4YcCQQ==
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 129379133
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:jeS1m6LmZS8cjf+XFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENS02QGm
 mNODDvQa/6IZmuge910aY2y8k8O7ZeHx9ZkTAdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gZjPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5VMUVW1
 d4yOQkvfyGSpOCd0Iu4Vvtj05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLlGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv217SQzHqgA+r+EpWhzqJ7sGK9hVYWMy0IbmL4/ciyoXeHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8kN+pES0cLGtHYDBeSwIAuoHnuNtq1kqJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNTNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:nUrXIqwEGc43V0ViKWf9KrPw5b1zdoMgy1knxilNoH1uA66lfq
 WV98jzuiWYtN98Yh0dcKm7Sde9qBDnhP1ICOsqXItKBzOW3VdARbsKheHfKlvbdBEWndQ86U
 4PScZD4dfLfD9HZeGT2njAYq5Qu6j8zImYwcT7x3dpQRoCUdAd0+4AMHfnLqWpLDM2Y6bQLP
 Knl7V6TpGbCAUqh4CAdx04Y9Q=
X-Talos-CUID: 9a23:UuTsdGy0xfyCNd7nTFsdBgU2KuQ9Ul/33U7yMn6pKmRCWISWVU2frfY=
X-Talos-MUID: =?us-ascii?q?9a23=3ArAgZAgxcv87Ml120ttlGLiIJ4TeaqL2WVFE9rrt?=
 =?us-ascii?q?Fgcy/BTJLAnTBvT+ce7Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="129379133"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQrigH9L2jJjStuXy7Zb9AI/fdkqqAgm3xq1ibSdotv9033q/PbvFSlYHzwo73G9PeSWwjVstSLMSGPJI/oci5VGrZsULFxKBgeCrz+0XCbijfiyBlx9KrNFjTLjL1mbXAiwwPVxPolG084FfEQFockp2S0znjnnyKqDFsV9CghyBe2PuiHJKh/nC+MgaXBq8rvuX+Q9tI66QM65OU23nnbAAFXNe1U87CmXs5kKcS25MlEOfaFKlSgE0O1bgbf5A2oK/J4kA6jjdQNPGD8JZZGcKgSJVMqiRy45gXUA2CJen2eofg7rtBLHPcEaKPsC7RRHAf8ibn4ZpnEK2rpOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KD12ehCbqJFJVjDrOF7nv9dUFAjjtzDlwKCwPl9jfvM=;
 b=YCx9x8I2AUVMY2kZFQr4DR/JSfBUn79vSA5Lcvu2bNgWZal9PGHcxKyzF2B+PlO1EpqSZazXEafQMi6p9qnyHYnkSCpc7hO7sLmaA6je1J3AR8ygO2AlJq/H8qDQ4ZzYmZUjkx/peQmVBBsA/tfHHsUvRlL2bQEykjAIDBPu7uMqCvZmHh4rPvqTVb/JWsTU9Hhr1xL+DaNV6p6VJO9oI1JOUGTJx/opbwLhNKZ2GkVSIbgFFVG6Yxk22fIhVp15WgembzQNHR3lj8fCE2tQgvV+zAVJGdlf7vxTNRLDYtnSVVY15Ozoq5M9c+4oNIuqU4m4lju5XgGi3YtI7vfOYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KD12ehCbqJFJVjDrOF7nv9dUFAjjtzDlwKCwPl9jfvM=;
 b=p1/1L8SpUBH4HhDwnQVTb1YicYEvjnBZfjseUSwQILfG/1D86kaJytbPwYZX8L3hWKOl8f8u0pjx7tKE0mMYE0/f/SGGA1xGWTV+sFEAOIA9CTDTq/8r5ghU2COHKVhjaXO1vQ1rBT8V4gV0tnNhMpj85LiBkUp2meY2eCtAo7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 Oct 2023 13:36:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/vRTC: minor adjustment to reads from index port
Message-ID: <ZTj9pbcqezLLQvjd@macbook>
References: <39903e79-af15-9017-e470-65124bd60847@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39903e79-af15-9017-e470-65124bd60847@suse.com>
X-ClientProxiedBy: MR1P264CA0203.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: fe845315-4d37-4256-1cad-08dbd54e95ef
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0tKyNJMutbg0FaBxrxX8wzXOmTTkG2cRFN8AaCB1R599LWaHmLiWAb61yoClkRQvZtqejgJ2nZ/joJ7x4uNzFRSSBXlNEeG8YPujcLvRBuK3N06vwuLYXxVcCjYhLfhxrKc8gWEsqQ2TsDRZngbLaaWR536x5Skmp1F8rkh6p3HMvkKym8+vmvNWPYv03/jfdIGjNmp9qwNheDIoBC5jO4o6jSB7KwFWAfaVwiZdyOkN3VvwCwqP2IH1AQ0+YzIXtEqJHsIrjr8aTq3IXmyRsUoCq1GV4ERu8FgTD9TsmPYDOB48H/8Aopb+84qVtAnN4oLrvjlKV3/4sft8p2WoC9EiBILyF8HPJ5Sg32Ei1XF/T/P7DA6EQ5aNd1QrGw+ORt6mOIavBWUFMSeLafDVEYNq6+jT5NqL7ty6Ozb7c/4nkaOe3MiJ5IBPTW79v5+MIjZmWr6/B8YgLQ4mzO+NMSNBO2TIrE2psczBFfyzxcvOEmJxsVQU8ft6C9wKIoUwGYAA4fP4rXF6s7TKdKDCmD/k4g6sk2bKY2WWiuQRWr3S7kZ6E24dsqQfIwhHpKsr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(2906002)(33716001)(6486002)(85182001)(82960400001)(41300700001)(8936002)(4326008)(8676002)(83380400001)(26005)(4744005)(5660300002)(66556008)(38100700002)(66946007)(66476007)(6916009)(54906003)(316002)(6512007)(478600001)(6506007)(9686003)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODUvQklPU3N0amw2Ym9CcngwT1ZGMkFndXFiWVBmV3QxV2VwZkJidkhVSU8x?=
 =?utf-8?B?Mi8rdUtDZnd2dlJNbEpKdGZ5cWI2WTBaWnRQRndYWkJtTk54NU84UUtHczJW?=
 =?utf-8?B?SkQvbS8vaWk2UGZmV3VzbVFEbmhKUFhOQ3lhV0Q4Q2Q5UW1adkV2MVc2UU12?=
 =?utf-8?B?Y3hYTTNDeWZDcmFUYzVMU2QwbWZaZTc2UlBuRFNSMlFpcEIxVHdqUEVKcGV1?=
 =?utf-8?B?TFRWVDEvdHNIaG9jSklRck5ZaUlSaFNNSE9ncmN1dG5ObU44dURSbHM1ZEtD?=
 =?utf-8?B?SHlVSTJIbnZkODM0V2d0ZGhva3h5bkUza09vazc3SzhqOXY0d2x2c2lGU0ZV?=
 =?utf-8?B?MWZGWWFlZjR2ZnY0Um1rL21WMHFRRjZmZW5EakRzcDFaeXM0UFBHNGxZeUJP?=
 =?utf-8?B?UTcyazF0UlZzaTExNjRGODh1aGlFc1FBNVkyRjdxeWs0U0p1d0FIZ0NZUTFL?=
 =?utf-8?B?aTFnRUxTVDFzWndJNFlySXdqQ3JtNEp0YjlnaVVHY3g5OVA4aDNsdTZ3ejFp?=
 =?utf-8?B?TkkwNkpleGsxRXVtLzloa0NWaUxxR2JkS1RJanBtcGV5dk43Y1lGak5Zcmhh?=
 =?utf-8?B?eGpzL2Jjc0NxV25LZWJKMzl4clgrdDdmQ1hvWjVJTEp0TEd0R2k5Z0luZjEx?=
 =?utf-8?B?emVoS0xrRXJFdC80eXUrUEUyL1FnRElGUTNHenJEY3ZBMXViTXFxN1EyaDNl?=
 =?utf-8?B?MWJ0ODZhRVkyKzhLemFXeThTSWVCM1ZNNjNPeVgyeHdrMUY5VDBEMEVnak9P?=
 =?utf-8?B?bDEwbmxEU2VPZFUwZ1U1SFdoa3FuQk1JUnBycWI2NkVhZk1tR0xEdCtBRVA2?=
 =?utf-8?B?K2R4cUU5N0J2N0oyMHlxcmJCaFlMc1FJc0E1QmVaVG01dmJHL093QnNtZ2gv?=
 =?utf-8?B?VmNuL3JMVFNYcjg0bUMvWHg5U2hVZnA4NldVcHF3VlgzdjZCZTAwWFAzSnpn?=
 =?utf-8?B?REVGMndsUmhWY2VjMkdGSjc2cUlKcE5Pa1VrWlphNnhibmxWcEVVOVZWODBp?=
 =?utf-8?B?elJhcFBjMkZ6S05oT2p5ci8xTnZzNjZHdjk5am9sQVZDZWZzdk8zNE1udHRl?=
 =?utf-8?B?YXdZN0d0dnpIbVR3SFc0ekFYbUV2Y1FkYWovb0pnTXErd1J1L2lja0FWNUM5?=
 =?utf-8?B?N2RtTUQwWjNra2ZjcXIwUkVpUTQyNlo5WHhKVUV0UmhKSHlUZjdxaytPUjB4?=
 =?utf-8?B?cUcxRk04b1RKbGxYZkdneGZKUVZ6aTFQRjQ2b1FkT3RlZVNQbTU5Q2tQY2Ra?=
 =?utf-8?B?NHVUTFo4bzF1K1p5L3k3VjB2YlpiSGZDNnd0WTcyTUpSdVNheHdIWmV2N3Jv?=
 =?utf-8?B?OGN1VHUvUGwydWsvVjRYaUJEZFlHaWgyZ04xWHk3L2lUV2lrWFZFVDhQVm9q?=
 =?utf-8?B?Uy9mL1VZZWRiVUJsUHFRdG8yeHJIdUtpTmlucDMzV2lJRHRjUVVqVC92a1Jv?=
 =?utf-8?B?V1FjcXVid2dsNitmb0hhZndXUlQyYnRVSVdrTjFPWkRONmxyQ3ZNZW1oT2hG?=
 =?utf-8?B?b29tR0tlMGRkdGh0SzF0YnRMcHA3L205L1VheEhXK2lJY0Y5S2ZDWUlReS9T?=
 =?utf-8?B?NzE0L2gxVEp4WmNXVEY0VFpJZlJ4dnNLTVhxY2NvTks2UzFiU0cxR0dzWnZj?=
 =?utf-8?B?d1M0dnJoTjZTcHQxYXpyTmIvaHZ4SlFZTFM5ZENkYWllNGdldy9RVXVzU3E1?=
 =?utf-8?B?YkdjT0RlcENaUzJxY1VPTmx3MkxJcjdaZGEyRWVmWjFZcU92NkdEQlZ2QUVn?=
 =?utf-8?B?N0RLWjJ4Rmc0cEFqcmRtVjFGWVhjdVcvbk5kMmhJYkQ3SmwzcmlGcE1DeThO?=
 =?utf-8?B?KytkbHBIYlZBdWVxZnN6eTA0Qnl4WlRNbjZ0N2Z2ZjJ2Z255bWdZNW13WEdD?=
 =?utf-8?B?N3ZoeS9LQzNtYmJGQy9Weis3OW5VNzJwb2IxRFVFTnYwekEwZVVEdUFsQUhN?=
 =?utf-8?B?K1BmMDI0YXA5OUdjYjlpYTAvdEpGb1VDY3lESGZ6eHFPZ3A0QmNvVTFqUTl5?=
 =?utf-8?B?eDhpaXhWNFRvWWZtb3JZY2Z2YlNIdm5kZWN1b2dJSXhSaWhibm8zWTFFUlNj?=
 =?utf-8?B?czdlV1NwUE5ZNGlMOVh5V0xiTURoVTFUMlEyU1FETllmRkY1ZlUwZ00zNGM1?=
 =?utf-8?B?cVJtMmpoOXo3YTFLYm5PSFl3bGJlSmRlWVhjSzVHd0hpU0NHRkJSZEE1Nklp?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ETBaJqBZk8yhPT5jOafnQoyM4GE2jtEJjR+wH5qm+g18gQ5Tz0R0zOvxqqKFGgzUNdKe7CfGCVy59C3Vucnm7AviC/FGhLWNuJu1zdjZT7tbs6zo0BLUrQI8/YgH60htrqBQB8RKCAq5N4sESdl5jT/ZCpmuBxZYEKZJKRyVNka+McSFr+AZmYP3c9lH1HQ2NeOc1BSj0gpNP9dsQAUawfwQ21XkeEmwSAP1MbJp2EQyLbvN4vAPPgJl7RMssjInjRGGHDe4OGnOHQUeTRNYetci/bPwpn+ZVQUMFabUh8bGkft6rLHu7jEuxyeWNXyaf/0B9lXt/I94kXz1DD6AGhnH+OHgAY/Sd9q6jA1Hwy8GUKR5cbPT6j54lr6Te1fIIgptJObdXOa/prV7PnNbUlKkpdtRe0mXvVi9QP0+6+ZvXYo6tqn3J8WbG+wrFr3dGxnrRRKhcYr9Jc5ovrrHyR4hFYylGZCgAwYpd1EehZMHxUn0FWYoGpEo6OY49Hzl/xgPv6mwSFEhQyghpPQo/02BGi78jJ03xjfaSgc71I7Gtlt9KUuQ5KhjaqIay3fK3bK5eFvw8qaAAKYNg+qNc5QTv6Js/sV5dxE4Y2V0F795A80mOQPx+r2lSIEr1SH6/I2uBbWSVs6TpdV6+y/V6BpX+iuqohMujOpyP8r5IKrKANoaNNfbWwMTqDGts6TVY5PSnKT5lxJu0IXbYYJJdiCgd8O3hfkejkx7AMNvREwJGETfmjCy0XVQmunV6nix2bElm/6iSvDUocWpMhutEptTAL5Ry1sv68wheO8pc2OfX6u9SanMVlO7X5+ukjYzcZf2G9VarOn2WQYQIuew0g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe845315-4d37-4256-1cad-08dbd54e95ef
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 11:36:10.3991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tv2EDZ+9cRLymvvQTdKCFyeyjhpWLv+/XHk+8vM3DXhU1rWEV653HqTKQpKAhb+BLl5qnDfpKjFArK0PEEWO1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5163

On Thu, May 11, 2023 at 01:51:06PM +0200, Jan Beulich wrote:
> Whether to handle this shouldn't depend on the present value of the
> index register. Since the handling is done outside of the lock anyway,
> pull it out into the sole caller and drop the no longer needed function
> parameter.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

