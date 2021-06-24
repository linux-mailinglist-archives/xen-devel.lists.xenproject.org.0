Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CCE3B29CA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 09:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146447.269466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKEm-0004Hp-QW; Thu, 24 Jun 2021 07:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146447.269466; Thu, 24 Jun 2021 07:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKEm-0004GZ-Lp; Thu, 24 Jun 2021 07:57:24 +0000
Received: by outflank-mailman (input) for mailman id 146447;
 Thu, 24 Jun 2021 07:57:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6N57=LS=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lwKEl-0004F5-9M
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 07:57:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.58]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14c08dcb-4c38-46d1-a6cc-5d7d5659f2e6;
 Thu, 24 Jun 2021 07:57:22 +0000 (UTC)
Received: from AM6PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:20b:2e::34)
 by DBBPR08MB6121.eurprd08.prod.outlook.com (2603:10a6:10:204::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 24 Jun
 2021 07:57:12 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::f1) by AM6PR05CA0021.outlook.office365.com
 (2603:10a6:20b:2e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Thu, 24 Jun 2021 07:57:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 07:57:12 +0000
Received: ("Tessian outbound f88ae75fbd47:v96");
 Thu, 24 Jun 2021 07:57:11 +0000
Received: from 466892edab09.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 61AF457D-1B71-4597-9C57-FC8E47695BC6.1; 
 Thu, 24 Jun 2021 07:57:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 466892edab09.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Jun 2021 07:57:05 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5594.eurprd08.prod.outlook.com (2603:10a6:102:8b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 24 Jun
 2021 07:57:03 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%7]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 07:57:03 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 07:57:02 +0000
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
X-Inumbo-ID: 14c08dcb-4c38-46d1-a6cc-5d7d5659f2e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLqfbhX6NaaxpoFNyV/1TQMz4uCXhbWpJ0jXuUgd7Ds=;
 b=XpWg2gdeGdGsZ6tyJMDDlR2rAE9SxI6yyGXPqBXtge44pm+ibb/BE0cqJLCqhHvPZQUJIYX2VwI1XRHJBJU2qxj9T//P63IGQQ/w4eUJrGkD59wBnyHT2LbYiTGdfYp1TuE6HFr01xvXl/vdiA2y6LiMlrY+LVUo28ZSyRGKV2U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a90de0410b0747a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0f78UW3uOpHNusd4o9kDHiVbWLJUw1IHOZzFtjGoEjCW2qgo2Jq/tpWj5UK+Ju5YDmbFCs3tYfmztWCMRlv1cSGjc5bffZFqjs6drP7Q7ljxhzbgxCPZNz3IMZOWuR3TTzubCfuWGsed3PKtU7nIGCzlnfNMDs/McmOUGbbWHaJPrhy58OeUSdQdB9fFRTsIKF2Ucv39MycwpMgZ1ArH/RtHkuk1IkP7q0Cf9tfZ+B31fBfxfKLjjQSePEtfPYbWDWIuz2/9C3YNQj+OK2jjs2bIhlvP5K1SS2fxN6RNEm3WbJngMsLVcLbI4NBy92fKxLjSlfqGvOVD5OwJzey3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLqfbhX6NaaxpoFNyV/1TQMz4uCXhbWpJ0jXuUgd7Ds=;
 b=BewtCYcUQ1/3/oxfU1Dhs672QMoMSpL4oMwDjmD8sab4znHeEz75EmeZL5jmJquTsqVIlr/JsZ2+QWfnFUthEVmcWSnzvpY+34yEW4jo/8bsdALOy6lX6lBFyEEuaU4IUMuatvkczlG2oHQHkhoBM7jnyBOOj842rYO3Z7XVVPVlme2xVMrmzn0noyrgUaExys3TS8xfnrMEkDhiVZU0h50JtnSLLUgudcgzA/IklaaiR1FCR34KbxxaYCYd/7kNK+6MLfP7/k8NXIZR4cqt3Y6S6h+Nf7jWc7/Z30WtRrsoPkeGd8bQiRaybk2zdM0iVq9avWvoAG6rv7qC0lXs7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLqfbhX6NaaxpoFNyV/1TQMz4uCXhbWpJ0jXuUgd7Ds=;
 b=XpWg2gdeGdGsZ6tyJMDDlR2rAE9SxI6yyGXPqBXtge44pm+ibb/BE0cqJLCqhHvPZQUJIYX2VwI1XRHJBJU2qxj9T//P63IGQQ/w4eUJrGkD59wBnyHT2LbYiTGdfYp1TuE6HFr01xvXl/vdiA2y6LiMlrY+LVUo28ZSyRGKV2U=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 03/10] tools/xenstore: Don't assume conn->in points to the
 LU request
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <2e28c385-a8ba-1dc3-c41e-8b39f624947c@suse.com>
Date: Thu, 24 Jun 2021 08:56:56 +0100
Cc: Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 doebel@amazon.de,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <10F0635C-2AA7-42A4-B4BB-A9DD869113C9@arm.com>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-4-julien@xen.org>
 <fa249348-e4a0-13d0-03d7-d3536a8b759c@suse.com>
 <2e28c385-a8ba-1dc3-c41e-8b39f624947c@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::14) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 329d9350-f969-4317-73f0-08d936e5acd1
