Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7623513052
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 11:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316370.535276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0nJ-0006FD-9p; Thu, 28 Apr 2022 09:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316370.535276; Thu, 28 Apr 2022 09:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0nJ-0006CD-61; Thu, 28 Apr 2022 09:50:41 +0000
Received: by outflank-mailman (input) for mailman id 316370;
 Thu, 28 Apr 2022 09:50:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/gZ=VG=citrix.com=prvs=110729f0c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nk0nH-0006Bx-8l
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 09:50:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7000ea6-c6d8-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 11:50:37 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 05:50:35 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CY4PR03MB3237.namprd03.prod.outlook.com (2603:10b6:910:51::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Thu, 28 Apr
 2022 09:50:32 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 09:50:32 +0000
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
X-Inumbo-ID: a7000ea6-c6d8-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651139437;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5/JpxTgAEBJ9WeMLX3ZAVqGbSe68YWk4jEPGTb3d/WU=;
  b=duQf3+vv3tCIdD2sA5fn9w/kyb5JgDuu2PAeFzA4vvXZnst0bmPReIQP
   ZMZbM5rdshaMa8IS3/89mK/aegR0mcECwOjLTm5FnSmvtwaYCn9L3C9Qg
   W4QJPO2MndqGRicYaSolVyXQpMBEbXUcQ07s5CZuIhCQhntRJUHY7lWDJ
   Q=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 70003683
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5wuUv68UC7o91MQid0a8DrUDnH+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WcbWTiEafqOa2GgctF1bt+2/UwCv8KEmNYwGQM5qC88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YLpW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnd/qZV4Xb73QovkEVkZ+NCJsY4586rCSdBBTseTLp6HHW13F5qw2SWQJZ8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHviMvIcDtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGUA8AnL9fFfD2774TxB6//GKoLvZfuhZNpZhwWDh
 mDcxjGsav0dHJnFodafyVq3nfPGly7/XIMUFZW7++RsjVnVwXYcYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHyOswMYWtFQO/Yn8wzLwa3Riy6bG2wFQzhpeNEg8sgsSlQCy
 Vuhj97vQzt1v9WopWm1876VqXa3JnITJGpbPSscF1JduJ/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BApJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:m+1QV6N3WmAx3cBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.90,295,1643691600"; 
   d="scan'208";a="70003683"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwfgRYPVhOrw1MAtv+neq1HFn5XoTpNU4P3fyVEqF72EITPTYGMj5AWKGpgUATXfRGM/3oGq0w4peg95HzkueNZKxE6DuokegVXAolG6yk8mTVZKMdNXySs/4+28OAI+eyFhqY+ygEsK9Q46xk72M8u1seLHOufqsE5AdmWQqoDOCv8eXCMyKuLJ3loIMxo9YpO8+thIoRJhjRDJ53dNG8ZdUiz5T5ntiWV74WFPrnt6svCjtLDi5GQ5UWoiIrOnRtJ7BZiU3YhqcTewXD393xzGWwRwH/gQOMX+kb+pLOKVYEp9Wzd8KvW7fB66pPOhl8Dz/jMkrC3Xbvpk3+XBig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tO1K1VH1jw+T0uiIAYVm1ppzO04oJCeN4ux2jaLTqA=;
 b=MgZkKdcEqLy93tJctXxZopbp62B0/jToD+eZKOJkJNH6pZXIWAHdw8utQiUZBv2xOVCYag3/Ory8TWFQP7yvzTFnvIj9NIFIDx67GUePD1sCjKeky0XHjLq/VRl6/dBVMeAzjDVez/yn4rTkEuwuJemnXklK5CL0A8stvbfGU98OPBfQzbkfTFQ6F7nIV+F7KC3Q/Zq/lKceMA79hvHrY0n6cuw+6DhVLJnlKMZeb2U8qvE3CO6BCHpqr0OpDIV8pZlyXlWLcZIY9BQmNDtpPvXrSL1ksSK3lL56y7SQqUyc3HgxAHIAj/T3ISfHnJiLnXEPUwXoTb0Taj6XbFmgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tO1K1VH1jw+T0uiIAYVm1ppzO04oJCeN4ux2jaLTqA=;
 b=QdumKUU4I/43YBimj5pA83MEzvL2M1j1xQK8udZHoVfTv7NJraOZq43ls2zm9mqveAo4WUUswNu+CnX0bVC+z8jtzkwjtq3jWPIlLWNDqf2fi2JA9Xk3FilG53z29FaA3X/c0J48mvlu6saIgyJZu2IRZFRZoILLEeSvC3MVTq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Apr 2022 11:50:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] cirrus-ci: add FreeBSD 14 task
