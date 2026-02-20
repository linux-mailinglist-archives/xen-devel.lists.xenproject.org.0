Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNcNEjMgmGkiAwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 09:49:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95834165ED0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 09:49:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236920.1539395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtMC2-0002ST-5I; Fri, 20 Feb 2026 08:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236920.1539395; Fri, 20 Feb 2026 08:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtMC2-0002PP-2P; Fri, 20 Feb 2026 08:48:58 +0000
Received: by outflank-mailman (input) for mailman id 1236920;
 Fri, 20 Feb 2026 08:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uNHm=AY=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vtMBz-0002PJ-T9
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 08:48:55 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc7fe80a-0e38-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 09:48:54 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7401.namprd03.prod.outlook.com (2603:10b6:a03:55b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:48:50 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 08:48:50 +0000
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
X-Inumbo-ID: fc7fe80a-0e38-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NL2NBGw1Mfuak6N9moH3Dn3z2f9CgypPXa0Z/ovt/8st3JKQQ8y2q3lN0D3uWNFKNP27RA8/B9/Yi3+wsmIRzHzZ+rCYGmbXmLC2OVfsVQ0KL7iK3Q8Js8GS6vo3pbE/kAsphJI//AedAKl0SLAfXf+jUy0ds7jGVjfydouhAiW1U1oQd/rirTdWytv5TI5vn8O/qSnEswcUb5vsAuvvVnPPpcxOMsplfX8Md1MU04p5HqKyBDjrmR9YqV2PyVEkI/2Voessgy3opfIvvpwLxRlC5oBMyeZBAOzmChhZkpl1bEDZpTI6316Dw98wRPviTPl1I8Eq4oM7VtNuRw7S6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG3XSX3WWE4jgKeyckeb4tuY6g5uiS9krAoBVcGeek8=;
 b=ETXnIePfJxekMOWi5MR2ABa+vPsLDnENGHPYMQLk9POpLflv4TbkZpy5JBtccFNiI89UV8osoJCOOPkNt8fU4LXI/GaYirC8Mhyt3F+UhVltZLBrMAIJNhZaaTBsLwzr1bOR+5tHRGko3KNoE4lCLr6jol0alXXF7B+vLtR4IViF++beKFp6bpBrmXAc00PE5HKek8SsrZQTHpwCwz21C6DxQmNpYQGQyz0tk6EaibNJAG/peSPC4PX6SdHa2/cvHSwh/RQ9swLx/7dIyT8cjXKn9gtw/55dJoZ3TdPJQFvNcu6r2SXdid87wCbsjUEF/wQyNaBmvtyyLZlK2BrXZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG3XSX3WWE4jgKeyckeb4tuY6g5uiS9krAoBVcGeek8=;
 b=cw3/q3N8S8wR1hpqBgcR4FJWjP58spVDBIggdz3f5mgit1HOHXBqkuxZ85mKbIp+YqAvl4VwUnvLeTU05/gfmcJvJKVghCirlTYWoP5SmWt2wy4cj0NIisIOyAg5EI+9mek3DPvPcS6KLpyvk0t02SKt2sUvPwitgvtTkPMyY6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 Feb 2026 09:48:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v4 3/5] vPCI: move vpci_init_capabilities() to a separate
 file