X-MS-TrafficTypeDiagnostic: PR3PR08MB5594:|DBBPR08MB6121:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6121C7C87AC5457D251C4035E4079@DBBPR08MB6121.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C/9tLoRBpi2e3iq7NdvPpmn9zmfkilMYxqjoQ8IZOeyyLF10dDLVzLjeB6NC7gb9bDRctMm768KzqcvjK47Xpf+cG2XzLrA1W0wVN0Gje9hNVNJVD4c03GhksEPOMEuAvK0PSYANkUTcjWZRVEhd6KSWEUTcwMo4Dn9y4nr1jezl8RBuBAQSVSdaq5OQK+T/xbRhYeJ8i/CtZeudIoTkbhhlqs+jI0E3JI0X2cCVVP6TXYQUwctIWlJGO8/3DAajDG1jTuDltMhCPUzwq4k/j6Nd1mD3J//hr1ITdn+Geb2bI3TGv0ZM4HNrCYRAwI17/SKc1+DMKpu9ON6DbJSlyYOZacnGtFqn5Makpl31DuMIe3iEx/6ZP5XZmquKnklncPNOQVRRm5vAWkBjAo3dlCGYsK5LTTq2rtdhXu7oJEpu5MDHsaII7MiXqszjo9DPV/MrAvJMZ2A+eZSYDIdNy4tKJx2ZqDRq5M7wiPjKAGwNN5Y/ktbq0fUEl/5/ClzpBuUDU0bMqr3YpDEUYNQtLbS6UVhNvFvYNCZsoBjHRwDJk3N0RGH554+7ihVf5MCfKmkeWZZ/BTsn8gZFLs9qB1m4RpwmNedB8fzbWzhu4ovVsVdLzhPLurc35SNNFuN6D/fnfhqzn6OB6VVDTD1VAa+XWZzy7TO0fvx+K+R03G5YhXsoihltcajVZAD2K7bj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(366004)(136003)(26005)(38100700002)(6666004)(478600001)(956004)(2616005)(44832011)(6916009)(4326008)(2906002)(86362001)(83380400001)(186003)(38350700002)(16526019)(36756003)(54906003)(6506007)(6512007)(53546011)(52116002)(8936002)(316002)(6486002)(8676002)(66476007)(5660300002)(66556008)(66946007)(33656002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NnNJV1FTVEl3dFlHd2xYT1lJRWxzaFB3QTVCL3ZmSGhCanhCck5meFdMQ1F6?=
 =?utf-8?B?dnJFNEJaNlI0TW5teGFwUGdTZE5pSFN1eTIwSWwvRCs5ckxSSDROOTB1cFly?=
 =?utf-8?B?TVFxVGYyaU5QeWgydGUzb2ErdGxVZDM4S09VMitONC9zdzhaaUMxOWRrcDky?=
 =?utf-8?B?czBGdVRHM3VXdmdRejBCS0F6Uy9NWWRQSFFGWEVFTUlzUlhQdjJ0S01SS09C?=
 =?utf-8?B?SkRGVlZyOW4yU2NUTUdBeTdLYStUVk42L1VIOGpONU5JVExyM2tqejcrdUYy?=
 =?utf-8?B?bHBudVRLVkFqQ3dhU1hlZi8wQmtBKzdJVzJpQXM0bXg5bUc1VHQyUFRHVVZn?=
 =?utf-8?B?b1AvNDJEbWFIbGtoMWpMQnlpNzZ4MHBMcWwxTUJJRy9USm1EWXhscmZxbDFk?=
 =?utf-8?B?V2tDNDUwR0prUGxIY3NTRXV4citlVmdRZmJ5V2J4ak81MG4relEwRDZvRHo2?=
 =?utf-8?B?OGtwcld4UGZpdGpZTFNMMHlVS0NhbGJsUVhER2RRTmZ6cFNqWHBnSVRhSW1v?=
 =?utf-8?B?YytFMmZZbGwxOWRNZHN0ajk0Tk9kK1FPV29CQVZ1RG5TK2FhQmFMN1YwdTFm?=
 =?utf-8?B?UXl6STcyd292aE16N0IxZFppTndwT2J6YVNNOWZlclJDZzNlMGJBaWl2WEs1?=
 =?utf-8?B?YXJNRGo4Zy9UMlBMUFRJb1NZTjFIOWNrWEhxeTQybEFLUThTUFNrNy9oVFdC?=
 =?utf-8?B?MjFRd3duOTduNEFOZmpPb2daYW8rTitlNXBJZTUxZVMvbnkvYnFPUXZsamFi?=
 =?utf-8?B?cTZHSmk2NFVwQldvdkZwYjhFNGZBbmhLeTduemRRTFlvS3kwd1BOK2hJYmox?=
 =?utf-8?B?SmJQZjFDTk45Q0ZYK1puVWp4Q3h1T216aTBvK1R3b1FubGhScEhHSklDZXht?=
 =?utf-8?B?Um0rUVJLVlJsa2x5SWpUODAxUHNZaitOeG1TalRjS1ZHTmNMYUZoUzRkYloy?=
 =?utf-8?B?T2xOQXluYXBPY3B1Yy84aFRIaWZLK3ZYN2hCbmpkN3lBdEgwK05XSmFRQU1C?=
 =?utf-8?B?MlFiLzJ2Sm1IUSt6ZHA0RnppeHc4MTYrdGkvaGVKSmlQbWVIWi9xNHRzZWo5?=
 =?utf-8?B?UDhkdlhtNzR3T3h4T3lNb1dDRVFtNndSRzdKNWpwZFFGaGorWVdiaGJncFY0?=
 =?utf-8?B?bGxSbUpVTVZlb09UelEzSGhzbDJ2WU8yTkxzYmo0YjNleDhuSnFUOHZpTnZl?=
 =?utf-8?B?cjZyRWdmSCtKUEVha1RjeGN6U1lxdFJEam9IR05GVmhoSGpXUmtLODQrTEM4?=
 =?utf-8?B?RkdpMitsZ01pT09odnpyYW0wSERZTjBJZFJLQWw1MHF3NDdPMnhFSEprUFNN?=
 =?utf-8?B?a3ZYQVVEN25WQWtQTmRRVHpVb1VmZGUzVkJTTGNHc0F2VStqeWhYV25VRERG?=
 =?utf-8?B?RWRhSVl6cEVPS0ZoM3pBaVhENURmVmlYUEpaNGFWK2EraTZzZjNCTFR3SEJD?=
 =?utf-8?B?d1dIb3JSY2dsbk9kbEwxYnlkWkxLWGN2WGYxd3c0d1pTeVNPUHdrbFkvREhI?=
 =?utf-8?B?T09Wc3pmWWxsa1BZczNTWjg5RmticGNxenpER3oyeEk5YlVhOFBrMVloVXlr?=
 =?utf-8?B?bWdtS1R0bWQyY01YRmVtSXNtaExnNUtjeHdGQjd3VkcvQ0dIaFk3OXc0a1Ny?=
 =?utf-8?B?TnBzWDY2UEVubHFpdVFLZ3ZlLytjaGxYemt3SjhKR0lJZXMwanZNcnltNSsv?=
 =?utf-8?B?bUZ2NlFqZFluT0loY1dzeUxUL3JNNGx1ZmdKSnBaTUFxZ3RVNWFodjhWVWFy?=
 =?utf-8?Q?Azr6RWOx4n13Keh1StKU6A0K+qnotH7X/Rm3+CE?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5594
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	858aa970-7178-467a-a6cb-08d936e5a71d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JlF8LnNgAzTIc8oMuDGds+NTh9WE6D06CJLF/LGjfo3OeKqD4qPhOrnoQKWNAcSlEAJsSLrrZ06+wVUVP7+BNUZa8ABIc6gfaOCp2iKCfLaY1ye8K4eySx2EzO+J7kEnpPTaoIpbwppA/2LL4+i7YHIB7071ZbWBPDSj852RiBafndpN5RbV+TjZEYRxXpAUOe4LaUAFUvVVsqR2ZXq7xF1NEgK/W8jskVb2hyVz441GpQPyEGQStCZLu0+8dgZKnGCNxUHNnZTFVF8sfGDUGsT/gQpwB61iP1lLXybj9yyKAceVWq1WgtczWkWNBK5d7OBTMPy6+XYebuom0+RlMKIp7eD39H6BCI960nqL7yycThIUIegEiZFbjk072ibJ05YHdNEvnWoeg/aigOcIAd14+gJ96t/nJU9gxdepPxs+K3eANyiLPLCkiH29lFiIxesVEAXGS0GbzbMcXtHEzMdWzfCP8qgpsU4Qe8zyJqYQn4AEauaYyFIrYqByCzXlmelUNTP0mTd1RrmxSQcFhgZ/p7GB03dqBexTfAbP5EA0dX5ZLe1cbpaLDXL+DajUISriuDIFTfVL4RWXzjGJOyJsOJPGAyjPTmkCgalx9RB1jINtgS1eEyzcoH9QGk6Vvf0Wwist1s55Bf1jkGkMmH9sM+ISD4ZlLg8+yPWvU8NVKYVvcdzD01I2KZU02XtrqrV3arVNEIqCnN0/Loezcw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39840400004)(346002)(36840700001)(46966006)(956004)(26005)(4326008)(2616005)(53546011)(6862004)(44832011)(70586007)(8676002)(81166007)(316002)(82310400003)(356005)(36756003)(6506007)(83380400001)(33656002)(478600001)(5660300002)(2906002)(8936002)(36860700001)(186003)(6486002)(70206006)(6666004)(16526019)(6512007)(336012)(86362001)(54906003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 07:57:12.3244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 329d9350-f969-4317-73f0-08d936e5acd1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6121



> On 24 Jun 2021, at 08:34, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 24.06.21 09:32, Juergen Gross wrote:
>> On 16.06.21 16:43, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>=20
>>> call_delayed() is currently assuming that conn->in is NULL when
>>> handling delayed request. However, the connection is not paused.
>>> Therefore new request can be processed and conn->in may be non-NULL
>>> if we have only received a partial request.
>>>=20
>>> Furthermore, as we overwrite conn->in, the current partial request
>>> will not be transferred. This will result to corrupt the connection.
>>>=20
>>> Rather than updating conn->in, stash the LU request in lu_status and
>>> let each callback for delayed request to update conn->in when
>>> necessary.
>>>=20
>>> To keep a sane interface, the code to write the "OK" response the
>>> LU request is moved in xenstored_core.c.
>>>=20
>>> Fixes: c5ca1404b4 ("tools/xenstore: add support for delaying execution=
=20
>=20
>>> of a xenstore request")
>>> Fixes: ed6eebf17d ("tools/xenstore: dump the xenstore state for live up=
date")
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> With dropping the conn parameter from call_delayed as already
>> mentioned by Luca you can add my:
>=20
> Oh, please drop my request to delete the conn parameter, as it is being
> used in patch 4 again.
>=20
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>=20
> This stands, of course.

Hi Juergen,

I=E2=80=99m sorry but I don=E2=80=99t see when the parameter is used, in pa=
tch 4 we have this call:

line 2344:
        if (delayed_requests) {
            list_for_each_entry(conn, &connections, list) {
                struct delayed_request *req, *tmp;

                list_for_each_entry_safe(req, tmp,
                             &conn->delayed, list)
                    call_delayed(conn, req);
            }
        }

But call_delayed is still this one:

Line 273:
static void call_delayed(struct connection *conn, struct delayed_request *r=
eq)
{
    if (req->func(req)) {
        undelay_request(req);
        talloc_set_destructor(req, NULL);
    }
}

Am I missing something?

Cheers,
Luca

>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


