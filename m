Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 455E27B51B0
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 13:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611450.951009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnHOO-0006OT-De; Mon, 02 Oct 2023 11:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611450.951009; Mon, 02 Oct 2023 11:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnHOO-0006MZ-Al; Mon, 02 Oct 2023 11:47:16 +0000
Received: by outflank-mailman (input) for mailman id 611450;
 Mon, 02 Oct 2023 11:47:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbpY=FQ=citrix.com=prvs=63281d1e1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnHON-0006MT-6U
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 11:47:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6aef7cd0-6119-11ee-9b0d-b553b5be7939;
 Mon, 02 Oct 2023 13:47:11 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Oct 2023 07:46:57 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by MW4PR03MB6459.namprd03.prod.outlook.com (2603:10b6:303:122::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Mon, 2 Oct
 2023 11:46:54 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::ddbc:172e:c4a3:ec6f%4]) with mapi id 15.20.6813.035; Mon, 2 Oct 2023
 11:46:54 +0000
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
X-Inumbo-ID: 6aef7cd0-6119-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696247231;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ieuroTw4FFYN+pH0Yq7+Tt8TfdgLmV4LD6YchShgtBc=;
  b=hEx4ZAgszoyj9Auvc725Hd6Q5NwEclnkAsmv/1pcrduwQJACkyCCnSJi
   jf0nLve8Ko9faIepwOlgfM86K7M5Em3/tm9Cap6OqhrFf33z/ZTSdhxLA
   uQYO2rrFlbzXTFkf8wIuY0EF5aHjfIq31Wn1I8yfZ1n2EdwjIhr7o9jZZ
   Q=;
X-CSE-ConnectionGUID: kTuM8rIDSKiYeJneobkJIw==
X-CSE-MsgGUID: QefoW56iRzSdhOBg0QNRGQ==
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 127129894
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:VGYouqyxJt1MafeLK/96t+ezxyrEfRIJ4+MujC+fZmUNrF6WrkUPx
 mBLDG2OaamCZmGgeo8gbY2w9EMF7JfUmtNmTwE6/CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVmPaoT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWJy6
 NlIMhEhVTOCtu+Uxr+8QOpOp9t2eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQvuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WQxHmqCNNOfFG+3sdnjlqsmzISMg8tWVuci/bhs2iEdOsKf
 iT4/QJr98De7neDVcLhVhe1pHqFuB80WNdKFeA+rgaXxcL84QyUG2wFRT5pc8E9uYk9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt4cTnoYw1pgLCSJBkCqHdptf4Ay3qy
 jaG6i03nawOjNUj3r++u1vAhlqEuZzhXgMzoALNUQqN9R90aoejYMqz9VHR4PJELYCYZlCEs
 D4PnM320QwVJZSElSjISuNSGrisvq6BKGeF2QApGIQ9/TOw/XLlZZpX/Dx1OEZuNIADZCPtZ
 0jQ/whW4fe/IUeXUEO+WKrpY+xC8EQqPY2Nuiz8BjaWXqVMSQ==
IronPort-HdrOrdr: A9a23:O0Gcb6upgQjiWtEv/2QW3lJK7skDWdV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoQZPwJE80l6QU3WBhB9aftWDd0QPDQb2KhrGSoAEIdReOjtJ15O
 NNdLV/Fc21LXUSt7eA3OG0eexQp+Vu/MqT9IXjJ30Gd3APV0i41XYeNu9MKDwOeDV7
