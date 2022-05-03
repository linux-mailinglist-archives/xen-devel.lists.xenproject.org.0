Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF43517FCC
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 10:35:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319257.539434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlo03-0001CB-FQ; Tue, 03 May 2022 08:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319257.539434; Tue, 03 May 2022 08:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlo03-00019n-BE; Tue, 03 May 2022 08:35:15 +0000
Received: by outflank-mailman (input) for mailman id 319257;
 Tue, 03 May 2022 08:35:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlo01-0000uC-LQ
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 08:35:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2a0101e-cabb-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 10:35:12 +0200 (CEST)
Received: from mail-bn1nam07lp2044.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 04:35:09 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BL0PR03MB4179.namprd03.prod.outlook.com (2603:10b6:208:65::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 08:35:06 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 08:35:06 +0000
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
X-Inumbo-ID: f2a0101e-cabb-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651566912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=N4cvQrD7q6iSxR2xJlRcM5GybB6EIiLfDx9loSHgwro=;
  b=etTOs2eJK3Uamrv5XRJNqVs/QPjwMXE2jtkjjul9f8EETFl5L6DuNYxb
   UertGUvJNzKuwpELwhxMRrT57fkbkiuD/fqqqGwpD3pFicQkJW286gxcp
   ESnOsLfG47Hbm7Ou5FRBiKY0QNi8ViIqmRWTze0J/SrDSAZ/yQuPKcDQP
   8=;
X-IronPort-RemoteIP: 104.47.51.44
X-IronPort-MID: 70447534
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2r5jeK+nIr2RH1b8jvikDrUD9X+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 zcYDz2OM/3eYWr8Ko0lPN/joBlU7JKHy4NnSlY/qH88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IDiW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnY7hdSx3MrbAobgMcjJVMzoiL7FaqJaSdBBTseTLp6HHW13F5q00SWsQZMgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvyMuYMwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgK2EE9w/O+cLb5UDYxjNI9af/EeHNQdyOQsl2xnSTq
 X3ZqjGR7hYycYb3JSC+2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRiESzRtZeI
 Ew84Tc1oO4580nDZsb5dw21pjiDpBF0ZjZLO+gz6QXIwKyN5Q+cXjcAVmQZNIBgs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZo8L/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:Dzl4960o4TV9GPgn+1OThgqjBSByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjjfZq6z+8O3WBxB8bYYOCCggeVxe5ZnO/fKlHbexEWs9QtrJ
 uIEJIOd+EYc2IK6voSiTPQe7hA/DDEytHRuQ639QYQcegAUdAE0+4WMHf5LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+FZgNYtvpYfHHfVAlEii8Rl57HzzcZdI6EkOIjaLLy5MIw8zvUKA07fIJ6e
 b8uRVjxCQPR34=
X-IronPort-AV: E=Sophos;i="5.91,194,1647316800"; 
   d="scan'208";a="70447534"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzEPuG4kUhZRSVtA+I56MHTQNCqKp4AyYNG+GvTtQCuHOt32Bdx70MrRt7+RErXLDPxVnAJ8zN5KyRJmkm6hLtzRLULI682zWNjTOnvsYr4wNaDDvMF+JKpN1JNhjJoDCEVGLlkWl6MSaUh6WV8HY7Qje7mYCDH3nNX0gIVAbG+O4DxEFDcq3lJG7lH+hFE64GWawjlDIbIFa6hqVyYo5Un7998wswWeePqE+jnLxg17wsbwhn3yUdohVMVtqqJ4/kYvS/P+FcrWNu4euxjVWAlTDHRSVRhKN/vpM8ZW0G+qhWpvGRBNly5yTIGMj3BtTr8A1WgtkXPWxHduMB3ouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEj4Lts9xVDYbyObPHwpFNoKH7oU7x6POmGWZCD4/9I=;
 b=HhaBfFmqkx1Rja6ypUEEBKVIm73A/e85jFI17gfwTyrkcuEFY8B5sk9QNSkksDuFQBYainjnh7rjX3GSJ68QCI9YY6RLJOS4LXvYR0CL08HKY8rlYYIuBTmjKlyDxBcC/WArMqgVs5IHemmh30vazQwAKCHj05CPq18omRx8P4VdvDM/NR3BtJyBLgAI4cxpRHY5ugvuGamT8iACiubTAhpCoQ9WdoTE/pu//+cUI99bch/cB1PmHMx6byYFNMZmAW1cTRQEwiGdWXm/a+Icijdb8hLwc6j1Zu9/pGImNMtKViFMULvGUmixVX9fyBl4U1r3F18+h/HsSgIFwvrphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEj4Lts9xVDYbyObPHwpFNoKH7oU7x6POmGWZCD4/9I=;
 b=jQ5k5x51t2L2+aSMpp+PufvKYO0XAhBgKK/IzNK5mt/IxejNG7ZaKzhF9tlPuIxXRj0WOxdVdX57u1vRZ+Io1IW1+fiatwbqCj3pULGy8MyPiZvTQvi+S0YWT1f//keQBMzEtTM75UlgA8aRVj+hW0eU5QQJC0O6zd+87l7nSgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
Date: Tue,  3 May 2022 10:26:48 +0200
Message-Id: <20220503082650.23049-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503082650.23049-1-roger.pau@citrix.com>
References: <20220503082650.23049-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b304461-d30f-4d74-a33a-08da2cdfd2fc
X-MS-TrafficTypeDiagnostic: BL0PR03MB4179:EE_
X-Microsoft-Antispam-PRVS:
	<BL0PR03MB4179280287702F313FF34F848FC09@BL0PR03MB4179.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DQAwerdlbzYwxsxD4qVImgqZiPUVascdBDMmKe+GbGdiFI+KKlMjbHTzC/FNIWJIAtUDVa1BEbv8X7ARxY3AdnLHXU0OD4KgHV70St6vFAJOqaO8CldN0lcT9aI7f8pnMFZlF475nMXZlDgt2Ti15vJvLq3CNqAPW71G2BTBC/QpJW3VsVO48KqVq9N6WJ8+j6YJlSGP0saA3/ZEXktX9Zf5gPogWzTmAGLN5Xlfj+iSGQHInFrWXQItB/ygV49ny+OYqAibLHNibbuH8F9Cgnw1zAk45FHEg7K5sMf1g6d0D9qi9TOHE2LN+TFxSUjmYxuMePwhkyLCmZ/P6NuGWDzNmngUixSJ0qjxL9Tc8H9HgfLRre95+UQrW2kCWeBrcmvkuLKDdIJY79FWxx5OUPj3GdMmPfPXeWFO6dMgOeANyJ+ehYHDFJ9vU7u8URsHmM9oc2dRzIj2cGZAuDVbgX57OyW2+BoKaIZ2v8G1xQt0CASyLBxff2Wx1P2pZy1ezlA/mmVtPSzPKTtmz0dNKYVtczBnQf7meyf3WFl1/CznRR/RXFyP2q1UWPA2VsK7gu87Wkw6OYyCDMhFryJLBHtW0Y7yOLeNS13AIXUggv43cfGDVFGHpX4kFMC+FsgQkLTVzzXpFOUkaqcrt1dz8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6512007)(26005)(6506007)(2616005)(6916009)(54906003)(5660300002)(8936002)(83380400001)(186003)(2906002)(1076003)(66556008)(66476007)(86362001)(4326008)(36756003)(66946007)(8676002)(38100700002)(6486002)(508600001)(82960400001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU9pOWdYdWxtNE53Y1hMRll0d0hIV2REVWkxaHdZRnR1SkFjSUJhUnZTeHg5?=
 =?utf-8?B?aWQwZy91eVRBWmNaU3ZZK1hkSVBNSlhXQk9WdDRCMGc1c2tBaG5yMnRyaXBG?=
 =?utf-8?B?NGVWWWs2TlBDL1NjNE1kdUZ4ZUpHZEloeHQ4ZUxjZ201UE9EdEZ5MnFxRlFx?=
 =?utf-8?B?TVJMMzFOMVU3Zm9oT2Z3NVg3N0N4dEhrS0s5UW1oTGZTbk83dmRyRlJTSVpo?=
 =?utf-8?B?dFpJK01kMUFJZFlLMmFjQmlRQkVuakNPSWZtNGdOMkJJcnJXOUorbTMrdGRJ?=
 =?utf-8?B?OCtGZUFCbVNDZUxCK2RIK1VJMGw5V3dscFVTdFhQQjVya1lEOEpWeXpyYTgr?=
 =?utf-8?B?OVVFcGoySlZKMFEwWERhUTZzVHNJOVA0a3FQaUovVVBPaFlEZlFhOU1HcGcv?=
 =?utf-8?B?d2JwaGxnQWJNRE1HQlo2UXAvS1VabWFQL1BJZWlibXc4YXNGTHVPYi9MeEJS?=
 =?utf-8?B?UjczUGxXTHFvTlY4UXI0eWF4YVlWZE5Kakkwd0dpSlF1Z1hYa2JkU0liSWx1?=
 =?utf-8?B?K3VEK2dTZmFuZFB6dGxpODEwN1VJZG90NFV4cDFqcFNSMlFNOFdjWENnSDV6?=
 =?utf-8?B?ZkJMMjBhTnRjOWVtaWNzYU1VNi9RUmQ0VUoxdVJJbWZhYTJuc0RZbHY4S2VC?=
 =?utf-8?B?MWVpbGJ0L0lYMnpBd3lQWXVFLy9keklHdGJRZm5PU0l5d1NDMEdZUjYyNEVp?=
 =?utf-8?B?SWZWN0RaaWpVU29pYmlMMlpxdlRnT2ZoVDkxcnJHRUgrSkR3clQ1VzdPNU5t?=
 =?utf-8?B?QWd5N2hsK0ZiOFhiWXZSaDhqSUdROFNrZG9aeXliTGRCN3piMGx2MFErbzVn?=
 =?utf-8?B?M0U1QjNaOStqdzRhN202YTllWkgrUDFtbEdNY0ZKS2FnQzN6N2NFT2cyU1Mz?=
 =?utf-8?B?WGZpMHRYZlBiZlpRSkNUc3dKRHd5cjA2a0tUYkdVZ0dsdTBmNlhIak9CMTBa?=
 =?utf-8?B?T212STFVYmhTYXBSNE1pNGIycnFsc3R1emV6ajdQcDg4V1pZbklyVXllRjdN?=
 =?utf-8?B?MnVJZkpEVmEyM1FZRS9ibDJyZGMwaXlkbUUvVG5ZckZJcVpJRDdZMUF6NWMy?=
 =?utf-8?B?SmFrTTNsaFpvU1VQSktvdGlNRGo0RVRtUGo2RGsvVTFPRlhHcysvaTdTUGc4?=
 =?utf-8?B?R3dabTREQlNyUGluNmtYc0UwbWdjdlo5RXlqck5oU1dCZno3bFFtaWI4ZVUv?=
 =?utf-8?B?LzNsSW1oUDJmZzZsWUViTzJjdVlUZFlYVnpKeG94SUVQY2RuTUpwSFpIMXQ2?=
 =?utf-8?B?NmhTN0lNWDlCOFlTdDQvaC9JU0lVaHB1YVY4S200SkViYVRHTzJmRmxuNGts?=
 =?utf-8?B?WVllUGthOVNleU11QXhQQlAxYno1V2l2MXBuUUxKam5NdEp3QkViZFdwd3ox?=
 =?utf-8?B?aGhSVEJ3WjdSckpNeDdIZjU4WDhHK3hNb25ieUt5MHkzL00yZEJtY3BtanVY?=
 =?utf-8?B?czQ5cldqbzNxSkM0NmJvaTdDdEdmSnRweUM1VTQyUUcvZ2hGWWZ3YnlHVXpt?=
 =?utf-8?B?Z2lPMDZYUElJUFJsV2R4TE01NXpycjdrQkFXKzdXYXRWdXJ6aTJHbGFvazgr?=
 =?utf-8?B?Z0lsVmY1bW1JVWtwUUdNeGlpMTd3L0lGaTcrcXRUU3JkLzFFaVlLdEp4WGd1?=
 =?utf-8?B?K2picnpJQjJCV0VlMVEwdUJZMERzSWFLQ3JsS3U4aUVWMlY5YWxVdThpejZi?=
 =?utf-8?B?K24yYjNuaTg0b2Fka3hPZWd3czJDZnBPSTVHZFFmRmRBK2xEZUlrT2ZMSzdQ?=
 =?utf-8?B?VzE1SWYxeGlGZnptTUxTRzg3ZTYyUnZ2TnNDOEVpekxUVGxPbzY2YVlISys1?=
 =?utf-8?B?OElHdml2d2kwZVJWLzA1a1N6V2U4UlVQY2dwM2xWNWRFRXdmOEJZNlBzcFNu?=
 =?utf-8?B?dGdJbE5wNkg3VDNZZ2RvUlRaZk1BaUI0dUxKczYyNW50RWR4YWYzMG5xM2lx?=
 =?utf-8?B?R1RhbFdKWGpoNnBibXRZQ0JlaU05Sno5bks3aGNVbEoxZVN6T0JMZjhMNFZW?=
 =?utf-8?B?cEVVTDFnby9BY1JOYmlseHFTcG1kbzhYZXpFb1VKQ3JiTTdSOVVzek9acGV3?=
 =?utf-8?B?L2NXVDMzMjBOZFpVVFVZVldpMU1qSTNDdGQ5cnA2eTZhMy9wbmNPWGJrVnJx?=
 =?utf-8?B?WWYrcWQxbVFXVXh6ZU9lc2JHNWVzL1BLR3JveFNOMFZlWkFNUy85UDlEb004?=
 =?utf-8?B?OVNNcHpwc0djWGg5VGRHdVJNTWZwbkovR01pM2tKTkRuMms1QlQvSXFaTUhG?=
 =?utf-8?B?OVRNMld3R3FmcXY0emp1YVVZTXRMN0pnUE5zQ0pXdW5kcWw4Sm1UbmpOTmgw?=
 =?utf-8?B?ZEUxNndTNHFzMk10YVNJektOeEZscG5QMUpmam9JSElxLzJvSkFqTzhMa3N4?=
 =?utf-8?Q?gecAAWL32q0T3h+I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b304461-d30f-4d74-a33a-08da2cdfd2fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 08:35:05.9978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyTSKI+3aXYwS17XoOKoohzhacCqhe7amolsL2b5QkfJy3ypujt3L2PPAQay/251tUITG86xnFT6xfu0q8hz0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4179

Use the logic to set shadow SPEC_CTRL values in order to implement
support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
guests. This includes using the spec_ctrl vCPU MSR variable to store
the guest set value of VIRT_SPEC_CTRL.SSBD, which will be OR'ed with
any SPEC_CTRL values being set by the guest.

On hardware having SPEC_CTRL VIRT_SPEC_CTRL will not be offered by
default to guests. VIRT_SPEC_CTRL will only be part of the max CPUID
policy so it can be enabled for compatibility purposes.

Use '!' to annotate the feature in order to express that the presence
of the bit is not directly tied to its value in the host policy.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Use '!' to annotate the feature.

Changes since v2:
 - Reword reasoning for using '!s'.
 - Trim comment about only setting SSBD bit in spec_ctrl.raw.

Changes since v1:
 - Only expose VIRT_SSBD if AMD_SSBD is available on the host.
 - Revert change to msr-sc= command line option documentation.
 - Only set or clear the SSBD bit of spec_ctrl.
---
 xen/arch/x86/cpuid.c                        |  7 +++++++
 xen/arch/x86/hvm/hvm.c                      |  1 +
 xen/arch/x86/include/asm/msr.h              |  4 ++++
 xen/arch/x86/msr.c                          | 18 ++++++++++++++++++
 xen/arch/x86/spec_ctrl.c                    |  3 ++-
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 6 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 7e0b395698..979dcf8164 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -550,6 +550,13 @@ static void __init calculate_hvm_max_policy(void)
         __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
         __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
     }
