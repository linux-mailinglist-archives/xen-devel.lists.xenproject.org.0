Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E018F66018F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472630.732928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDn8m-0005if-A0; Fri, 06 Jan 2023 13:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472630.732928; Fri, 06 Jan 2023 13:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDn8m-0005fO-51; Fri, 06 Jan 2023 13:52:12 +0000
Received: by outflank-mailman (input) for mailman id 472630;
 Fri, 06 Jan 2023 13:52:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDn8k-0005ey-4y
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:52:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d53b167-8dc9-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 14:52:07 +0100 (CET)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jan 2023 08:52:02 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5427.namprd03.prod.outlook.com (2603:10b6:208:29d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 13:52:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 13:52:00 +0000
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
X-Inumbo-ID: 4d53b167-8dc9-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673013127;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=64DRU3wTSykqmUOKNnDmouyLt/Ao2F1H8xBMh1AeVhM=;
  b=H4BTQiDDyv3aLW5LuMvFxQ2MVek0EZQ1PTpwF//naWlLiKcfvrTUIZcg
   TDP9xFJ4k4U+KyVqpZb5AXogeCrYWLozvEL6kHqLyZk3bEwRzdo7eGGZW
   +oYPfgQ9u09Dy2Uu8n3gTbcJBDzksBVpcuXt04zBLqGm/NvWYp7AITYoY
   M=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 91892705
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:afk756p04iu/9DFQRcJVb/gVVBJeBmJCZRIvgKrLsJaIsI4StFCzt
 garIBmBbPqLajekf95/bdy08k1T7MDRm9BrTgA/rX1mFH4b9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5weHzydNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAwBXEGyqO+k/LeiSMxwguYOF8vJH5xK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYWJEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpr6472gLLmwT/DjVODmmV++Djs3TmUtFSN
 28VuTd3pKk9oRnDot7VGkfQTGS/lhkYVtlLEux86xyXzaHU4AGxCW0NTzoHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdMT7xy
 jaOsSM3r68Sk8kQ1qOwu1vAhlqErJ/DRB84/QXTU2es6Ct2YYekY8qj7l2zxf9ELZ2FR1ib+
 nYeks6V7fsmEp2G0ieKRY0lF7av4fGHPDTCgEVHEJwo9jDr8HmmFahS6jxjIEZiMu4fZCTkJ
 kTUvGt55oJXPXasRb96ZcS2EctC5bfkPcToULbTdNUmSpN4bgOA8QllbFSc2G2rm08p+ZzTI
 r+eeMeoSHofV6JuyWPsQ/9HiOB3gCcj2WnUWJb3iQy91qaTb2KUTrFDN0aSauc+7+WPpwC9H
 8tjCvZmAi53CIXWChQ7O6ZPRbzWBRDX3azLlvE=
IronPort-HdrOrdr: A9a23:JoGSAa52kLtOSyjfYgPXwPLXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssQgb6La90cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZslndMhy72ulB1b
 pxN4hSYeeAamSSVPyKgjVQxexQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; 
   d="scan'208";a="91892705"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRymUHbqmOzUyZsaDr7P2CPCuPK4taQQDR9pxWekOWAlxDxZIrQZTGXXKFVv2NQaMm2r09Di1uFghCsrC5j7NF5SsFcYw66UkRRf0SgAn9Cqd5z1X/APmrd8j62c9FpjDIP3Bb6Yu+ZkoMrnoUgCzQN9Z1bkVIXoIs6nMoft2fIclP0ndI2aIt3WZmHhOMVttoRMl90ZCX3ghl781QlKXaeFck3Rcj0miUMk7qkQXsu0nfD26JMVe1vgr/JYLQGtLLGY//P9MPbAdyTZ1/4/uSnHGvV3BeNgw93SB7Tua3YLUPMntN5eXbaO+nYLvcDEExB2EwmD5/cRWgxBboC2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64DRU3wTSykqmUOKNnDmouyLt/Ao2F1H8xBMh1AeVhM=;
 b=hFT/xRAQ6rJusYeiexW8nsWlPCtygaEONLxRuYa7gsWA+ZM30pFaRO8CSLRgreeGhISKA40WK9Lxrh9xNVhSr+313Qqi4u/b/xyqzKy4cKLKokxS+ar3q/Nvfrez6/QrqYf3zPe4xCs6J8xTn1pf6EfqlL7lx6GnJe22df1N0RZdsQdTCIDn6CKstmKkv+dVff7qEmB6Tjc0bd+K67fmx2V5IrhZgQtrfERMwJAepDa0fQhLbJX3CfaSsoy6JE8K5HL5h4lG5g2OjNU1DZxesOmjrRc+c5VGPGkZ+vS6LZaHI50Wes7eTIvjBZ7E9/geHuu3HrOUyIq5m7vMsuvhlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64DRU3wTSykqmUOKNnDmouyLt/Ao2F1H8xBMh1AeVhM=;
 b=mEZLOC8Zl43mFxkajabciUrLkLU2qUIOWY9bt++BG2sXShjorDsuIYi0tNzSx2cavx/9tIg5hPqbYcI4wfJTNomZ1vZpRZDaAqwy/2q40wGFb83hbXQ+540f4Xok0ZkZqnin4AgXk71viDlWhfZcCXO22CfvrtrddSBSlvOFUDg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
	George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: Re: [PATCH v1 0/8] Basic early_printk and smoke test implementation
Thread-Topic: [PATCH v1 0/8] Basic early_printk and smoke test implementation
Thread-Index: AQHZIdDY/WFtbXZWa0GsMaL1YLWWe66RaHaA
Date: Fri, 6 Jan 2023 13:51:59 +0000
Message-ID: <299d913c-8095-ad90-ea3b-d46ef74d4fdc@citrix.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
In-Reply-To: <cover.1673009740.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BLAPR03MB5427:EE_
x-ms-office365-filtering-correlation-id: c0626e55-cf4e-4baa-e38c-08daefed2ee5
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ali680qyf8HTQfh+9d+wzx0jih4Ud9sdaSAo2gULwwwAPsJzaHmdh/97Cxe7cWcI2o1YzqtADx7PqZ0RjPugtBSHwnCJjRnobFS57eeYohcFM8QZtDrifmvF4QEsCfmEVRCkPnJ5t28YKrWxUj95mM1LnjlvXKq8Kf3hhID6bhwMDeYj5GQ8TA/G34tSfdr1C2EXhw0MSuKxFfalGeqf0QNVx0TDygX33lGqoyTC7yD9conXgpvNaOQPRqsv0OF1A32LXbzRXlsRUHQ9HRdzmWsCrZYOdnKBMyMSIhVjoSuejRh7ssBiGwEeCjTidzbzDa05nLhpdHnO+dLuRZeVNxKs/0lZ0Wd8MY5eTdhlhrQ5R+r5N80g+55U4KxPzx7h09cEdGtPdGStaL65pgyL5ZEM8R/ZHPL+l1U3YYA5LqUxJqoDNQkKjnvqXmk8Na3TRMRtcDgEks69tz4OSOQa91i6HScXremc0tIsIKba4uXHIo+aOT7mMQJC/u8R5Z5kEBDQzFc3/puZNVak5jMgBJqLPWw5bAg2cFMUtC3GW/dYbtkcdD1ITgCpEh1+m54wJRgZ5dAeu768/oNTeJ6DmkH0AmXMltX7hB7cp7a+195o918GA4/Y3pbr4mLRwK8tR7CVHgh+j2kAdHHrfGHmP3lTQG9FYuODHOLT+NLts5ZW8wldn3NgQvpBVBDF0BtaNIY3r3YjKgKCg5aL3FGRH1o3i/QS6ELdnrIe30YkCO0V94tiZShXeAf7hjvpCqRLpmNcjvALCr8zSVChMpsjrg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199015)(5660300002)(41300700001)(7416002)(8936002)(316002)(91956017)(8676002)(4326008)(66946007)(54906003)(2906002)(110136005)(31686004)(53546011)(66556008)(6486002)(71200400001)(6506007)(66446008)(478600001)(76116006)(66476007)(64756008)(2616005)(86362001)(31696002)(186003)(6512007)(26005)(122000001)(83380400001)(82960400001)(38100700002)(36756003)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmFHRVpMOFZHazh5aDBwaTZQYzlBZzhFa1NKcW9rcWJSK0JQMmhrOXQ3V2gz?=
 =?utf-8?B?NUs2WjI2OXMzbTV4RVo0bnYxREtyZlRtbEZ1V2tWV0xCKzRXdnhPOUhpcHRm?=
 =?utf-8?B?cld3Zm1yMitiU1BMdW5yV1prMU50L1hUT1dTbEl2WTlQMmg2NWEzTEhTS2tm?=
 =?utf-8?B?UWdJOVBlYUx4bU9aS3l2dU1QY2h0L0VzbWcvcExJcVAzK2tJTjZKQ1Bpd2J3?=
 =?utf-8?B?d2EvR3AxL0UwRlhyajNDTktCb3NFSm56b1RXa2g0NThTaE1PUTJwdmJUOUEr?=
 =?utf-8?B?anhSb1JUblFIM2FyZkdEb3F0ZlUzTnhnT2QzazNhRjBQRkRIT0JnSHYwbVJL?=
 =?utf-8?B?T1RZL210N1JMdkhqdkdsbjRWR0NTdFdhQTRpNUZiTU52ZklnVW9iZ3F1a0pE?=
 =?utf-8?B?dXkxUDZLYkI5WEpKMzZvcE9EUiszTkVwajRIZVRZU2FEZjEwQUhmWWtDYWU3?=
 =?utf-8?B?d01mZ0dUOElOOGYxT0tNTkdybUI1a0JVR3dPQkpKYzlXbml0eCtsYzJobDRF?=
 =?utf-8?B?eHZNZDFCQm5MYXhRRlM5cmdwZFpLWG1qN3RwR21tcW9yR3FicXhTYXBPNW0v?=
 =?utf-8?B?ZzlneUFKc0FibkRJRWM5djdjcUpYcUJKY1RWM2ZOMHlzMm9TR05SZ216Uys0?=
 =?utf-8?B?V2tNeFFpNnhDL2MvVTNqV0pPMHMxT2lvWWw5bkphMzU3RGhyRHpKbFgxbzIy?=
 =?utf-8?B?bWo3RFpoK0R0WEtBV21DZDdJYk84WTRvZFFqVFhYSThCYUlOMFp0V1d5WTZS?=
 =?utf-8?B?aFJSS2M5Si9XVDhUeDhHc3hYNlRQdEN0VkdQSmJsMnMwOEFZdEIvUkNDdVY1?=
 =?utf-8?B?MDB3WXlZNGFsMU1hZGFCaFJyU0xvaEZOUVhIOTFwT0ppT1Y4Slc4clQvSUhi?=
 =?utf-8?B?U0VhTitKTitaVzJyeXVvNXA5Z0pVWUFmOER1U21weFl2WEM1OU1sSGdXVzMw?=
 =?utf-8?B?MlYzSm8wWnBueTVRdmx2M2hjbVVhek9YZmxUdVBxVFFGdERtNmNJNDJ1UTZt?=
 =?utf-8?B?dDZhdnJkaUI2ZHlkdE1OZFd0dktsRHQxMHBJbDVrUXQ5U3lkTm1tb1FkNnFk?=
 =?utf-8?B?dVA1NWNkUE9ndXhGelRXS05qdnRjaFViUlpFRXBoT1VqZ2tFOWthZVoxRzhP?=
 =?utf-8?B?encwUlRhZXlhNnRXcTF2ZDdvWk92QTc0Uld5MFFacnU0RjYyd1A3ZEo0Y2xw?=
 =?utf-8?B?Tm9Sdk9qL0l1Q3ZuNHdEeFBrSFNsRE9VREVnM3hXbFd5SDkrL3BLYnV2bGR4?=
 =?utf-8?B?MU9VSk9Kc2ZKYkdrSmY4dTBPZi85TDJRalZ1Tnhrc1k3SDg3VFJaZDFaUFhQ?=
 =?utf-8?B?V0NBT0dzLzZZdkZRdVZ6Ukt6dVhyT3BMT2JxeURTZHdqQnpReDR1YU10TFpC?=
 =?utf-8?B?VGJwN3lIM1EwVjJ6UkNuOU0vYTdVTjU5UTc5d0pYZXRnblRONExrL0srREc1?=
 =?utf-8?B?VUtVN0NwbUhhdmZCSkc3QjYxSzYvVDdoMlNqalMrK1k2MHUrbDBtWGUvTTFk?=
 =?utf-8?B?azdQQlAxZnBnVGg4djlSSDZFVXlnWjltbmR5cGl6WDU5MjhoNW55VmJEbUhN?=
 =?utf-8?B?RFJldCttRVlBNjhHb2g5cjRnbHVqTEM3ZiszbkFHWjE2OTVUbGdISnhLem96?=
 =?utf-8?B?dG04a0Y4WDhyQ09jdWVCRWt1WDNKclVjV3k2eFlGamdCUU9pSDNvQ3pKL3Iv?=
 =?utf-8?B?eHpqam1xc2ZldHFBSk9IU1YvY2dxOHRMMFlSV01GMUcrZnZvYUlPckJnaTJY?=
 =?utf-8?B?RkhTUS9uRFlHRklmVGkrM292d0E0QkNtaG8rTzNOMGpqd0VTV1pXbUhSaito?=
 =?utf-8?B?RisvZGVCRGdQRjQvb1A3elZOaVlicnc4Y0hBS0JLcW00dU1MODRUSlJKamYr?=
 =?utf-8?B?eW5MWjdqUkhBTmdBeUROeHZUdmNoUTlVOHRldjRReERSUVQ1NHlHK2cxVTRm?=
 =?utf-8?B?cHVtaXR2YlZWM2ZPQ3UwSFdBc052RWJSWVdTVk11Q3pLQVZWWVVkYWFKZmtO?=
 =?utf-8?B?VzBJTU5vR2Y4RjBZSDFCRUhzZDIvVC9VQUJOdEJNZHJOQm5mSGhFWEo0SHV0?=
 =?utf-8?B?YnVQeDBqU09WQWFTd2FkZS93dXVqZWNtYVF2eUVjKy91TUFpblRSc014blgv?=
 =?utf-8?B?eENTRjZieWxwL0JZaUNyYzcyRWRhOTVHWG5ZcU5jVUlHbTFsNW9nQ3B5WHFW?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B46A8CDEAD330428C214F13784C08DC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?U2hyS0ZibGdtR3ZiZ3ZzczdrSEphQXI1bHRxL2hrbVdEMlFaeE1DSGNPNjdJ?=
 =?utf-8?B?RENNWjZMZ045ZUtvcE93QmJ2WDBpRWhwWTYyVEtxMjJLTWNKWnhJOUtFR2xQ?=
 =?utf-8?B?K3R0eGMvU2J2bzU0alNDYlFoUk11bDhRWjE0Z3NkY2hYVjFHcFhlYWhZeStZ?=
 =?utf-8?B?RERqaUNud0VYQkxVemhNbHB3NldTQkZURm56Nm1tWHY1M2lZQmIrV3Nvb2V6?=
 =?utf-8?B?ZjhyY0J6VEw0dFp2RVBNQVkwTnZveCtRRHZDcXNkM1c3Q3ZrZkJ6ZDRDRDQ5?=
 =?utf-8?B?cUpKMkx6SWtqRUJnRk41SGowWklPUjBVY2hSY3YvYUYyYkM0RFR4Z1J1RWRR?=
 =?utf-8?B?S2pFbG9HT3ltWTZKR0xKc1VqVks1QTZpckdwQ0RUeXdkdUp0UXVBS0ZBVkJP?=
 =?utf-8?B?d2M3MkxMdkRlV29NODhnQVdLeGJGVDVJTzZmbGxkRG1WcnArY3VxUjlrdHBz?=
 =?utf-8?B?aUFXclVMSFZtOGtiQ1NzdFVHWGxtYzkwdHlsVWRyUlpPVVNWcmdXdjVTVHFL?=
 =?utf-8?B?bXpSSUJUaURmTTh6ZUZLUHoyekYxTVZUM1ZnV2l4K2NHVXJkOHd0Nk5WT2pX?=
 =?utf-8?B?b0RORWhGWFhXT21yZFFQVEMzc2hNamMyZmJ6c0JUcUNHWWJXeXFLYkxodEJE?=
 =?utf-8?B?RU1GVGdZdDRsaStxdzZvZ1VvQzNRN0tvbXl4NzM4ckM3TUM0b3JUTHdnY2hG?=
 =?utf-8?B?MXZuWkg2ZG1CakdndDBxTEZVWmtZdFJ0NXQxN25qbUhwVThiYXhycXBGWUdQ?=
 =?utf-8?B?QVdyMUlVK2g0VU0wdjB5c3Frdk9vMHFMbWhlMzBYWUVUa1VkUDlucW1OK2dv?=
 =?utf-8?B?bjZQY0cxbFVaYVF4TmpxTm9rdlovVmttUjIzODFQSnBOZUR5NzhkVjlOZXJP?=
 =?utf-8?B?emp5T1lmWHNLaDgzaWVKbFgzaWEyVlNyNnJPMzRKbmN4WE5EeUswZUt5YXlL?=
 =?utf-8?B?VTUwRXpTNjljQWlaa2k3TUY5UVNuVmtkbHg2bU0rbWhVS0RtbnBoY201YkRa?=
 =?utf-8?B?dDQ3dnQvQ3hpV2FCY1k1WDZuTjNwTWxKbzFsWmU2TUI4OVMyb3ZRbjQvWkhU?=
 =?utf-8?B?MFNIazJBMFVvZjJwQWQ1OFpSWGhSMGRiUm42MFZ2QkgvT0hMb3FjNkhBTk9w?=
 =?utf-8?B?cHpoMXk2TzM0MC9MaHRUU3FFemJBT2NYWm9RWEdFWW1SU2x6NWsvRmRKT3BI?=
 =?utf-8?B?VHhjUXdXdDNaQk5jMEREUGtxRlIwclZkUHNZaEJ4c1NocHBRaldZRGJxdk9r?=
 =?utf-8?B?clprdCtjZGVsUkF2aGRQd3dIY2JMYURVOWlwakZ4Qk5DcmZUNnMwL3ZQY1hp?=
 =?utf-8?B?ZXp5YzdJUHNPSWZzakhjcEZ6ZkFjazNGd1ptREpOeTVpMlJQZm5QRWVTRFlk?=
 =?utf-8?Q?tVAdcBw6gb0rZDsBXJRO8GZUFqKEZyek=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0626e55-cf4e-4baa-e38c-08daefed2ee5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 13:51:59.8827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MNIzf08frQaQSTI/ORu48GE5J8F0MxZWmG33bgc0xSvSsRG7fnx7zQL6tYYyF/CoRL3khzW1aFJJ7HVu5QHS00ElyqTxZFuUb1UbkpjRfSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5427