X-Talos-CUID: 9a23:W1OzE21mENATxGrqvm3WCrxfGfw4Vy3H7VvrAE6JBERvRbqfSn2x5/Yx
X-Talos-MUID: 9a23:hADO0wiLHWIAda7mNjWWzsMpDcpm5JvzVkE3g64Ku+6uOnRJHQ2ytWHi
X-IronPort-AV: E=Sophos;i="6.03,194,1694750400"; 
   d="scan'208";a="127129894"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qyw6z1hWb+I32FbmB6vCLHmvtkryraEgFqirKwe8pMUqNLOlUXxT74mObvbu24fUNqQ6H4PFvapQ9HIwiRuN9h9ZSrovyzH+ci4If9pXlPVd18cF3kdo2lxerQ+lCZDIHYuF8nR4x2M2PmqSWeEFf3zE7njvSfEf5oWPVgLMU5CdELkguHWH/UuYr7ZyRDIA/dMElJvtsA34lQ7/mk3O8H9mvg7e9jA3/Su4fdOcqDtS7w8/zQumPX1mAX9zU8EAN5QvasMZSU5AwLrTvXsr0rNraQiCz/zKEV1TEbo9gU2o2V38CL9pGv0eqlQJc15hRfh2AXWXbxsFcV/W6rLu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6ITXp0TzCTokxYzzck5rBzSqDm/s87w5+WFgz8Ixb4=;
 b=Vb3negxzrV+LT/C7ENMVuS5V+s+3j4zBNxyR7MsSxzDZejz/frNEuxY07C8ug6WsuzONzHRm+ab/1WY9kQLL8cRquRz09t6OFNRrGA3p7ba4ldlfsggH1hXIjmuRv/Dl30aEawny2MD8F2b86UQKxY4aVSHps+Bawh3nTJgCrDMup0uzU2a3DdyjL8hEAJJiG6yCIheBKB2RvFWi6+W8sp+Hhb5e4hOeiFHIJu5bqqLl5+fryMtBZGnIDkDALbmdxRxUIWGzROLCZQeN/4ApSu02gCiH1eaaJ4AwzoFIk+hcX2qaIUzkO6ogJq/GI/72lBzN9WD6kgC94dycfh3ihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6ITXp0TzCTokxYzzck5rBzSqDm/s87w5+WFgz8Ixb4=;
 b=UHFbS5bj43lSCeCQcCGqnEBzB0ipkwFZqD9bpGnLPzIhLfQrirUC2ctGBTHvZ/SP3qkBQkbRSWORLulgIUzDykC1E8U57d5jeo13fl4XBdXgGggQfFtRlYc5Te4razBkSrL3aQxvm+vhvPNwYkTAaXnFS00VcsKL2TzDVxPKD3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Oct 2023 13:46:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
	bertrand.marquis@arm.com, wl@xen.org,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3] SUPPORT: downgrade Physical CPU Hotplug to
 Experimental
