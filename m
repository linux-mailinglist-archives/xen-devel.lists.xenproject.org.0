Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3AB534DE2
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 13:13:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337556.562190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuBPq-0003UG-TM; Thu, 26 May 2022 11:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337556.562190; Thu, 26 May 2022 11:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuBPq-0003Rm-Pd; Thu, 26 May 2022 11:12:30 +0000
Received: by outflank-mailman (input) for mailman id 337556;
 Thu, 26 May 2022 11:12:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibG2=WC=citrix.com=prvs=138a1b502=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nuBPp-0003PI-Hg
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 11:12:29 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b946a42a-dce4-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 13:12:27 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 May 2022 07:12:25 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6527.namprd03.prod.outlook.com (2603:10b6:510:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 11:12:23 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 11:12:23 +0000
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
X-Inumbo-ID: b946a42a-dce4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653563547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=IjSmW8a1Um+GGMYx28eSmPuDoMRq2A1WoAd0TjwqTSk=;
  b=J1wkBp5nfK8DjKcJOJPvUvAqrW1aKf/f5v37pVy3zWUJ/3o1etHL3dC8
   POSPTV4cpYfFhFxAZdALYwgkLb5w7dmeVR3TwPGVAixl/kGqDQohbA52i
   +Lf1IL9qCfLMAx/nOEwaEPpJXChb6Ttewm0w7ySPLBviAlo5NSJobobF+
   w=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 72630640
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2yE1f6+oXuqEo7YpKA+aDrUDmn+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2pOXD3SPKyIZTP0Ldp2OYS2/RtTupLXnIRlQVNsrn88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3ILnW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbuiCisTYqzupMc6dEVYITw9OIsb/LCSdBBTseTLp6HHW13F5qw2SWQJZ8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHviMvIcHtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGcG8wrL+fJfD277wit207TIDOLpPePRd8JvowWHh
 G3C8DGsav0dHJnFodafyVq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRokyjXZRZI
 k8d+CsrpIAz8lCmSp/2WBjQiH2JoB8aHcZRGusS6QeRx66S6AGcbkAGRDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+pQSiaPCEUKSoHenUCRA5cu937+thr0VTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:lW59pavwSjrciKMZFBR1BMFk7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.91,252,1647316800"; 
   d="scan'208";a="72630640"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZTsr2ihrAEUmvE3vLt102ZtesSSmuVPWN1lszmUZkQQnblr2976XIxdyNGV98ntKEJt+pSpeJrxDqwcZo+P7VJ3FZTCb5iir0LAlfezy64JoLAZ7juqjb3xX6zwOc07/KkjtQ6KdggE2V+hdVmDuNsO5Be1DvTHljagjuge703NdBVt10q0PBWX73fLp2LBY2EhGZHZ8zWP7gsDerrnmOgvK7zGbmgJGGoE5sESMnlAeriJADkKYeSmCbBS2AIVY8lzJnMZDJtvSnKfKJet0euqj3W5ifAPa+7YCe/HtUAgZYwm3xpKfVVG8+bRpyPRmhCIpiekt/ua7jaPThsuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk51GUgUWIAXFPTQpLQYHdKMy/7fDVifoFw+Du1GkSU=;
 b=IoVD4iHAwT0dRCdY4PbKfTcCeBBsaNpsArhyIVWCbfbxlqFPWR0gIY4CxkUEoYRaEmducvzRqtV6vSnTBk+RN1wy9gCR8HUZv//jmcwfWXmJWNKzJEVKjWiOBZ0AdDiUwXJonT4HlxaFSXz+aWYYo/igakArWUwmN5dxjGlF5xPqRr9IEp8fUX3OiW5KnD8FBjJC0IEGB1ehBtRSCc3t0GZATnIa/blcDVw+i0bVW9Bo09LTCJXuxfPfmW5uJSmTfDBLO8ZrzryQg0RANy7eKIDH49cOIIpHt6+GmMVQF9bd+nLWpJIL9QoHA3zEcBqQGWfsfe2G5CQmeKpsYfoftA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lk51GUgUWIAXFPTQpLQYHdKMy/7fDVifoFw+Du1GkSU=;
 b=k0vSU3nu51WbGrE5TP2MwqI3mQq/ihEJgSwXg0/Ox9jbe/gXMTkPFzbSVZOG1JGKUYxM/lZGQK5kQu4ZWCUYCuy3f4vGjTabEp8HQNs4CzDZ07oIJMQdIxQCpkRgffDKPaMGtBgdsjGYcNXMHVaiXwFWmLBPlQDInW0f4y2XGz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/3] x86/vmx: implement Bus Lock detection
