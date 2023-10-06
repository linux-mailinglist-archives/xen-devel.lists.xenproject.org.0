Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193CD7BB414
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 11:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613400.953862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogwt-0005Fv-Qb; Fri, 06 Oct 2023 09:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613400.953862; Fri, 06 Oct 2023 09:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogwt-0005Do-NH; Fri, 06 Oct 2023 09:16:43 +0000
Received: by outflank-mailman (input) for mailman id 613400;
 Fri, 06 Oct 2023 09:16:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qogwt-0005Di-0G
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 09:16:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e518f79-6429-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 11:16:41 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 05:16:37 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5623.namprd03.prod.outlook.com (2603:10b6:5:2cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 09:16:34 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 09:16:34 +0000
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
X-Inumbo-ID: 0e518f79-6429-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696583800;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Et7BOHUy+QREW0KH4uqAWkggxoDc3tDR2KpSZSXtJ2A=;
  b=FMiIMYTGshhoC2lx14hcP4DNukZxQemDIkbHhrPNMBZBiHQu8gjLBhg+
   QEbjt4lUvlk9bJwQJPQg2628owGvaLNfJQBYeOkD0yzckR9jxhukpQTKH
   kIj0eKERNKba2MLuHm7Sm5VIsUCIfb8alx7s3i86ym/Msi7V079zJsqlt
   c=;
X-CSE-ConnectionGUID: +7raVm5ETX2ErmTPaDy5lA==
X-CSE-MsgGUID: 8CAP/ygDRkCrf1Z8/Y0dVg==
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 124813159
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Haywf6vOtG5TXWQVDETflE/VJOfnVNJfMUV32f8akzHdYApBsoF/q
 tZmKWjSb6mNazChetB+bIm2/UlSusLQydRlSVc6+SwzFy8b+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeGyiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwa28XZy6G2s+K8OiWUOxQvs0PPZTvFdZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60b4C9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAt5CTebhq68CbFu7lkc6MFoHWneBotKjhBeMC5Vuc
 0Aq9X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO87QyY7k
 GCAmdzBDCZq9raSTBq19L2ZsDezMig9NnIZaGkPSg5ty9v+pIA+iDrfQ9AlF7S65vXuAi35y
 T2OqCk4hp0QgNQN2qH9+krI6xqzorDZQwhz4R/YNkqu6QZ8eYike53u7FHd5PlNNq6JQ1+Zp
 n8GlsOCqucUAvmweDelRewMGPSl4qiDOTiF21p3RcB+rXKq5mKpep1W7HdmPkB1P80YeDjvJ
 kjOpQdW45wVN3yvBUNqX7+M5w0R5fCIPbzYujr8N7KivrAZmNe7wRxT
IronPort-HdrOrdr: A9a23:/zb5nq2CfzZsqb5VyFy7RAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: =?us-ascii?q?9a23=3AiGNW2GpfvV2MuBqVfub/AlbmUYN6aHTjySr9H3/?=
 =?us-ascii?q?iJHxsdIWcZU7N/Ioxxg=3D=3D?=
X-Talos-MUID: 9a23:1s0VDAqRWogyaxNYpAkez2FJHf8v8quCMkMmi5tfiZnDBHR8BTjI2Q==
X-IronPort-AV: E=Sophos;i="6.03,203,1694750400"; 
   d="scan'208";a="124813159"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gy2lXnc3ZvnxhRS+LBPKy1kDS3j6HuNo8hcZD5+kR0I0fWhK55d4MBdvQKkUSrceqVexUGnDVMBImIffa2gKiQaVlcclzw8v8wVyZ7f+IsuKkRXvjb0r+KYkup0VHQC2ruvxZ6ADvi2SgTarQx5cd1F5yfvQapZwKEel9Y7y876MbamA9b8JbCocQnCyhjToEUZa1ox8kmMxJGiG9bZ1ByQuNivNiTzg8nqVX6hMtGWu5Rr5FhX164bLG3JmsWWCMSCy3lhS2K/w0yLiO4+y4YVuXVgVwFAmyZlnZuwfaavGI+J0wUU1MI8j5lHyXvFQ4bnSdQRyOE3l7xxPTVXI5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAVXvAo7fDkdf4/CZHkgpfol7lp8AktHHDo1XNweRtA=;
 b=dQtYhPtMt+3Um6TvxepL5V/99nUrPIehbO+7wr5Ua1WQPhIxBCMG6miLkJn7q1dXgtSHdaHVDTVXA5CggPzrrxpVADIGqIT9mdX87STxFcAepUWWGWf5P4++0BuhZYYhD0zZFk9xU98KwbulMKyxO6PhqN+8mHeQRZ5DpbYc0KbLpvkAm3GvB/ImnHhAfgFezRZR0F24vSm+T8YwSif50mKOrDLIlKnCOzRQI1GiWezPFmKnZfRLILK9cj/3rCVFXkoOQC/FS0rcA+zy07nJcfX3krk4OkxJWxjEQM41ip1aW7qsZzp2hECsW5i/x4ZXbWHnwLV8a76BLR8lroQdOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAVXvAo7fDkdf4/CZHkgpfol7lp8AktHHDo1XNweRtA=;
 b=R+HgV0BUG+KMc2gvJI9xd6LLZDF1TZwt0coD38PQ6GnakAPwbfnfVWXCsc8J/PCVrpvaXWlf8zlb6fAJ0sQUd2LyR4Qv1YYGIo15AySzZxUqL88i514hVVFQJC2fz+LgmSWQD2KivRlJb7XCgKcs73/iyPkuI2fOFx2r2Kyn0R4=
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
	Wei Liu <wl@xen.org>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH 0/2] domain: followup for phys address mapping series