Message-ID: <aZgf72lwLryKCb6L@macbook.local>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <c90890f0-2e6a-43d9-84f9-b0ea19a11d3d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c90890f0-2e6a-43d9-84f9-b0ea19a11d3d@suse.com>
X-ClientProxiedBy: MR1P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7401:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f259bd-9b0c-4771-4633-08de705cde31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnE3VUdQSzhUbW1ZOVdyald0V2hwR3M5VlpGRzdsNTdQTWF4Zzd4U2xIdzRx?=
 =?utf-8?B?M1BJaVlYSEtpcDhCM2FVYnN1OWtCQzJmUzFHUHZOMXpENjIrUmF1R0h4cWJy?=
 =?utf-8?B?elB3d0c3VXdyZXVkTG04WHdtRU9tOXlHR3J6dS9vSUwwNnJUM1BNd0JCMVRL?=
 =?utf-8?B?N2lXT2IwRU9Vbk10V2Qxc2RMVjB6MXBob3BnQzVKR3p3VmQvUjlyU1AwQUY0?=
 =?utf-8?B?SkZsZjNaL1I5amY2U2xsMEc3aVFtVG54QVlNdVdWZ2hLVWN5OVdDN0daeEY4?=
 =?utf-8?B?ZlJSLzdJL3pRcFV2YVo5UDB3NjcxcUUwVmFTd3RucnV6R2N5Rmh5S3hqdDFa?=
 =?utf-8?B?a2xCMTR2eWJPV2lGc3FybWMzTDdCZ0Y3eXRIbnU4OG1GZ2dBRU83U2tKZm16?=
 =?utf-8?B?YTRDTFZDQkdJQ0FzeS9uT1JVQy9ZYlNDR3Z3Z05qSmJsdEo3bzNBNUdVVTRZ?=
 =?utf-8?B?SE5aNWdJa2RTb1hkOW1WNjljNHlCU2M5Z2xYczhvajgwU2JqSVZYa0hpQWVY?=
 =?utf-8?B?U1M2ajZzWFdLT21GalFudWJEeEpHYWlLUDEyT0JST1FNekxaUXFnM1AwWGdC?=
 =?utf-8?B?L0U0QUlodWlmeC9WVGtWOHAwNWhFdTQrNnlNVEhpNFJLWThLZnQ5ZkU5cmZM?=
 =?utf-8?B?SWNMWVlOZEpUU1R6L3hEY3RMa0w1WVhMeHpaOXU2c0dTVlpVVXJPSGVPL0ZE?=
 =?utf-8?B?elUxc3JFSWpVSlR5UkczMHVFL0QwNEhoWVNnb3ZSemV1UjhUZjNydnc2TUVj?=
 =?utf-8?B?YWFCMi80VkFLb0JYU1VhZDV2cnJZa3MrUDgydjhmZnlBbWNzTmpKZ3Eyb2NN?=
 =?utf-8?B?SVJXRlk4Z0hUc2ZWZ1FPc2lsVHhsakQ4clM5RDlKaEYwS0Z3ZjZIY0RyeUR1?=
 =?utf-8?B?S1ovRUpvSTlpQnpibTBUYW4rRGpqZm9xRHcyMFY5MGJORktQbCtKWjZwc2dY?=
 =?utf-8?B?QW5HNlpDUkZtUmxKNEQ0Y0xwTndEUzhsM2g4MC9SUE84d3BmL1A5WkVJUXJ1?=
 =?utf-8?B?WlJOQzFvSzc4cDI5RmNIa2dkajhiNkhrZWV0UHc1MUc4M3R6QnRHSmtnSnQ1?=
 =?utf-8?B?b3pQTERlS3RCSU9Eanh1eW9WeG1xZzhyK0J4SmdIbE9nZkcrYUVhZXVlYjgz?=
 =?utf-8?B?T0JOWDJqUnhYZldyTXF4ZlU4RmZVVnJTMC9RSmMyQUI1Q1JNZHg5MGt0MVJw?=
 =?utf-8?B?aklmbkhYSk9hQ24xTXJFUGRLcjdMRE10YStlZGcxdTdDWExRWm5tUEVsUG9Y?=
 =?utf-8?B?ZXk4d0RtblFYOTgzZW1maG9zb1ltTGZBQTBIT0FSaHZ6Y3dzY0MyMHMyMGNx?=
 =?utf-8?B?c09wL1EwN3NSNHpTNFJwaWxsVjlPYkF1c3dpaTFNTXFxclJTVFdIVnZqN0lO?=
 =?utf-8?B?NFJEd1hndjlmVFRuYXhibVNtcW1IVU9aWnZLZ2g3ZEVGb083dGpTMEV0UFRP?=
 =?utf-8?B?dW5IRExFTDEycS9xeGpDYlJQS0FFMW9DTCtDQzVHdjYwd3Zwa3ozYXIyaDJY?=
 =?utf-8?B?ci9OWHpJQWFxc3gxdzVORlpxZEhmUHZ0eWk4N09qdkYxYUIyOEl6ck0yQkVm?=
 =?utf-8?B?NnFadHJDQkhWWjNURWRlWXkyNDVDZjYxdVdDeFYzdzBBNDlDd2cyVVNldHF2?=
 =?utf-8?B?dVVmcmpsN3plb3ErWTVlSitadTc2MEV3UlB4bFlsR3lDMThOOVpjMFpsd21U?=
 =?utf-8?B?SnQvSWlMLzZLaDFNTVpnYVhNTzJVZTFvSmQvdkFuK3l2TTdyTTRoTmJ4OVMr?=
 =?utf-8?B?Qk5sNEtXV2Q1WEh2QTNOM0xtc0hqYVlMdTczL0I5NVp2MWVwWVNwTUdSUU9s?=
 =?utf-8?B?SGlPanFZVFVwYU9ndEhjWEthSkVOd1FOK0tic3NIaTk2MFI5bS9oKzMveW92?=
 =?utf-8?B?a1hkWjJwSCtJb2dtelU4bWxpZjVWV05LMnkxYmJ2U0h2OWwxbjNCdCtUYkpZ?=
 =?utf-8?B?M01Ka0tQYkpveWRBSjdXVzQ0OEE0bEJhdVZRMDZ4TEg0TWViMDQ2YXNXMVRN?=
 =?utf-8?B?Y1IyK1VQNys5S0ZLK2JVUmRINllWNVU1d3NUb2ozNDdXNVp6TWthUk5CR3lL?=
 =?utf-8?B?SVJEQmloR0RsZG8wWTBzbmJnMUhZZC83SG83SWZiQ0lrVFEzenA1NHdkV3pM?=
 =?utf-8?Q?3nyo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWlMeTNESFI1STNCYkZ3OFd5eFdES1JlVXlTWSswUFNRMVM5VmwvN3pIR3JX?=
 =?utf-8?B?cjBNK0RUcGl0cTc4OVplMHE3VzJFaHFzTFEwVXhtTHRVNnhqOVhab0NTS3Bt?=
 =?utf-8?B?Q1RuL0NBbElxY2xkMTIwbnJKVno5OXljS0JvOGtJdDNYQWhDMFZMYzRTUzJ5?=
 =?utf-8?B?RXo1V0lxRG1WWmVBTTZVWFhsa0hzTkNuQWFoU21HdXR2WXZFUjlBQXVOM1dG?=
 =?utf-8?B?c243UXpENXQvN2hUSHNxRlNldVJyMnBjZHJlbDBCQzVoNlBmSTNuRXJyUWxm?=
 =?utf-8?B?eWtVYXJSZEJ0UXpLTWNwNkdOUVpHOVJJMUw1dGl2cWpmNkQ5bG82cUxKZktz?=
 =?utf-8?B?ZmE3LzlDdzNiTzJ1Y3B0NDhnRHhKdGtDc3pzWGV5ait3RjN0WXh6ak91T2F5?=
 =?utf-8?B?MjNlK2pGWXVxaHY0YjE0VWZiUk9JOE9OUlFyakJCZU5mZGVJL0hqRGxCSTBn?=
 =?utf-8?B?bmlpcUhOTnZZVWRVRFhIdFZLYmtxYndXZWR1RnJCRlg4OGk0RFFNNmJMRXN5?=
 =?utf-8?B?eUR4aG1udFkveU1pUkdXaTF5SGI3Q3hCQU9wVE9Jb3dIdDlCL1d2ayt2Sjk1?=
 =?utf-8?B?VW00dTV1eWM4c2tmRm1KTXJHYmZDYVVaanJjd1o0Z0NuMk1NajZvdkl5N0kz?=
 =?utf-8?B?MGtQRHFjUnkyNlF3RUxGRkJxWWVHOXFmbWtvYTRRY0hQb0Y2elBER0RienFD?=
 =?utf-8?B?bWsvaE9HSHdES0liYWY0ZVIwVDdhQTZERUppdFhGa3BtU09MYmtFZ2twb3g4?=
 =?utf-8?B?dTFpSVRRVnN0MFNRWXd4emRBTVYvcHVZK2JVWUpHbyt6bWxIVE14V2dZY0NO?=
 =?utf-8?B?VHJ3UnI0VVZnUVV5dmxWbkpoMFpacEVCbkhKbk01c2ZORWVpMHp3akJZMWpG?=
 =?utf-8?B?MEVDNzJGWXREUzYwaUdoR3NnUWtHK25PNkpScCtIMlZ5Uy96eXFLYUNtTmNZ?=
 =?utf-8?B?Zkp3QWwxTlFKaTlZTGF6UEFKd09oRG1PVWxpQVFEK2E5RmRxWUtNOThOVmI4?=
 =?utf-8?B?L09IbytTUGY4LzJ1UDhWMm5rZUM4RCs3cWJ5aitCait2cFQ3K2tTNWJrTXoy?=
 =?utf-8?B?dzBCMm1jSTdFRjF5ZlB6TUwzRmdwNXRhZXQzbllNYWpsN29PSWlNU0FnN2tL?=
 =?utf-8?B?MFc0bGJ3STZjR2RXVnE0a0RoczNGbmwwaFI1ck54MUQxRjZZYzZZU08zUXZE?=
 =?utf-8?B?TTgwRFhaaHFwelpiMVVScER1TkozZC9EMnY1Qk41Rm9kb0tDallnU0tIL1V0?=
 =?utf-8?B?Ukg1SjBuUzl4aVd2c2FUT05RQjgvNVBjOXhLazIrNjMxQ3ZzS1ljbXJTSlJj?=
 =?utf-8?B?MVZOU2lhdExCTGd4Qno4b3VZdHFGSGdvSlMrS0JEbDJUeERzU0xIRElKcllu?=
 =?utf-8?B?aG9peTNvbFdWYVVQUTQ2eXE5R2R3SmJFeGxaZExFY1hoM3puWlM2N1BlbHBQ?=
 =?utf-8?B?QXVEMkJZMkJ6MkNGczRLL2ZBUlU2cWQzb0xtZnZ5YStXV1EyWi9wWlg1ZGdH?=
 =?utf-8?B?L0JxM29ROEpjQ29GL1V0dUNNa1IvL0RqYkYyWlhBTk9QM0IwQmE3Ykxzakpz?=
 =?utf-8?B?YVNwem1tZm5IRGNwdk1ka25JczJBNlN6a1JrQUQrOWFUVTVDQmYyNWpEQis5?=
 =?utf-8?B?ZjQrc3FYcy9sWmZNMmRvTEh4akVHMjNpYWdiVGgzMTFjYWJFMFNEM0V4VTdp?=
 =?utf-8?B?WjRzSU5ETzBjNWJPbDFBZFcva1AwcW5uS283c2s0SllqUERONjRkVHE2cksx?=
 =?utf-8?B?SGorYmFVM0V3UzFyQmpmYXhtR052c1NpaGtNeVVjZ21QTUcwSXJiOGZnZzhx?=
 =?utf-8?B?dk1qcnNxQWVnYlk0Qk9kUFJ6SG5ZcHRsb0x1Njh2MFdDOTNnRGhLRWs2cDIy?=
 =?utf-8?B?OFFrS2J5dVUrM3VxMEgyMW1vZXRnOWZvakt4STV4b2x0OE10K1JMaTN1MitG?=
 =?utf-8?B?Q3BRall5bXpJQWo0cmlTanQ1Qy96RnlHWHV5VGFjWXQvVlRjRVE5T0dEYkd5?=
 =?utf-8?B?ZTlOa3NuV210TzBjUEpUMm9wbDlWT2txSDRnUUxKREpGRE1IMll1ay9LRUo0?=
 =?utf-8?B?MHNZcExaU3V4c2lXYmJnNGI0NktqalgxVEVBZnRaQlFHaEpYWWZjWmxEc1FJ?=
 =?utf-8?B?RGhJdFZzV01pblVTM1R2TU45T3ZXZEEwQ1ZVTFczREFzYnhicGRrbTRtK2gy?=
 =?utf-8?B?NWRqZHB2ZlRGU2hiSitaMGU2eUt1RzQrRllKMWhaZDAxa3YvcjBWeFhFbVpS?=
 =?utf-8?B?WVVWZ1BuVnZGMGh3bUVuMEZwNkY1S0gvYXM3U3pLbXNNMDBPQVJheHR5dEoz?=
 =?utf-8?B?cjQyaUNReGFCc216Z014a2lSZmppeVd3SnV4Q2kvc0Rsb0tCd3RCQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f259bd-9b0c-4771-4633-08de705cde31
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:48:50.1397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNiuToh61K7fJOHuLoF3lj6vzU60lea0AfE7LAabAnwvfwuqnr5QsIIVKC6LTK9fejDfdvc8k+J7u/pqT+gfjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 95834165ED0
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 11:54:18AM +0100, Jan Beulich wrote:
> Let's keep capability handling together. Start with moving
> vpci_init_capabilities() and its helpers, plus splitting out of its
> cleanup counterpart.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> vpci_get_register(), while now only used by cap.c, didn't look like it
> would want moving there.

I think it's best to keep the vpci_{get,add,remove}_register{,s}()
functions in the same file.

Thanks, Roger.