Date: Thu, 26 May 2022 13:11:55 +0200
Message-Id: <20220526111157.24479-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220526111157.24479-1-roger.pau@citrix.com>
References: <20220526111157.24479-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0472.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84c91296-d62f-4b61-6c93-08da3f089bc2
X-MS-TrafficTypeDiagnostic: PH0PR03MB6527:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB65279EC217BC94FBDF2C5A128FD99@PH0PR03MB6527.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8FdQy/bgXTeZ8ARRoWXDk2Nh/pUAdUL6TVVI+hst4EedvK8OXnnPQwM6poc3ZDzrcwCZdGY77R4aLOTjtOXwhJETvEaZ5/zdLuWywz9kf6pcDAAIKDgszyrJV4+2QnJ0ran5hmBH62aTo2xibF8wJSGHvNshMKtAxydPpLpQcksfqV8etb3k3I3tL4EUUtCJF4EiRtUiUZm37B3GswPTW1UZop84V9q/Y8yYCJAV8rYFc863NkB4xA/JzRgprU1TKv4fKaKwt7RvyfIqljfJdMV3sSYyQ6ICYXmyb2CO9FjhS344v6tE+1lcBbCtTXPZbSuQxMimPdRBGrg8jmN/ZUeye/OGeqKnsxI76c4RRFXdOpoma1hf0JAsJntBXrBc0oy6kvthpJzeyOqn+Zgg9flny8TMjFCxhnYnQmDWkOHANYJ7yfhN7VA0/5287Jj9cdeag5MJSnfbPabL7EzH15NF4MvCW9d+USDhG0n/VvBN2L47tewXJCU3f91nuDJL/JEX++Z1WZMy9LqftUAycMx8+pj5PpS5ecLazu9c7TfoYvpvuQzyw5DugXW9pff+wPxnYdudoi1hrHIExgpnPKusVKtwWGmjykqyGirUJMVcbRgPTqtXj0W+Br9xKYBC7nyGFO+pxF8TSZ04uydSfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(86362001)(4326008)(66476007)(66556008)(66946007)(8676002)(8936002)(54906003)(316002)(6916009)(38100700002)(1076003)(6506007)(82960400001)(6512007)(26005)(6486002)(83380400001)(6666004)(186003)(508600001)(36756003)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVZwOTlNS1RqVE1aQ3JWOExvT1RNQ255WUNWZVRwTEM4eFVOejFnSHZHazRF?=
 =?utf-8?B?SWl5TFhJeVI3RWJPWGJ3bmJkQVVtYWFMSlJBYXhValZaamJoOWtTbGdWeXFX?=
 =?utf-8?B?TmkvRTkxQVkxTG9JTml6b1NwQy83eWVXMUlOVkIwaHhnTmZQaWxWSm9NeWRD?=
 =?utf-8?B?dk1YN2VVZExIQ3Bkb1B5dXV1cktSbmJFOFVDeDQxY000dDJtNDdrKzFKU3A1?=
 =?utf-8?B?TVh3U3hkTGNhc0tUdlR0RWN6OFB0WUdPcUpkaDBYVDNVeld6RXlqclhPNlVS?=
 =?utf-8?B?TW1SUmlRTXZvZSs0czFMbTczOEdIWVN4ekI5eGw4a3lOR2JseXcrTDlOSW1p?=
 =?utf-8?B?eXFZa0VLTmtVL2dQN1RoOVh5TmcvLzlzQ2Q3czFKTkM3YXpsKzZIMFJJMjl6?=
 =?utf-8?B?S25OcG1ZUncxYTRSaDJzY1FRRDZMTkN4WE92MUFzRCtiYXZra05qMmp3dU4w?=
 =?utf-8?B?Mzh3cW4xU0JDN2pUUkZ4dmpNRkd1OTVzY29QZ0lmaldieTl3TWRQWDgvbnFw?=
 =?utf-8?B?RlRUU3VaVGhCNGdQTFpsc1pTTTBhWW9MY3YzcFNvNVA3MDI3NS9KL0RIRmFT?=
 =?utf-8?B?Z3RwUW4yWWlWZWxjSkZHalZBZkQ4WEVGUUhNTjlVeWxYeFdadzQ3YVp1ZXB1?=
 =?utf-8?B?OEJDZmhDak15UGh0bktubWpQY2FERW1vNXAvUWhiUCtieFBMRWZmeGJmSFdB?=
 =?utf-8?B?WktrTEtkRG83dEZPaW0rWFczME9sTEliK0dzM1F0aVdHdStHbHFuMmZjeVJR?=
 =?utf-8?B?ampqM1dCWEF6azI0V0RNNUlzUmgybUFRLzlpRU5HeVdLR1JuS3VlZnFHbkZT?=
 =?utf-8?B?MTl2VnNnY1I2RUI1cm9UUk0rK0ZWT25wdFhMUGEwWkdDVGs1cC9uZzhwMlI4?=
 =?utf-8?B?QnhDeDVISGZ3aFQ3dHp4aVFZckxCcHFTTEROb1FPeVNCamJac1RPTFBJcmdh?=
 =?utf-8?B?NWxUK2k1NXJFTXQ1Rkd2Ymw0Q25BSExBQzlxYk5YY1k5S1pUb0xuajBzbG9D?=
 =?utf-8?B?OGdqeUdrekFOREdBSkpTWWdwQ3R5Z0RwZTNoZDMyVVB5d0srMHNudzFNTnVs?=
 =?utf-8?B?OFBKbThTRzExTVk4andjdjI4cXlhajNZUWlRSVlGbmlJR1BMcTd1WGdrMGVl?=
 =?utf-8?B?THhIWU5Gak1OTkM2cWdtU1ZIbXlUN0hic2NUbkJtZjhUS0F4UTNRUEQ3My92?=
 =?utf-8?B?cTJvQ2E0WVFYTGhldk5ySDFlVzhuTDRpU0NhL0lZdjBRQzg0TGtBT3pCOGdx?=
 =?utf-8?B?aWFodCt1dkx1OXBaTVMwVXFnZy9DS3cvcWk3aDdncHUzRFJiVWJvWE1JR0ZT?=
 =?utf-8?B?R0ppRnhvWmZuYjlvN3RpMnIzb0lkcDdJcG9iKzl0ZE1tbk1YeW14bFRQMXJu?=
 =?utf-8?B?OTZJS09ZVS9BaGlFWmhISDB1Y2NLSXVXenZrd3NXcDFUejNYelYrRXBLdnhw?=
 =?utf-8?B?andtNUlBcmdkSlVuVGNhQnhDdy8rVUxmcE1GYmN2QTYwTFQyWlNwdXRoOWNq?=
 =?utf-8?B?ZUkrOGpPN29zMTNZbWlCYjRVYWFZbDg4aGg2M29mQzdYWVQ0RDA0SXY0bFpz?=
 =?utf-8?B?dmtRd0ZaYVpRRCsrbzlxYzRLM2JvUnZvSFdFUkd5cWl6MzJ3OFZQelpxMFgx?=
 =?utf-8?B?RHZoOXZzZUphcXRKUnJuVGtCR1p4TEJsNXlGYWNmU3c5bldERmxibzNXa0Vh?=
 =?utf-8?B?c1BSSWd3REtMU0xxMUtnVTh1RGYweGZJb2VucndWYXU2eTlZOHpyTWJJb28w?=
 =?utf-8?B?RGc3NzR0OWo2V3NHc3pOci9PekdobkdSSTVodmRtK0pFVkFFVWRiYjlPd1U0?=
 =?utf-8?B?UkhJbzFxRmltQ3l3d1JTdXdsaGljb0l0MHVBYm9yY1QxY3NXWGVFM3paZ1ZU?=
 =?utf-8?B?eXRiWlptTVpIdk9GVjYvU1Fka1JGUDVJUGZDTWRlYVVlN3lUT3hUS1dJczM3?=
 =?utf-8?B?K1dWbDk3aEp1SGppMk1lZzczWXR0dnlEVzk0RlY1RE1Wa0hFZDN5UUtpR1hP?=
 =?utf-8?B?ckVBbzVFWWxLa0VTem9pbmNRajlsWWVZajEvNkthZFY0TGZvV3Zkcld0d2tJ?=
 =?utf-8?B?Rit2ck9OR0pZWVQ3b0hXeFV0VEVwM3hvNFY1Zk1kRURVQWRCSjRxWTRjdzRy?=
 =?utf-8?B?ZlhPZGo3RUUyazVVKzFpRkxJMFJFUHB3RzV2WEJEeENyaFNTWFJnbzBOVnM2?=
 =?utf-8?B?Q2o3R3YxUkZRSkFERmN1TW1JdXpveHFidXBQTWxnam9IZHAwWlZYK3hwcE11?=
 =?utf-8?B?UXVmSDF6WlVFbExnM3l0OE9BbnBTQWxJUU11UzFZWFRxNnZHR2ZDcmR2TnB2?=
 =?utf-8?B?U0d5USs4cXovT0xwVEErYnoxaVdFazNQdzcwQkFpRTEvWEV3ZzQyMGE3U05N?=
 =?utf-8?Q?FheAvB8KWyCVqvvA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c91296-d62f-4b61-6c93-08da3f089bc2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 11:12:23.3094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tfwr3fYZuh+tbeBpJzMNMUOmGmTleqFLZSW2Ni3hDecWMqVc5Oj3xu8wpGTG+lXLc8gkuXvoPhHeMNGI3K8rFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6527