T24gMDYvMDEvMjAyMyAxOjE0IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBUaGUgcGF0
Y2ggc2VyaWVzIGludHJvZHVjZXMgdGhlIGZvbGxvd2luZzoNCj4gLSB0aGUgbWluaW1hbCBzZXQg
b2YgaGVhZGVycyBhbmQgY2hhbmdlcyBpbnNpZGUgdGhlbS4NCj4gLSBTQkkgKFJJU0MtViBTdXBl
cnZpc29yIEJpbmFyeSBJbnRlcmZhY2UpIHRoaW5ncyBuZWNlc3NhcnkgZm9yIGJhc2ljDQo+ICAg
ZWFybHlfcHJpbnRrIGltcGxlbWVudGF0aW9uLg0KPiAtIHRoaW5ncyBuZWVkZWQgdG8gc2V0IHVw
IHRoZSBzdGFjay4NCj4gLSBlYXJseV9wcmludGsoKSBmdW5jdGlvbiB0byBwcmludCBvbmx5IHN0
cmluZ3MuDQo+IC0gUklTQy1WIHNtb2tlIHRlc3Qgd2hpY2ggY2hlY2tzIGlmICAiSGVsbG8gZnJv
bSBDIGVudiIgbWVzc2FnZSBpcw0KPiAgIHByZXNlbnQgaW4gc2VyaWFsLnRtcA0KPg0KPiBPbGVr
c2lpIEt1cm9jaGtvICg4KToNCj4gICB4ZW4vcmlzY3Y6IGludHJvZHVjZSBkdW1teSBhc20vaW5p
dC5oDQo+ICAgeGVuL3Jpc2N2OiBpbnRyb2R1Y2UgYXNtL3R5cGVzLmggaGVhZGVyIGZpbGUNCj4g
ICB4ZW4vcmlzY3Y6IGludHJvZHVjZSBzdGFjayBzdHVmZg0KPiAgIHhlbi9yaXNjdjogaW50cm9k
dWNlIHNiaSBjYWxsIHRvIHB1dGNoYXIgdG8gY29uc29sZQ0KPiAgIHhlbi9pbmNsdWRlOiBpbmNs
dWRlIDxhc20vdHlwZXMuaD4gaW4gPHhlbi9lYXJseV9wcmludGsuaD4NCj4gICB4ZW4vcmlzY3Y6
IGludHJvZHVjZSBlYXJseV9wcmludGsgYmFzaWMgc3R1ZmYNCj4gICB4ZW4vcmlzY3Y6IHByaW50
IGhlbGxvIG1lc3NhZ2UgZnJvbSBDIGVudg0KPiAgIGF1dG9tYXRpb246IGFkZCBSSVNDLVYgc21v
a2UgdGVzdA0KDQpUaGFua3MuwqAgVGhpcyBoaWdobGlnaHRzIHNldmVyYWwgYXJlYXMgd2hlcmUg
SSB0aGluayB3ZSB3YW50IHNvbWUgcmV3b3JrDQp0byB0aGUgY3VycmVudCBjb21tb24vYXJjaCBz
cGxpdC4NCg0KRmlyc3QsIGl0IHJlYWxseSBzaG91bGRuJ3QgYmUgbmVjZXNzYXJ5IGZvciBhcmNo
aXRlY3R1cmVzIHRvIGNyZWF0ZQ0KZW10cHkgc3R1YiBmaWxlcy7CoCBUaGVyZSBhcmUgdHdvIG9w
dGlvbnMgLSBmaXJzdCBkcm9wIHNvbWUgZW1wdHkgZmlsZXMNCmluIHhlbi9pbmNsdWRlL2FyY2gt
ZmFsbGJhY2svYXNtIGFuZCBwdXQgYSBzdWl0YWJsZSAtSSBhdCB0aGUgZW5kIG9mDQpDRkxBR1Mu
wqAgVGhlIG90aGVyIG9wdGlvbiwgd2hpY2ggaXMgbmljZXIgSU1PLCBpcyB0byB1c2UgX19oYXNf
aW5jbHVkZSgpDQphbHRob3VnaCB0aGF0IHdvdWxkIHJlcXVpcmUgdXMgZmluYWxseSBkZWNpZGlu
ZyB0byBidW1wIHRoZSBtaW5pbXVtIEdDQw0KdmVyc2lvbiB0byA1IGZvciB4ODYgKHdoaWNoIHdl
IG5lZWQgdG8gZG8gZm9yIG1heSBvdGhlciByZWFzb25zIHRvbykuDQoNClNlY29uZCwgdGhlIGFz
bS90eXBlcyBpcyBhYnN1cmQuwqAgVGhhdCBzaG91bGQgYmUgb25lIGNvbW1vbiBoZWFkZXIsDQpi
ZWNhdXNlIHRoZXJlJ3Mgbm90aGluZyBhcmNoIHNwZWNpZmljIGFib3V0IG1ha2luZyB0aG9zZSB0
eXBlcyBhcHBlYXIuDQoNClRoaXJkLCB0aGUgZWFybHkgcHJpbnRrIGluZnJhc3RydWN0dXJlIGlz
IHBhcnRpYWxseSBicm9rZW4gKHRoZSBjb21tb24NCmhlYWRlciBjYW4ndCBiZSBjbGVhbmx5IGlu
Y2x1ZGVkKSwgYW5kIHVuc2F0aXNmYWN0b3J5IHdpdGggaG93IGl0IHBsdW1icw0KaW50byB0aGUg
ZGVmYXVsdCBjb25zb2xlIHN0ZWFsIGZ1bmN0aW9uLsKgIFdpdGggYSBiaXQgb2YgY2xlYW51cCwg
bW9zdCBvZg0KaXQgY2FuIGJlIG5vdCBkdXBsaWNhdGVkIHBlciBhcmNoLg0KDQp+QW5kcmV3DQo=