Message-ID: <YmpjZE1usk7feAzE@Air-de-Roger>
References: <20220427155023.84403-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2204271512360.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2204271512360.915916@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: MR1P264CA0044.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67be2238-9522-40b6-c1a8-08da28fc8934
X-MS-TrafficTypeDiagnostic: CY4PR03MB3237:EE_
X-Microsoft-Antispam-PRVS:
	<CY4PR03MB3237B7D4429D99445140E2DF8FFD9@CY4PR03MB3237.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ewbDvjxnxmcc/+Sr+pYoYZRo+wYx8rwiroTWYODR5fOo9WKjJ5WQBjsSmuHCQkGntuqoWPthFYBfrs0T29CYITc73/VG2cmYmXus2fFhLuke35ZknqHjtWxHp+S75gtAb2CBRBfplg7rfEzUnoS9a9oMMZcqtA9YbJXyuOioGoSnGwv8y0FUiVWdMoAYVkIcnQPdWYsLN+SEOK7mZ5hgWTb9VKFfYQRU81FNQsS7TKLeoVSic7rbRWfxSqbiXnSj64gcesglXedgEmt5MBAOqQcVotNZXmy2YrHo71cZK1y93wl2CnFVvRf8ZErGkbDcGdBCYickLiwMVZiG6fL1ZHadvdQy84k9+CNFGmZuwB3UkNK9AF8zmkV/p3qAo4aFcyy8af+KFnhgTor6cWjh5KAk7S0yq/IvG8mNWiVRhhFSqlz6hIqQPHTSJYuj1H7/b0UQ6dMUB7qpYma2TIWO1ybUygFZP2fDAeY+8xDdnjuf4QxBSxoWINuRpnF/1d9rtcOk1xQ+JoUmPeFP43TDMkioGMxNkAZadJuiqGvJcSnOcPamdP9sL7QIJDdrTX6mLAHa2NbYyvMVeV/Lq9q7m1RZcRgIWAeedGa3I6ii6a7RbO45mAaTqskB3KMfx0QOQE9TNbWnj9ioQTlPnUn4IQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6486002)(86362001)(54906003)(508600001)(8936002)(4744005)(2906002)(33716001)(82960400001)(4326008)(66946007)(8676002)(186003)(66476007)(66556008)(26005)(6506007)(6666004)(6512007)(6916009)(85182001)(9686003)(316002)(38100700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czZoZ3ZpNFMxOGtnZ3dkMTdVQjRWTUxWVnEwMXV5TkJ3RUVxckF6YzJDZC9r?=
 =?utf-8?B?VVlyMEVvMkNmYUtPbHpZT240ZlFzK1VTb1B4N3JLTjVxa0Z2S2Y2VkUvUXh4?=
 =?utf-8?B?NkhaY0s0SXd2bFpjSi9PUDlKcThXcERWdDNNbmZ3OUpmYmdlQ1hsaUVlb3Fk?=
 =?utf-8?B?emtzeFRCekQrZHdyNWdrN0JFVUZHaVJ4bzlFR1hRV0lycDBEeVU3aForTjJj?=
 =?utf-8?B?NSszTDNGL1VsNWdlUXRzVERFVjgxbUxELzdQQ29NVUN0WWI0ZFhIMXBpKy9v?=
 =?utf-8?B?L2k0bjNiWWNtYWxRY29ZMitRWEhmNmNXeG13eGFWRFZ6V1UzdFBqcGxVM0RL?=
 =?utf-8?B?ZlIraHZSS3hGeFRKNWM0T21OQjY2T3lYWGxLLzVRTFBJUFgzZGpKK3JaVTBs?=
 =?utf-8?B?M2RGbExxam5BQ0pySWF4NHQzUlYxeWQzWHI0emFwblZIMDVYbmhZNTVxOW9m?=
 =?utf-8?B?dldYTkZSTjlOQVE1S0hQT3hNeks5RFdHY3NMMUVYR0Q3cEd4ZEMwWmZha3li?=
 =?utf-8?B?NjhKUkdxKzFhWXhBS0VJSlpGbk9NNTZXZTRDWmNDczV2K242MGVVQXUvc1VU?=
 =?utf-8?B?SWxucjd2K0hQTTE3YzJBaFVKYnFBR01YRGtLQ1ZJL0tkWVlqUW9VQWlHM01T?=
 =?utf-8?B?dGhMTWZFMmsxYUIrdW1TajZ1U1lLcVIyUHQ4NzRKWXBvdGg2TmtFUUlORDBG?=
 =?utf-8?B?dzJDWDlkeVdOTlhPbTRzODF4b0Jzak1WWnM4WXhhanUvbm5QNFphSHBVVEhH?=
 =?utf-8?B?aE1OTlBiYXRjMWdwdDNQSHgxZkRQT3NJa3B5dGk2Q2IxWEdpcDFycjV4RVE2?=
 =?utf-8?B?U3RZMW9mMkU2bWx4UEVXd2oxT1hSQ01nazc3N3BNdlR3SS9PUFlIUHR2WGlo?=
 =?utf-8?B?bXlIYmpxVnJrNUtYYUVXcUxxQ2VJRmxLZGVtdE40VEE3K2k1Wi9MNHBudjc1?=
 =?utf-8?B?Z0wvTDhDZ0tzc0Z6RnhKRkVWVzg5UzdRSFcyTUlIQTl5cG4rZXN6anJyNmgx?=
 =?utf-8?B?bWhpQWQ3K2h6NkRGN05KckZwUGh2RGl1RWhncXRiS2w3RlFxNTJ2bWd0U1pO?=
 =?utf-8?B?M1RGRFE5OUtuMGtDUTY2amdIdGgrT04xdUNreGNZWUZhZHBaL1lSS2FIZEIy?=
 =?utf-8?B?UHRMWU03eWw2Z3BDbjJ2SEpCbzFzZkttbThaZlVtTXRFeVk5RFlvRFd5ODN2?=
 =?utf-8?B?dkVjNDkzVXdWRDhmR1czVHlOdWxZczEyWVRIOWRqYjlNT2lXK2J0dGlid1R3?=
 =?utf-8?B?YVpaS2k3WGx0Q1VMNXVSWURncmJpZU8xTXFPL2NNUHh0Z2RjRVBDejJyV2xV?=
 =?utf-8?B?RFVuMlI5am04cVVrU3hxNkl0ZUJ6YVNOUmVSM0NQK3FHM3RMS2lCMHpXVGs2?=
 =?utf-8?B?ckR2YnMrb2pGeVZDUGlVNGdBcDNhWDQrSlZUZy9yMGRFMmpWL0pkRHJlTzNh?=
 =?utf-8?B?UnlGNkxnVEh1aURHKzVCSG1KTjlBcVRtaEp5NW1DQTZwNVQ3aEllRnhpbm4w?=
 =?utf-8?B?bTZaZE0rNFd0Sk5vZU04NVdHaEdQdGh2cW9OTnZKNlpNZ3VHZThFeSs2YkJp?=
 =?utf-8?B?aW0zdGQrVVNrcTB1RTdtZFNKVjFITndQaFF1OVZlTk41UjEvQ0RUTGNUaXZa?=
 =?utf-8?B?ZjhzTU9UN3o4L2ZTcE1Lc2h3bnhHcXplbk8wdVl0R0pTRlZ5dkpzRGRZdHgx?=
 =?utf-8?B?b1N6MVNhc2JYWGF2MkhnbmJWaWoxZ0VXUVI2b01PQnlYc1dVOWZGUU9xM1h1?=
 =?utf-8?B?d1c1QTdaalVSQnhPWU12VXJjUE1tN2Q3cW9ORFZ4d2JtN0kyM2hsOTJIcmsv?=
 =?utf-8?B?S1VQT0JaNXljOStDckNCN2JoYUQ3UE5iWHduWW9MOWdib3BIS3BNaTZKcEhr?=
 =?utf-8?B?ZFM2RU5vbC96OHM5MG9ycEhEaEdCbFgvTlhWeklSWnF5YUVrQjM1U3owMm5D?=
 =?utf-8?B?MjdQVFVnQjFnQzNzRURQTDkrS2d4dkpmYXJ1VW5OWTZ4NkVHbDJXNGxWU25u?=
 =?utf-8?B?R0lIU3VwM2RlZU1QTjlxR3ZsS0Z0cjNTcm5zUVRCWFBNVWVUbEg0cFVtR0JT?=
 =?utf-8?B?akFQYTdNcUdpVUtHUzc2QXROK29aTnRDSGwzOEhsZVNSMFpORmFEWHh5L0FX?=
 =?utf-8?B?cUJpUUM4Z1Bta0JOVzU2eVpWVDF5SExTS2RlVytVNHBiQTJycVhYM1R0TktF?=
 =?utf-8?B?L2E1ZXNodnZsdjNzUzN1QlVvSDEvTFl5K0YyVlRleSsrZVhlb21SdUEyc3NL?=
 =?utf-8?B?YnU5UE11RkZyYzdEcnVpQ2hpKzJjbXZvc3dGTDIwdHpObXh6SXRvTEtzSkNG?=
 =?utf-8?B?alp1R01UejVyNFoxUjhvV1pBK0VSOXB6K0JRZGpLU2VDcGpXQVUxY3RDODhw?=
 =?utf-8?Q?lOlFLBOiffsUaSis=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67be2238-9522-40b6-c1a8-08da28fc8934
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 09:50:32.7025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcAqYY9ZjoH255crdw2ZCPg9hF0LDLJp+dgDwReWhroTR6jx5Zg2GKvYMAecW+uBVDOMye4fkXAWQzKsKHKlOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3237

On Wed, Apr 27, 2022 at 03:13:13PM -0700, Stefano Stabellini wrote:
> On Wed, 27 Apr 2022, Roger Pau Monne wrote:
> > Introduce a task that uses a FreeBSD 14 (HEAD) snapshot.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
> Roger, should you add an entry to MAINTAINERS to set yourself as
> maintainer of .cirrus.yml ?

It would seem a natural fit to place it in the "Continuous Integration
(CI)" section, but then it being FreeBSD only (at least ATM) I assume
current maintainers won't feel comfortable having it there.

Thanks, Roger.