Add support for enabling Bus Lock Detection on Intel systems.  Such
detection works by triggering a vmexit, which ought to be enough of a
pause to prevent a guest from abusing of the Bus Lock.

Add an extra Xen perf counter to track the number of Bus Locks detected.
This is done because Bus Locks can also be reported by setting the bit
26 in the exit reason field, so also account for those.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Adjust commit message.
---
 xen/arch/x86/hvm/vmx/vmcs.c             |  4 +++-
 xen/arch/x86/hvm/vmx/vmx.c              | 18 ++++++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  3 +++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  2 ++
 xen/arch/x86/include/asm/perfc_defn.h   |  4 +++-
 5 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 56fed2db03..d388e6729c 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -209,6 +209,7 @@ static void __init vmx_display_features(void)
     P(cpu_has_vmx_virt_exceptions, "Virtualisation Exceptions");
     P(cpu_has_vmx_pml, "Page Modification Logging");
     P(cpu_has_vmx_tsc_scaling, "TSC Scaling");
+    P(cpu_has_vmx_bus_lock_detection, "Bus Lock Detection");
 #undef P
 
     if ( !printed )
@@ -318,7 +319,8 @@ static int vmx_init_vmcs_config(bool bsp)
                SECONDARY_EXEC_ENABLE_VM_FUNCTIONS |
                SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS |
                SECONDARY_EXEC_XSAVES |