+    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
+        /*
+         * If SPEC_CTRL.SSBD is available VIRT_SPEC_CTRL.SSBD can be exposed
+         * and implemented using the former. Expose in the max policy only as
+         * the preference is for guests to use SPEC_CTRL.SSBD if available.
+         */
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
      * With VT-x, some features are only supported by Xen if dedicated
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5b16fb4cd8..db8f95ef7c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1334,6 +1334,7 @@ static const uint32_t msrs_to_send[] = {
     MSR_INTEL_MISC_FEATURES_ENABLES,
     MSR_IA32_BNDCFGS,
     MSR_IA32_XSS,
+    MSR_VIRT_SPEC_CTRL,
     MSR_AMD64_DR0_ADDRESS_MASK,
     MSR_AMD64_DR1_ADDRESS_MASK,
     MSR_AMD64_DR2_ADDRESS_MASK,
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index ce4fe51afe..ab6fbb5051 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -291,6 +291,7 @@ struct vcpu_msrs
 {
     /*
      * 0x00000048 - MSR_SPEC_CTRL
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if X86_FEATURE_AMD_SSBD)
      *
      * For PV guests, this holds the guest kernel value.  It is accessed on
      * every entry/exit path.
@@ -306,6 +307,9 @@ struct vcpu_msrs
      * We must clear/restore Xen's value before/after VMRUN to avoid unduly
      * influencing the guest.  In order to support "behind the guest's back"
      * protections, we load this value (commonly 0) before VMRUN.
+     *
+     * Once of such "behind the guest's back" usages is setting SPEC_CTRL.SSBD
+     * if the guest sets VIRT_SPEC_CTRL.SSBD.
      */
     struct {
         uint32_t raw;
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 6206529162..c9aabbafd7 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -383,6 +383,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
                ? K8_HWCR_TSC_FREQ_SEL : 0;
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        if ( !cp->extd.virt_ssbd )
+            goto gp_fault;
+
+        *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        break;
+
     case MSR_AMD64_DE_CFG:
         if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
@@ -668,6 +675,17 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             wrmsr_tsc_aux(val);
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        if ( !cp->extd.virt_ssbd )
+            goto gp_fault;
+
+        /* Only supports SSBD bit, the rest are ignored. */
+        if ( val & SPEC_CTRL_SSBD )
+            msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+        else
+            msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+        break;
+
     case MSR_AMD64_DE_CFG:
         /*
          * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 1408e4c7ab..f338bfe292 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -402,12 +402,13 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
      * mitigation support for guests.
      */
 #ifdef CONFIG_HVM
-    printk("  Support for HVM VMs:%s%s%s%s%s\n",
+    printk("  Support for HVM VMs:%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
             opt_eager_fpu)                           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
+           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 9cee4b439e..5aa3c82fc6 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -265,7 +265,7 @@ XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection
 XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
 XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
-XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
+XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!  MSR_VIRT_SPEC_CTRL.SSBD */
 XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
 XEN_CPUFEATURE(PSFD,          8*32+28) /*S  MSR_SPEC_CTRL.PSFD */
 
-- 
2.35.1


