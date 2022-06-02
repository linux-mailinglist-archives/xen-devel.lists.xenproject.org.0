Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A6053B585
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 10:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340939.566080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwge8-0005VM-VQ; Thu, 02 Jun 2022 08:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340939.566080; Thu, 02 Jun 2022 08:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwge8-0005Tg-SI; Thu, 02 Jun 2022 08:57:36 +0000
Received: by outflank-mailman (input) for mailman id 340939;
 Thu, 02 Jun 2022 08:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nn9h=WJ=citrix.com=prvs=1458da55d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nwge8-0005Ta-7g
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 08:57:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09fc2717-e252-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 10:57:34 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2022 04:57:31 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BLAPR03MB5377.namprd03.prod.outlook.com (2603:10b6:208:285::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Thu, 2 Jun
 2022 08:57:30 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.015; Thu, 2 Jun 2022
 08:57:29 +0000
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
X-Inumbo-ID: 09fc2717-e252-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654160254;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QDtgbft/Cxdtj97ZtW1AEyEOYV69zeM224TKCB5HUhY=;
  b=DJhWDZ+7PrHfipSJ2UN3m8M0RX6fqC26s+yEtLK480ryeouXDPicvYvl
   c6WL8ceOSr4WzfvCKjvoTZY3EG005bm+TtWvbnRJVLKUN9raoLOdj28Oj
   aObDDct24Ccijwn2Tr7IbziPJS3LdM+3SySsaMsvIjpv+05j9MkCgsf3Y
   Q=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 72702191
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0jNtVKn6Fio22Vi5R82guKjo5gz3J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaWWyOaP7famSgft9+O9u0pE9QuZPRx9VhTQZk/CpkFSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DnW1rV5
 bsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYaQguLKvKnsUhSEMFHC8vHvFi8eaXCC3q2SCT5xWun3rE5dxLVRlzEahGv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXtZkBhGZYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8g3N//NmugA/yiRWjJn2OuPEJOaHVJx5pFiF+
 2vC1SfAV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwWxvXqsrhMaHd1KHIUHBBqlz6PV50OVAzYCRzsYMNg+7pZuFHoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd17UZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:pH7UPqqBhrxVScp0APPyzc4aV5u5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wI9HdwGOtx5Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexvwqEH3QRSvyWqOLtB1B1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.91,270,1647316800"; 
   d="scan'208";a="72702191"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTa+OwJb2x+JWQd2oWr9Q3T9B4XFNA2AYtZFRaTVPQ8HB2zJ1OFe347+Gd8WWLwu+nR5J6IQ0kWaOcPvdGWrYmwppMqfjLvO3hlHx3DLZMFSdiIzNRHQJCucsv63EQLmnqLOEp9V6F+oKqDcJPbk96GY9PNXl91aadj+Q7zjW5lrfdHWzTX0CjC7i7UPBQvsDLImo8muOYfXBgg/yumiz5t2z4nYK4hzHu2UElnUHKqpUR3+EsT6uLlKZWBQhOvbGA6kJd+zPW0tll8I+7DwMuEqmcC8utkf2HfRTyw2E42eEDCal0Vog3ye/Xs3CSsMMLRlgAO2q0qpbuuJjlnYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyK9lpuqccAyMNRDPPVpi2RaPYRe2kccwtZ553nC4iQ=;
 b=frm0V4PiNYqah1pfKdtl11qpDFJeQ0K2r50VsJ6VhO0S5LzhB8iC6Chf8Ji6WKZoZ9MgdWKZ9qfCX96bFHyh5/3haZC7RJPjuqpNg5mvvyruHQKRBmxI8Ek8uBeIprtiIs5hDG0LPer7jgm2CZDXQNogIqS8tFKiEpdZf219jCXJbBkdcN13QrDO7YebnM01s5ueGyZG4XxF2UlvJPifeNLmqjUU3NcifIzF/sk8e4meCv+kKO8cwdTOL2KhJdL3fg9V/MQagF+g13PTnsdhwjdHs6l56CrvwmHMy3/8p63fG1UP+2HeZxxYvqDsLaZidfd62MldzDWkQHyoda5Caw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyK9lpuqccAyMNRDPPVpi2RaPYRe2kccwtZ553nC4iQ=;
 b=AXdVURYja0qtYTNCNJXkv6LWtmY3uLlXXxP/DD/EFaz1eF0kgUipmvOwxbnGAwf4I8uN1wrGe9tAPUplBpghdD2gv5lpf0ZvmfQCZD8Awp8/pxVFfr/9vQOdkn1pS1MoM/5RmOFTHGZP+Unpxf5Vu8MqwYAEpES0dx5Kr9EfIKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 2 Jun 2022 10:57:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 03/15] IOMMU/x86: support freeing of pagetables