-               SECONDARY_EXEC_TSC_SCALING);
+               SECONDARY_EXEC_TSC_SCALING |
+               SECONDARY_EXEC_BUS_LOCK_DETECTION);
         if ( _vmx_misc_cap & VMX_MISC_VMWRITE_ALL )
             opt |= SECONDARY_EXEC_ENABLE_VMCS_SHADOWING;
         if ( opt_vpid_enabled )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index f08a00dcbb..476ab72463 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4065,6 +4065,16 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
 
     if ( unlikely(exit_reason & VMX_EXIT_REASONS_FAILED_VMENTRY) )
         return vmx_failed_vmentry(exit_reason, regs);
+    if ( unlikely(exit_reason & VMX_EXIT_REASONS_BUS_LOCK) )
+    {
+        /*
+         * Delivery of Bus Lock VM exit was pre-empted by a higher priority VM
+         * exit.
+         */
+        exit_reason &= ~VMX_EXIT_REASONS_BUS_LOCK;
+        if ( exit_reason != EXIT_REASON_BUS_LOCK )
+            perfc_incr(buslock);
+    }
 
     if ( v->arch.hvm.vmx.vmx_realmode )
     {
@@ -4561,6 +4571,14 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         vmx_handle_descriptor_access(exit_reason);
         break;
 
+    case EXIT_REASON_BUS_LOCK:
+        perfc_incr(buslock);
+        /*
+         * Nothing to do: just taking a vmexit should be enough of a pause to
+         * prevent a VM from crippling the host with bus locks.
+         */
+        break;
+
     case EXIT_REASON_VMX_PREEMPTION_TIMER_EXPIRED:
     case EXIT_REASON_INVPCID:
     /* fall through */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 9119aa8536..5d3edc1642 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -266,6 +266,7 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS   0x00040000
 #define SECONDARY_EXEC_XSAVES                   0x00100000
 #define SECONDARY_EXEC_TSC_SCALING              0x02000000
+#define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
 extern u32 vmx_secondary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
@@ -345,6 +346,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_XSAVES)
 #define cpu_has_vmx_tsc_scaling \
     (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
+#define cpu_has_vmx_bus_lock_detection \
+    (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
 
 #define VMCS_RID_TYPE_MASK              0x80000000
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 8eedf59155..03995701a1 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -159,6 +159,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
  * Exit Reasons
  */
 #define VMX_EXIT_REASONS_FAILED_VMENTRY 0x80000000
+#define VMX_EXIT_REASONS_BUS_LOCK       (1u << 26)
 
 #define EXIT_REASON_EXCEPTION_NMI       0
 #define EXIT_REASON_EXTERNAL_INTERRUPT  1
@@ -219,6 +220,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define EXIT_REASON_PML_FULL            62
 #define EXIT_REASON_XSAVES              63
 #define EXIT_REASON_XRSTORS             64
+#define EXIT_REASON_BUS_LOCK            74
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
index b07063b7d8..d6eb661940 100644
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 65
+#define VMX_PERF_EXIT_REASON_SIZE 75
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
@@ -125,4 +125,6 @@ PERFCOUNTER(realmode_exits,      "vmexits from realmode")
 
 PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
 
+PERFCOUNTER(buslock, "Bus Locks Detected")
+
 /*#endif*/ /* __XEN_PERFC_DEFN_H__ */
-- 
2.36.0