Message-ID: <ZRqtp9jxha_p1gQr@MacBookPdeRoger>
References: <20230927232004.1981595-1-sstabellini@kernel.org>
 <ZRU6A2wDSVEEHGbK@MacBookPdeRoger>
 <e1cc81b4-d990-b995-a24a-ba80c1e970ba@suse.com>
 <ZRVMo6Uf7occc0Zs@MacBookPdeRoger>
 <alpine.DEB.2.22.394.2309281346160.1996340@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2309281346160.1996340@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO2P265CA0206.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::26) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|MW4PR03MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: a54ad27b-0060-4da4-a784-08dbc33d4540
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xXDllXF6DMSy/9qni4gZlQeSeSn2NFpsneVK5LvkIkFloIc5m1IC0lznXAzIeAwSQgIsnpU5nJXJM0B3s5at45rAyAIsI1reNhOEchtIPZJgSN2T5IQT+Yr+2Q7NmFE6/jL7Vps4KIkwAlgE0BG4h0LVxmPN4KfxtiE2Lf4rev8IpRpZYiy6o/4ua5wUk06GcX1hweh+GexcCGhx7qGTqDdUUHZJ0GMkETSWJHY+OczAt4onPYe7umh8YT0QZH/uTRLhboWwEFwwOFvMP42S76zUGhf8E6XD6pR4o8E7dLD0rJdQxmQhuc8ehwdnakXCnuCpMVgXb40RfNXZ+iNV0MIGsZPXTORYHQJvahv03ROu3wRzYhEfQV0DJgzhK3osBQwmurVjgsg8q3V67jdPR6WA4O3NR32ip0J8V8/ox9VpMKRNpysDN/1aoMUhE8RbOQ96ao4Kxdt/JgzmHrey4Z42LBb+101SY54AO+q0RyJu46rG0hP1F0Tn04S9hTkdvVJKsYmYQBK7T8TgxMmAMU5OrAhE9/PhoWaIEfxyXOf9celSWg6TmkKJYcFXb76O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(39860400002)(376002)(366004)(396003)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(54906003)(6916009)(316002)(41300700001)(9686003)(53546011)(26005)(86362001)(6512007)(6506007)(6486002)(478600001)(85182001)(6666004)(38100700002)(82960400001)(66556008)(66476007)(33716001)(66946007)(2906002)(4326008)(8936002)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0dzaGhBNWVJcTAyZ2RHcy9jM3UzTStlVXQyL0pvYTZNZXV6ZFNra2p0T0ZH?=
 =?utf-8?B?aDhmSTl6K2ZpUzcrRmNDeXU1Y3d4WlY0Q3FBMU5reEhwd3NWQW1sYXQ3ditq?=
 =?utf-8?B?UkRPekpuT2pBbXdRREt4TS9BUHg4cktwNXl1Vm1Scy9ROXNmM082VGlRZHBM?=
 =?utf-8?B?YWpxK1o2ZVlBQlJZbzdFZWowMG10NEY2cnRoQmltVlF6eDh4Znl0WmR1N1lW?=
 =?utf-8?B?SEI0T0o3ZnNwbE93dzllbk1DcDhqQkRtcjFtMUR1dXdoUk93Um91MWZpcGEy?=
 =?utf-8?B?eFpiL0wwMjRwUGxiR0UzZjJEREJwNThMOVpTaVRCQVhoYmNHZEFRblhUcmZN?=
 =?utf-8?B?T1YyWFJpWFlXQ3l6UXphYzJ3b1g4ZFMwUmhhcFVSeDVsbVViOXdtTjNjT2tC?=
 =?utf-8?B?VDRNM2JQV3QrWjlZeXoxemZ5NzhVaVZzMHgzcW5NSHIxSGhuWm4zVkYyd0l6?=
 =?utf-8?B?bHFlMUhDSXhLNTRWdTZtM21tTXhVamZMOUxZMHZXdkY3VTZPNEZrSzJJVG9E?=
 =?utf-8?B?bXdIY2RwMUNIY3RaVStZM2llN2hFOFlNU3JUMnlhTjI0WGtoTEFDQXFlelRW?=
 =?utf-8?B?ekdLN1QreTB4OUJqaFdWWGpDQVNNVDdNTTJZV0FRWFlTQVlucmcwTGl6RHNo?=
 =?utf-8?B?d1lGRTVGcTZkcTIwT0NkNzhGd3gzay9VQ1UyVzNRdHlFdEFFZkp3eEJDSzlG?=
 =?utf-8?B?RFc3SE42MjkxUy8rYkJla1BGT1hYTjVabDhncDFqV2psSTlkOEFjVm1LTFRO?=
 =?utf-8?B?TkZPRC9zU3dDWHVCaElGVkNmdU1EVG05NFR3Q0U0Qk9BSU1FbDdDNkJIRUU3?=
 =?utf-8?B?ek5XbUVBT3FMSXlTSzdzM21rekV2SFVsWkxpSVZJR1JiY1hWUEFWSVVBZVho?=
 =?utf-8?B?OXVXUzFmTVJ0cnJheDNDYWRpeG5KNGlFNGFxNkZFbzZ2M2NTemlXYnIxNkM2?=
 =?utf-8?B?VS92MnVQR3NObFV1N2dwS09LUzAzWUNCRVNMVEw2SmFiaUh3ZFlWMzUwbGJR?=
 =?utf-8?B?dkVJUStvWHArRG5GSzhJeWRhbi9CeUVZL2tpSnJMVUJBaVJlMlZiaW5ieTIv?=
 =?utf-8?B?VCtxVlA3ZVVDd0pKVkc3MlNMQWRjdmJpZnNGMVIwalZkTEpHOWtpT0d3bHVT?=
 =?utf-8?B?dytIUEZVMTVxbzR5WXBhbjBZQzJkcFBuK2szSnUzSFJGUVA5ajB0ZGxHemRM?=
 =?utf-8?B?dW9GU0tSdFRkSStGdCtlQndXd2xyRENucjlBaVQza0JXcm5IRnFOMlFlR0h6?=
 =?utf-8?B?ZnRlN0puelg4eXhXSkhGU1FmWGJqekxUcVRPbU93Q1BXWmJpZmQ3WUdqUFBj?=
 =?utf-8?B?WnhRQVcwVW1jTkhBaHJ6K1piUERXblp4NGpsRlhEUW9ROXN2VWkrZHZ6MU13?=
 =?utf-8?B?Y3FuRkhCRG1DeHU5cXY3c1IzZFlGSHUwOWh6S0tpc0wzb0tPQjYzTjVxYnN5?=
 =?utf-8?B?b3JCSGlOaFk0UHJyZFZ3QkNpd0xNaE01N1M4ZXBRejFsQWJUQW1XWXl1R2pE?=
 =?utf-8?B?emhHMncxUHRrYXh2MitOWTIzQWdYRjQ1V01KYUdpNERlNnV3Y3JnTmxmWXo5?=
 =?utf-8?B?cWtKQStXdGVWV0g5d0JDaVZXVm5EVEJSaWZRbnVlalR2NWNwaHVIMGNEdFVh?=
 =?utf-8?B?alcyYlYxbmFRcG5HVnhnd1J4VCtZUlJsQStMOUsrOWRubmJ2alBISEF0MDVq?=
 =?utf-8?B?MHhVOTN1K0dzczZ0b0djL1oxcktKQm1PdzVqQkZKMmhmb1d0MVlCWGE1cU84?=
 =?utf-8?B?KzZycWZ6Y0p4RkI2U2NFcUhrcTliUHFtNkVLZDMwaWUvRkFNY1RVTEIzbXhP?=
 =?utf-8?B?SWRRK0pKWWRGMjgvVTJxWkd0ZWVOZ0NLRzFkbGVLeVJVNWJTVUd2UWFwS1Fv?=
 =?utf-8?B?clZnMHltQmFjckh1OHBza3FITUpDL3UyKzYyMUJBRXJJdFVFZDM1S25LeGV6?=
 =?utf-8?B?aWJmRVVRRUVqczYzbGp5dmNxdFh6WnpSaERpNnVHenFPNG8yN3NhMS9qZlUr?=
 =?utf-8?B?NUtBUHNMNHRrZEVQL1h6Sm9MTXdxWklieHhpYzVkVFVqNW9jZlZQWVhFUXVB?=
 =?utf-8?B?a29OM3lSV2Z0TTd0bTJyalh6ZE16MGo5VlVndE9wMVZCZkhnTzBKeXk3ZnQw?=
 =?utf-8?B?TFlidVdpSktBR1lzejBZdENmajc4dW13SWJoSWpTNHY2b3lKcVRtTmgvcTdt?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DSJz/dnyT3W23/WQt2iV4KGkfhksNvHFf/WHklIGLtO7sdr4UIH/kuYMCD7IiZhaqu4WaE/bvCavFAbK7ad8zJqVo7j+9nfdjkldoW6+mKWskXaaWWiNJme0xFeX/sq1OVuWPORZ672mOq3ZnA4T0WHLeYFZyetJW06z/k+tmpBY1130ljuhG0Xmf3M1jP9Er2p7Dz92K+d7VzYgRDxfNHr9Rvl57dCmjhKLSNjtqLknzW5X5swYlqyB4PUB+GhZGHMkbqZoCk94eKkzQ/t3TDxJfSjUhPUCxhwhcfMNVjvCAKbBdkfWZ4f0YFgvRVos5UPJrss5Vh76L1e7SVcWFZ8S/AgYxCNjdPKIeU1QSGMnWp5DDqv02lGHg1FZI/6V0SXwAZou6Z3Q1gnEcaIjhrSCNH+rt1OG0l0rwodt6agC3m3TN0Gzw5IC1PnDEyM4z3ZliSZ+k04Xa8JQGxSCSPDOyMHUp5KTIWvMMCs4jICykB6sFqzRvwAJVEbInzqsok9PL1hoZX+prcq8O4iCuhYc1Rnlja+DzVDh1wKVAp2aG0hlJQn3jmjzUZsxaqa5wMv2ZkQm/Vqx6cILwPRjht0U6Hbc82CH9mbNmHzCNrA3+rbn6OihOP0ehB5jeiiBkQs2/BlRHtbqD/XScKtGFnTnusZhOms4O+Wmn74pWdc37C9qnkMCFJuWEF8ZfoT5FSB2meHtVhB4RI/fM4B4+6deJIM4An2foeorH7/8RhdI4AJ8fBs0UFUkD8C3ECAtOoIIiB1+DM6byT+difZooVoRf1bxw09538HSq5RCaidCzUIgV9nfgB79MyTvR+d+cVMHk/eebVYbWC+aKbYH+pTdIUMI3ShUUweEVkdeLHlqh8CtsIONF4Bc/B3Ni7ar9gfFnPgdrLlPw92PhE5Qyg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a54ad27b-0060-4da4-a784-08dbc33d4540
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 11:46:54.1015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2v8v/VT8Tbcxzj0sgKWBKfrwZJucV+YdzO+BKlvDYKGx9fYp6sOkG/YPjE/oGZLG8V8W+dl3DozO+f2dz/N7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6459