Message-ID: <Yph7dbKcJY8rZinX@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <614413d8-5043-f0e3-929b-f161fa89bb35@suse.com>
 <YpZBjVxRdJOzJzZx@Air-de-Roger>
 <372325ed-18b6-9329-901d-6596ce6e497d@suse.com>
 <YpcwOCBEzI+qvTga@Air-de-Roger>
 <2014c9a1-1c38-b36b-160e-f79afcdc3a10@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2014c9a1-1c38-b36b-160e-f79afcdc3a10@suse.com>
X-ClientProxiedBy: LO2P265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de0f25b2-e1c7-4c61-ed2b-08da4475ec99
X-MS-TrafficTypeDiagnostic: BLAPR03MB5377:EE_
X-Microsoft-Antispam-PRVS:
	<BLAPR03MB537747C4A98D7C92603327FD8FDE9@BLAPR03MB5377.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SzV4+NaV5VzhBrtZR28MkU1EjklZ2kaihgmu6S45Dy+VuL4nU4drAKKirMS+LcmyNQARra57U5zHFZ5DWadBwQ0i+g5VawJhaHqgd4nhq5i5NU6KH727Rn/a0HVRwQIVkRA2BE1EIFi6wN1qloJ3DF1RKVH1ouhKdme1F09K2YUAqvQ4rBhWDgcIojDG4rwwv2WlLtAdsISei7hYU3FHNpVR1lEDyLr2LNRfwTOw32iEd8vo9wNkazNeTmrGGB6xEpvWMuvGdXT//kIBoMIw+YlEvsIt2ChNvZTZ3q/z0upk6B//Un+UcGM2HhJeNFtWvRslSIwkomiyFNsKmOi9qdFa4yHUBroWcBJoSyhEtKL3j+PyZj+onXQZs2JOrBBAbkClv1MJK0Px6tylfDzzDtW1w8e+O5Pwn1nJStrv+8ZVOtyMJoJHkvGBZcxt/eRCxdupnIpW5JD2RCMw6hAAd4/Z23Ssobp7c8amaIRyUkL+VbT8tN8TQFQrJolIZF/WKSrFteRsoBjjcmQWXWy6Q3RA8C8GVuiUanSDJoFAzSpMgv4rYPVYMDOVU6KsKec1q3Y/iT/F06A4NUOKKt74qvefgzSeDg+OV0Ukn8m5QoKFIK1N49R0AWG9ig1xLReXv2a3CAzC/XlEb5+/aBhAWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(54906003)(66476007)(8676002)(6666004)(4326008)(66556008)(85182001)(316002)(6916009)(82960400001)(33716001)(9686003)(66946007)(6512007)(2906002)(508600001)(53546011)(26005)(86362001)(8936002)(83380400001)(5660300002)(186003)(6506007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjFzdW9mTWF2UEN0MW10NHhMeEdGZG1meGRkVlFqNEhHRk92Uk1yYW85Nm8z?=
 =?utf-8?B?aHhSaStNVWxSbTNqZU1sYyttbnRVaWp0V3pWRGZVb1IzdGM3ZG5VZERoV3Uw?=
 =?utf-8?B?TG1ROWRpNmhsSlk2eUd6MVFSZFV4SHVSVnFXMFV6TnlLZldHcjI4ZDZFVFlq?=
 =?utf-8?B?TDZzd1QrQTZlZ2l0bDMwaC9jY0RZbTR5K0IzM2FudlNoQ2VGc3ZpZGtOU2Rj?=
 =?utf-8?B?WkZoRHhPZThrTWhSamNoODBOLzFFVGhzWTRLZjgwNHRZZysyMngxT3pQci93?=
 =?utf-8?B?cFU0VDQrcjhUQ05HbnVqYm4zKzdNWW5IVDdDd2gxRUZRNGlFWGNueEpFRG1X?=
 =?utf-8?B?dEhFd3BXckM2UUdiR3VRN1FRRzc1dHJoRGJNZWdCb0t0dU84NXgwUUdXc3V2?=
 =?utf-8?B?ckVSVXczNmlyaUZDTG13TkoyQnlvNFdWQW5ISE9TMzlBRHhKK2liM3FkT2c2?=
 =?utf-8?B?T3pHemp3dDVaNGhUQW56Z1VaS1lNVlJHaUNGTzBpYzA4dHN6ZUpBNXhSdkk4?=
 =?utf-8?B?MHJsbTBZL0l6MkFEc3RMNXBaOWgvTlFyUmpESnlFbDJ0UzliNXVUVVVwS3pL?=
 =?utf-8?B?TmczN05Db1I0anYxTXpYRTMweWpqS1FvRjZVb0FxRlBja1RFVEp2NitLZXdQ?=
 =?utf-8?B?Y083V1FZWXVFVmJsV21yTVQyY2hCQ2VIeExzby9lRDdmcXFUc3AzZ2RGTi9Q?=
 =?utf-8?B?bnZrK2dJZ3R6Rnd2WHBjTFhKKzNiWEdQOXdiUXFvSVdhQ2NDRzk1OXRZRVZy?=
 =?utf-8?B?TjJDRWxTUzZoRDVWQWIxSzZpT0JkcSswZ1I0bm14ZlNmQlVvWnFpZVhqaGk0?=
 =?utf-8?B?SlArd2ZhRzFTZGtlLzZsOTZ5K2FMSEFmZ3BadTF4Q0hIRitFMnFmd0lxSFZJ?=
 =?utf-8?B?cW1SajJmd0U5VGZ4NUR5d05oVjkranI4cUtVdzBHN0xTbmladXNVVTFWMzNx?=
 =?utf-8?B?dE55TEp3aVAxZW5Iek5ITVVJSlhuWEVrVVJ1UUpYMHRrS3NvTDU5UmpUNTUz?=
 =?utf-8?B?L015WUJ5cDFCUHRNVy80a0xJeDA0ZnpEa0VuWFZkZlgvL0NQTktySjdYd1dq?=
 =?utf-8?B?NHRDVFZRMTJubW4vU0RJMG5BQ3ZRT2owTXczMlgxWGt2SkZFUysyL2EzOVVa?=
 =?utf-8?B?VTBPVVN3eUtOdm9Vc29yVFpnNDVyWjgvUVlXQzFOa2hBWUt6UTI2ck5ySGxT?=
 =?utf-8?B?aTJ5NnRmMzlqeGJkVW93RkswMjRNNEZYcU5oMndWVU1NMjFSUGQ3cUhNaURZ?=
 =?utf-8?B?K1IweXJhUXRnRW1OaVI1WEhKR3h0aGovd0NRVU03bHlXaVp3S2d2MHNZRHB3?=
 =?utf-8?B?L0R2czZpVTNTMmRUVGJIWnZMMG9tam1xcTd0YnRnZnViazY1MFI0endreHg0?=
 =?utf-8?B?allvcDdRRzZxc2Rkd3VaRHNiU1IzS2g0alpBS0lQbFJIRTk1WVBlaENxVnha?=
 =?utf-8?B?UitrR3g0eHNHTjJaT21Eek9jOU9WL203Zkx0bzM1ZlMyWUlYU0EwVXFpWXVy?=
 =?utf-8?B?OGlBb25iZ1JFUlVUeDl6TitjN3JDaERTZWZ4RmhydlNNT1N0cVllSlNncW9Y?=
 =?utf-8?B?S3hCeGVDcWwwMVFHOGU3TGhEZzNDSmVEUDJVVjJKZUxIbHhsdm9vNXZwN29Q?=
 =?utf-8?B?MzZOM202b2xaQ1hNQ2JyaXorVTdrL3MrSFMxT0d1VVh6WU93U2ZjNnFSbFdl?=
 =?utf-8?B?RzBOc2FXQzd5U3dvTE5LTkEyS0lzVnhHYzBQRXRxWlF3UXZaRWlnZG9UVW56?=
 =?utf-8?B?ckpHYmlBODJ5V3RsMmtlSmZPQnJ3TDBDR0xLQ2k4czhBZVJMNEM0NW5kUy9X?=
 =?utf-8?B?bG15QnpkaHErSWQvay9XcHZzbjlJejVJck8wMG5mQ0pnTDF2cm9KRXhOa2hy?=
 =?utf-8?B?Z0RXWDdtb056bW9WaTF5SmNiWGQ4em83Y0VyZCtCR1lsMEgwU1dxaTNGeHRk?=
 =?utf-8?B?ai92OGgvMVFXSTFjeVFJS1NDQitQWE5aNXVNWk41VUNGQ3lhbmlQMWRxVW5W?=
 =?utf-8?B?eWZHbDgvOTlRTHVFcUV2KzlwR1N3ZEFzYUhkekZJQkJMaDl3WU1NNGFnWkNZ?=
 =?utf-8?B?ci85NCtXNHdydjJDS2VuT0lXSVpTc2NnY2k2ckJWRm5aUHQ0c3FKVkNUa0Np?=
 =?utf-8?B?c1lzZU1pRlhieTRYeitHWHcrcE1KbFoyY3RleGgwd2podkU2ekRBUy8rY3Qr?=
 =?utf-8?B?VjlKSWErN25oUHh1ckJQUi9lK1lXQTJHWDNRRkJPbkVQa0YzamFNNGdEd1E0?=
 =?utf-8?B?Y1d1NGxTNzE4Z1RwT0hxRUVjN1g4QnFhL3lwMEN6U3RhZnZQdmU2eGduRkxX?=
 =?utf-8?B?TnowTnVrREFJZzk3R3NWUXpjaEZLMk5sdVoxUXA1OHMvTVZNdVAxZy9hclBC?=
 =?utf-8?Q?XVMJdvIjupqV7kEQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0f25b2-e1c7-4c61-ed2b-08da4475ec99
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 08:57:29.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjtyPOuHdCNiuh/ic8RiLV/8rVcMt+IizRwy0gCE7RBcDN68cO6brFmjTRV3oMJtNo9tm5U4WPekWo585go9/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5377