Date: Fri,  6 Oct 2023 11:13:51 +0200
Message-ID: <20231006091353.96367-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0188.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: ad55fadb-5dba-4003-1381-08dbc64cef6a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rs2GaaRlaMRhI42bhKPjJBdb7Z9lqrfs87rZBPd4MzWFbwTynBcmUVHs84uX56GexHAT4OZoMwRYm87tP/6jVWq7Lc4PNhHipsS6yM8MO2y6mBk1kWbjVugpqTyDCIP9AWVlJkTyZMMvpdSJMaOWXp+SqvGeYhJGrzyqvdo4URHYvM+5i84B4Hy18J3c7hI6Adk/hBd3vidbUmZ243iclwSdbSnrqTbAGWAAgrelUPzsYGiSJNMMOSrSDROzj9gbptzQhUH8fRRA7tfIA+B+G/K5WEfzxyKd21GYVkwezYXRfJ5msOwJ5tXUdBjGjLtdI7+Zdywzxul9lUsmcQBzf+LKBXk4iDB9rdVRZJA/zkVWJn/n3VvEulF4UBpLfcN6C1vs9swozQOZ4/kfuNkka6Mo/Q//u0EDG6P8CcI4x4IXPkMuFRNfIO6gCeW+pq51MtTMgA6Fm8NBW/U6T9z+s9j8B5JwMFL9LEw2IrZ9qADGfEXu8IQF7TY+my+cRZbJqZvH0WSCxQLVnL3sqdwH89dTHPB3ntu2iu7EN9dLiu4EaFSyjrZs9XGEBRNE5QCo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(366004)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(478600001)(6512007)(6506007)(6666004)(6486002)(26005)(1076003)(2616005)(83380400001)(2906002)(6916009)(5660300002)(4326008)(8676002)(7416002)(41300700001)(8936002)(66476007)(316002)(66556008)(66946007)(36756003)(54906003)(38100700002)(86362001)(4744005)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjFuaFZybWZjaStFd2kxbmZRRzV0WmZ6QiswZ0svVkMwKys4MDNDWTNwMldD?=
 =?utf-8?B?ZFlGTVdZMksvRGlhK0R2M2hvVjRsWjFmM01mNXB1OVZxNGFFT2FMNnl4Mkwr?=
 =?utf-8?B?bDk3L09DazdxcHl6K2lVOGVqdFJYaWU0UjZMZjRxWHRxRHB4b2loc2hNWmps?=
 =?utf-8?B?QzhKRysrNndiUlVvUlJlenAzeDlZNG1JN09WOSs3TkRCcTZya2pscW8wYm5O?=
 =?utf-8?B?NVh5ZG5YTDVPYXFzOVFWeHB0aXg4WGx4d0dZZEJoMDgyVWpWSDJib3NBMW9Q?=
 =?utf-8?B?OTJzVDBKODVlanNndlRtaEszdW9PNWJWTHB1OEFSQjBZOG9MR2l3dHhhTCts?=
 =?utf-8?B?RzlURWtOMk1hUzlzVURNYXh1c0xpN1NZYUIyZTdjazkzSWp6eTIrL2kwWWFT?=
 =?utf-8?B?aUhzS1l0SithT0dMUm5aYzNtUHBNak1CMWlKRjZ6ZWh0UlhMMitRVCt1UFBE?=
 =?utf-8?B?K21RMHkzNnY5VXlMK3NjMTJBdEtZM0ErQy9uNCtkNUtJcmxGaWk1OGVBMnZx?=
 =?utf-8?B?cGt5MmY2cWkvTjdMSUJ0UHRhK1h3R3oxb2NZaG95Uk5ZUjBQRzA1Y1ZBTnR4?=
 =?utf-8?B?N1NVT3puc3RPMm9UMldYSWRERmw4UTRxcHVuSnZkb2NUTU1EMTR5UlpPVXpT?=
 =?utf-8?B?WGEyNmZwK2YxbEhRZmZkeHNTYkl6MFF4OUErekFGZTZHVnFleTJKSnk5TENm?=
 =?utf-8?B?cFd5QWVuVzVNcjZqdUZST1FFYlkyMHp0Zlc2aDQyTGtMMEhka1hpc0IxMmow?=
 =?utf-8?B?YTNXcDkyWGt4NndrTFZ6dnQ3QTdZVmxmN2dkemhpWTdLWEZOMU45T2J1Uk44?=
 =?utf-8?B?UExQMHJ1clduNTN0eE1rS1F1OFZUSTI1clU3Smd6YkIvbHhjUldXODU3eDdx?=
 =?utf-8?B?UGFFRThBOE5hNFhVV1FmY28xVkdZTUpwSElCT2krQU51aVlaeXhLbWxWcThL?=
 =?utf-8?B?Q0xwUWxSZkJURnJ6Ylg2Tkc5ZjJtNXFBdUlQbVdFL2hiS0pJQWd1Q0c3YTU4?=
 =?utf-8?B?TXluZ0tjcVlHUHd0a2ZqY05jazFXMDBGMVFPZWFiUW9WbzFTeEEwVzNxYnpO?=
 =?utf-8?B?QkQ3SDVDeE9RZVpENThWek5QWHRqUGdMaWlMYUlxTEhzMHdLVk9QZWJ6UWQr?=
 =?utf-8?B?TU9weUZBcDFjYTRzR0dYU3djZFZxS2tFVi9CVHZFcXBSaWlKR2NGa0lIYVdw?=
 =?utf-8?B?QTlVK1c0RndWaXIvbU1sZXVpdGFDMzNFaUM5M3lBbEZNUmRtcHlMZ1NKRzI0?=
 =?utf-8?B?Rm9IMWZJU0tWUTJIbkxmVitaUytDTUs4NGwzWHl2VFlpYVUybC80YVJIb2Nk?=
 =?utf-8?B?S1o5ZTFQQk9EQVU5bHVZcTh4SDNWODJibk15YlovdnNWYy9iTkVLWGh3aWtN?=
 =?utf-8?B?WTlia3JzUXJuNmNaUUZNQW5ZSGpIaVMrOFZSdjRQQmhtVmswbERDdnJ1TGRJ?=
 =?utf-8?B?a1BoWjMrYVN6eEJiaFVZenJUNUxQNzlIWnQrOTFMRnc4NTVhSy9HRFZCcTRw?=
 =?utf-8?B?WDNyNlVQL29EMWtFejlDWkVrZmVIMkY1V0FqRHhaeXFmU3VHV0RYZ1BzVHhs?=
 =?utf-8?B?dlFSRHhhaFByZGJqYWxyZlA4cFhlNXExbW1YOTAyZGh3cFFpZGF2bDhTTjBM?=
 =?utf-8?B?cVp6VWpXYVVMZThnYkdQL0JPMnMwbnVwVWdKSFhhWU84aGJVK3NWZ0drSmF5?=
 =?utf-8?B?TUlFMElpRkRGOVkvZWo5eU82K3ZVRGxYY2ErbExXTEtXUm9udjlOWjU5SU4v?=
 =?utf-8?B?czNzbFJaRko0YUxXTU5ENW5pdEtJZTNqcERMb2tLdVo4b3JIa1FJcEtNbmRt?=
 =?utf-8?B?OUIrTktCSkFzOEM3UEx0ajZHb2NLc2lFOGFpU0lUOFdEZUd3NVNtL0NFdXlD?=
 =?utf-8?B?QVQrV0dTMTk1d0o5Q01NTEJhVFc5RmdOV3Q4YlN5M29Ycm01aFJRaFVMQk5Z?=
 =?utf-8?B?NTB5YnlVNUQ4T1YvK2RNUURWWEJ4MmgxcWM4THBkOTZMeE43RUpLOGNCMTd3?=
 =?utf-8?B?THVxd1dRQzF5M282N3RITU5QZVRUL2lMTllSaWEyeXJMVDZLYloxS2lYR0Jy?=
 =?utf-8?B?aFBvRWlpOVB2LzlFYlUyeFZyYURLS0hTbDQvaDRtT0hpUVY0emVRanZ0YzNo?=
 =?utf-8?Q?6Nme1dAQtzK8rCsuTnvwZSkH3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j0pHnb7PZrKGMzGJMAYjDHE+HXD7EAij+7q/Xg5uJ6gRNqpQ9ySm+NFe9RFAUR/j9N0zO+lbI9N/8lcz3z9+wY8TFTFecl2z/jUT0mPGUN/eYtPgM7ex35ZM1CtcwM5ApUNnhwKqv+OsiI+wnmgKf1baOdji/7DwcVJ1q0386XZi+4mpL+lx5PmUP2UF08wqyQToZ9+a42L9LK6i3vJkfhVf1KiHBWGcPH9MKdwRT+6u5YwZNcDz6cQ+PMFrAzHvRa7XG2M/0qXKV24EKej4WFL8kL4qFj9xl/FCdPQWuOp4lELuROFd0gJETISgzZ0Kba2bCQu+dTz+d1ItNQrVrgtwI12CG50CWVUuj4mYPOetPpl3SY4KKJAHEL0XKFVCTcRFLaD8m9nH2Xy1G3avLg2UfqEWygJPR0tvts/8hspiwoFbB3Aigv4RU6RxwuDHQZrt097mhWqVyqexNdpxTp9kt2dwOE9yR2Hs4/lOrEiyyavnOruuqW6XbCjLC/Dh2eYTP/ToOyN4WSyKvOhBNZRseoZDLGES8XHcVoAjsrmsNI/J/7WnR+Ny8ct5wM9PRAEUb3Q0oauZ9GrCZWHeCMiHwvnO40DOcyos8aKHI+XO5Lpexi7OTclArBCYgUWOLgwIeadeUGwK+MyVuygwm2V/n46VTesDCnTgCzQBxU8ZS+GJwWuiiZe2MlybV29w37wFrrj06AqPK/2720j6TxjUo9lkVAXLS48A4qoJ4hUwNU9ovmyNcfjDoZAKRRgCuOh3jYP/w7BFEd2QbMOMv0kh3o6NLlU3RYeyToaQu/bB9iP5asbtUoTebiff6UYV4sImc2W97VV+bGoFt2mQFuDT5OASWg3ixMtsXG2+rXMvERwYYhousYMmCGMAU4E9g+fIHu6GzfKnZigUpYUTYlrzWo6AmbKV13l/rvk55rk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad55fadb-5dba-4003-1381-08dbc64cef6a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 09:16:34.0821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sMnWvqJq0tMq9z4ezFGCv/ylLauF7jrhParEyqDTuK4cNsOQwQlnkZRC6BinMtXRM5XRNF5UQEBRsoISp8/XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5623

Hello,

First patch fixes a bug reported by osstest, second patch is an addition
requested by Andrew, I think this should remove the blocker raised
against the series.

Roger Pau Monne (2):
  domain: fix misaligned unmap address in unmap_guest_area()
  domain: expose newly introduced hypercalls as XENFEAT

 CHANGELOG.md                  | 2 ++
 xen/common/domain.c           | 2 +-
 xen/common/kernel.c           | 6 +++++-
 xen/include/public/features.h | 9 +++++++++
 4 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.42.0