On Thu, Sep 28, 2023 at 01:48:59PM -0700, Stefano Stabellini wrote:
> On Thu, 28 Sep 2023, Roger Pau Monné wrote:
> > On Thu, Sep 28, 2023 at 11:32:22AM +0200, Jan Beulich wrote:
> > > On 28.09.2023 10:32, Roger Pau Monné wrote:
> > > > On Wed, Sep 27, 2023 at 04:20:04PM -0700, Stefano Stabellini wrote:
> > > >> From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > >>
> > > >> The feature is not commonly used, and we don't have hardware to test it,
> > > >> not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
> > > >> members. We could use QEMU to test it, but even that it is known not to
> > > >> work.
> > > > 
> > > > I think this last sentence is ambiguous.  QEMU ACPI CPU hotplug
> > > > implementation does work AFAIK, it's Xen implementation of ACPI
> > > > hotplug that explodes (or so I've been told).  I would drop or reword
> > > > the "but even that it is known not to work." part of the sentence.
> > > 
> > > Maybe simply add "... on our end"?
> > 
> > WFM.
> 
> Just to be clear we are going for:
> 
> "The feature is not commonly used, and we don't have hardware to test it,
> not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
> members. We could use QEMU to test it, but even that it is known not to
> work on our end."
> 
> Can the change be done on commit?

LGTM.

Feel free to add my Reviewed-by: Roger Pau Monné
<roger.pau@citrix.com>.

Thanks.