On Wed, Jun 01, 2022 at 05:25:16PM +0200, Jan Beulich wrote:
> On 01.06.2022 11:24, Roger Pau Monné wrote:
> > On Wed, Jun 01, 2022 at 09:32:44AM +0200, Jan Beulich wrote:
> >> On 31.05.2022 18:25, Roger Pau Monné wrote:
> >>> On Fri, May 27, 2022 at 01:13:09PM +0200, Jan Beulich wrote:
> >>>> @@ -566,6 +567,98 @@ struct page_info *iommu_alloc_pgtable(st
> >>>>      return pg;
> >>>>  }
> >>>>  
> >>>> +/*
> >>>> + * Intermediate page tables which get replaced by large pages may only be
> >>>> + * freed after a suitable IOTLB flush. Hence such pages get queued on a
> >>>> + * per-CPU list, with a per-CPU tasklet processing the list on the assumption
> >>>> + * that the necessary IOTLB flush will have occurred by the time tasklets get
> >>>> + * to run. (List and tasklet being per-CPU has the benefit of accesses not
> >>>> + * requiring any locking.)
> >>>> + */
> >>>> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
> >>>> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
> >>>> +
> >>>> +static void free_queued_pgtables(void *arg)
> >>>> +{
> >>>> +    struct page_list_head *list = arg;
> >>>> +    struct page_info *pg;
> >>>> +    unsigned int done = 0;
> >>>> +
> >>>> +    while ( (pg = page_list_remove_head(list)) )
> >>>> +    {
> >>>> +        free_domheap_page(pg);
> >>>> +
> >>>> +        /* Granularity of checking somewhat arbitrary. */
> >>>> +        if ( !(++done & 0x1ff) )
> >>>> +             process_pending_softirqs();
> >>>
> >>> Hm, I'm wondering whether we really want to process pending softirqs
> >>> here.
> >>>
> >>> Such processing will prevent the watchdog from triggering, which we
> >>> likely want in production builds.  OTOH in debug builds we should make
> >>> sure that free_queued_pgtables() doesn't take longer than a watchdog
> >>> window, or else it's likely to cause issues to guests scheduled on
> >>> this same pCPU (and calling process_pending_softirqs() will just mask
> >>> it).
> >>
> >> Doesn't this consideration apply to about every use of the function we
> >> already have in the code base?
> > 
> > Not really, at least when used by init code or by the debug key
> > handlers.  This use is IMO different than what I would expect, as it's
> > a guest triggered path that we believe do require such processing.
> > Normally we would use continuations for such long going guest
> > triggered operations.
> 
> So what do you suggest I do? Putting the call inside #ifndef CONFIG_DEBUG
> is not a good option imo. Re-scheduling the tasklet wouldn't help, aiui
> (it would still run again right away). Moving the work to another CPU so
> this one can do other things isn't very good either - what if other CPUs
> are similarly busy? Remains making things more complicated here by
> involving a timer, the handler of which would re-schedule the tasklet. I
> have to admit I don't like that very much either. The more that the
> use of process_pending_softirqs() is "just in case" here anyway - if lots
> of page tables were to be queued, I'd expect the queuing entity to be
> preempted before a rather large pile could accumulate.

I would be fine with adding a comment here that we don't expect the
processing of softirqs to be necessary, but it's added merely as a
safety guard.

Long term I think we want to do with the approach of freeing such
pages in guest context before resuming execution, much like how we
defer vPCI BAR mappings using vpci_process_pending.  But this requires
some extra work, and we would also need to handle the case of the
freeing being triggered in a remote domain context.

> Maybe I could make iommu_queue_free_pgtable() return non-void, to instruct
> the caller to bubble up a preemption notification once a certain number
> of pages have been queued for freeing. This might end up intrusive ...

Hm, it will end up being pretty arbitrary, as the time taken to free
the pages is very variable depending on the contention on the heap
lock, and hence setting a limit in number of pages will be hard.

Thanks, Roger.

