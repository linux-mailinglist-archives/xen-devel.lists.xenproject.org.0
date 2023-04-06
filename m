Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717006D928C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 11:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518789.805650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkLlC-0007Rf-MO; Thu, 06 Apr 2023 09:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518789.805650; Thu, 06 Apr 2023 09:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkLlC-0007PZ-JL; Thu, 06 Apr 2023 09:18:26 +0000
Received: by outflank-mailman (input) for mailman id 518789;
 Thu, 06 Apr 2023 09:18:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RM5I=75=citrix.com=prvs=453d769fd=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pkLlA-0007PT-TN
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 09:18:25 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8cc340a-d45b-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 11:18:22 +0200 (CEST)
Received: from mail-bn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 05:18:19 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CH2PR03MB5237.namprd03.prod.outlook.com (2603:10b6:610:9c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 09:18:16 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Thu, 6 Apr 2023
 09:18:16 +0000
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
X-Inumbo-ID: f8cc340a-d45b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680772702;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=b86fja9ztHW6IR8ClYPj80TtEDvVmQLZHm9O83fq7MY=;
  b=W3f3tELm6H/Hf6gcDEbhdl02fg4o56//CNrFDMBkatgM9j4ftNEjon1+
   D6zx7A+IpMH4+V+Xhvd2Mxaatr6AQd251xOJU3v7vlnnOk8ldDTldSJuz
   VinhDfw7JneaDWvq6NvBGnJm3IcGxAAVD0EmCe6iYR/Y/kQZgpJuXXvx7
   A=;
X-IronPort-RemoteIP: 104.47.51.45
X-IronPort-MID: 104565972
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PCW4NaJoK4wjPGyxFE+Rz5QlxSXFcZb7ZxGr2PjKsXjdYENShWdRn
 WVLWjiGOvbYYzOnf9t3aN6/9h8Cvp/UmNQ2SQZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5TK2dB8
 uM9BQk2TQCSnfq58p6DR+pV05FLwMnDZOvzu1lG5BSBV7MMZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dupTSOpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyrw27GSzHyhMG4UPK+i7+9AkACx+kMWJRMLUX2rp8mZ2lHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAHSThbYdBgq84yRhQtz
 FaCm96vDjtq2IB5UlqY/7aQ6Dm0YC4cKDdYYTdeFVdYpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:6QOZb6NUjsdiqsBcTuOjsMiBIKoaSvp037BL7TEVdfUxSKb0qy
 nAppgmPHPP5wr5IUtQ/uxoW5PwI080l6QU3WB5B97LYOCBggWVxepZnOjfKlPbehEWwdQtsZ
 uII5IUNDQpNykBsS8h2njBLz/8+qjgzEl1v5ak856yd3AWV0kOhz0JczqmLg==
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="104565972"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8xNq3oRb7VmN0cOOS3xR+/cJyW6MpesmT4uBtWuSj4MWt6qAdmGPYVKqabs3Cv3uWojdV5QJzwvcZUKwIeXitKV+8xnmN8cZ+FAh4gBFYMfIXfKLF+U8mA4C3diyS/nl7HkOLh9BqDSvPuLDIMBsBWlBir18GTKAu5gzbsJ9E4K/gdItVVRdvpTpMuMfcqzs1bFGJbt/WgjcY1RY9gWyZKyviMMaHZ8z/p/EH8pCAPEwBBi3RYYT0z3s1tMdB+EI4dXJawHUsZ6J1obXw29meFddreNTD3ugZ/ZKuDE74SEgkeqKtSe88yPdjZqsWFL/iO1/5MAqmMWwN5s6n8z6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnCA7B702KreQwdKNNPADcBQDwWIhYrArbxnmVXIaVQ=;
 b=fbeeVzboX55rGvvwI/c99TC0gDegBVWafk/j4PfFdAgQIFl0FcXjcF8ARgxYusCYWB4L667FizjWMc+t0i96UzR7d4uHNJNhvxg1R66pE0waP+MlbuR+3sedBxx/gPuGJP0VjN/MZxaDLScU9cosx+3FoSCuORLP7D4FATZt7ELvJBXwj7r1Aigp5wVjvkddoZ4u7GmrgdYwX3/aGyM/OSfnsqFG6Ow8NmtkQTvMxDNSoXIqt7x82zvnM7SJawvrZK/a9CHPQ4ZXRBauiDrcP/fu9MOg+GWsBIzjQwt+4ltWsdCtTbxZewogiwwjU4tLmhTyr9cpc2ojXc0cws9hNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnCA7B702KreQwdKNNPADcBQDwWIhYrArbxnmVXIaVQ=;
 b=nWUEDexLPu1CjrQiNvZNAs7jniUtBMzVS4Ct64mNPCKngRmy3Y7CcZD8PtObmDeM2vPGdEDdB9crA89Rf6gfUNZ9cGoSqWogdmRY4nsNAMdYp2zBVFRIWv2NBcqyCoQYsF5OCMbLXj+xUH7Xv/jYquQkbe2gKa8PFPPEQMda4N0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] livepatch-tools: remove usage of error.h
Date: Thu,  6 Apr 2023 11:18:07 +0200
Message-Id: <20230406091807.49028-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CH2PR03MB5237:EE_
X-MS-Office365-Filtering-Correlation-Id: 994f8dae-6a35-4811-52a4-08db367fda7d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Txfqyi/JpK/S5syxTV94OEV7i6h7Ke/14BKTAFEZzVdPISYfX6LL9Y+EXQ8euQh872rwmQJaSSAtz3PUCSdavELmxNW1LvRlXhJ+qD/2eFQSZ2IEXhg9xbswKWAZwPTkANhZ/3OL3+8ERQPFeZgxbu/mb3D2fOM5lGp4wnZL07RgFkDsOScTeZGcLjqnD/JgSmeiRidjCbz6wZ2kXLLt9WP5deqZJ92nfBd/GG9RQSZ9UEOTs2k0VxopKRRrwvktXo+2+QiXJ3X7oDDc7QIvln9Zr1QF52ttIJR3LpjM5VmEUfiCZEwK98FgdBMGRz3s9nPVwZszwilP1E7CHHwQV6RAb87axj0qzW1sYkZxLBxmKd9WVwQzu10ioY1wD1dEhPCJOaAiB2yHQM5SVEScSnyyMOjRk8Xj8Dr1wgRZ/DQcJ2xQO27l4BtOHBWoybskzC71vu0xXKp/tQj9gMSlmXnqiX1ZP6xlro9QJf9rvC5pHWwXHd9XeptR2p8SDIkxUDoYmRSiwsQ8MtSKK0gunrT7CrpF+zGDbxLNvzCbuL+PXeUwJnTqDeNbRerP7IHC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199021)(316002)(186003)(6506007)(26005)(6512007)(1076003)(2616005)(6486002)(36756003)(6666004)(107886003)(83380400001)(478600001)(54906003)(86362001)(8936002)(82960400001)(41300700001)(2906002)(5660300002)(38100700002)(66946007)(66476007)(66556008)(6916009)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUJqME1kb1BZeUhOSG5hRXVaYUpYQVM2aUdOYzZudmppUlJHc3FQTktZKzZX?=
 =?utf-8?B?YTE4MUcrWi9MR3plaDVaSmxQQlNuSE9FOXJ6VU41TmhMNVQzMkN2L2U1Ykh4?=
 =?utf-8?B?b0R1YjhEOVYxVFo2YTRQeDJoMkpvMzNWTGYyUjREakFBTFF4TXFPRkxSOWdB?=
 =?utf-8?B?a0psMnNiRFQwT1I5TzVlRHpId3ZTVkVSbGl3Q1pOZkVqb1l6V0c5ZUlKQkFj?=
 =?utf-8?B?Qk04bm1TN0lIUDlkbzNrbTlUSHdqd0thanhrUjN2SThpV2s1ZjBEckdQZVlL?=
 =?utf-8?B?ZURCVjlrYnc1RXNZaS95TFlBeXFsd0FuYjZ2cGJuWWl3SlJ6MnVaazJYWU5L?=
 =?utf-8?B?eWRWU0JJT1ozb01EbUZNcElBdUFGZE8wUkVaemVrZ0pENDZkOTk1Y2JSemRh?=
 =?utf-8?B?RlhjSzhDMG9uYUp6eDFpaWZVWG9yT2xEN21hYzY3UWhJYW93VWNmWkYra3FT?=
 =?utf-8?B?K2Y5Yi82T0NOTFg4Rm04ekVwNEhMMjFTK3FLMENWZ3g3UWNRMzZsOUx4YU53?=
 =?utf-8?B?NlVxUm9HeEp4Q3JZYUVWMnhsRTIyTkNwV2xjMTBuWnFJaUxsamZ5Sk1WTk5E?=
 =?utf-8?B?S3RPd2FPNUFCMkltZVkxS1VSRWdiRVZGZTZnbFhCRm1mTlYrUkd6V2NnMFN6?=
 =?utf-8?B?TG5Cd1c3c0l4YlZQdkNCZjROejNGZmdjNTg0bnBFWkZJazY1dmxMU0tNQ3pa?=
 =?utf-8?B?a1NxQVVYUFNqbjRZZEVCNmhqdzhMTmNUUmt5anFsVjFlejFab0ZQYnkwOFRk?=
 =?utf-8?B?N2pMMytJYkRSNXlEdVE0R3g4NkZZYzBJVXhPVXllK21mZnBhbUdUa3B3cDVP?=
 =?utf-8?B?YTFlRkpPcWkyN1lweW12eWdNMWY1OUlEUytVUFJ0ZkJGT1IycDJCZlZNWVlw?=
 =?utf-8?B?V0pVZjRqaEFna2cxWDdabnJwKzdrTmM1QlJvM2tadkwrNkExY3U0WDhKcFpE?=
 =?utf-8?B?KzhoV2JaK2lXT1FCKzlpQUppN1hqSGxjQ05aNU9HaENrR1NiVFVTQnNkNHRo?=
 =?utf-8?B?VHBRZlZOQXdpQ0JsVEhpdDJjaW5HcHJEQ1RHcUM2bm1KZzlzRnBHWG1oK3U4?=
 =?utf-8?B?Wld1S2E4MXZaaitZdkswTzRGTHJmNkcwdUJ5QW5zUDJ4QkFhNWFhQmpPODFB?=
 =?utf-8?B?YnhZMTQ5OVcyOEg2SEwvM3hWdzJjUElkWTBuUlNHSEF5aGhORlplcnhiZ2lw?=
 =?utf-8?B?aG5jYjR6cUZCUFRoa1BFQnNVVnBiUGo0c2ZRN3phVDNaVGpXTkdnYWVTdHhx?=
 =?utf-8?B?UHFhbEg3QlAyY3NQQjhoWXBlR2VNUndsWTlOMnRIQ2hrVElNVDJwSnBtODZB?=
 =?utf-8?B?aXpPUytqV1N0QzI2Q3UzU3lEaEgvNm50ZW1rNFFIZEdaR0ErK1BuQkczWTA3?=
 =?utf-8?B?NEVWZXFyVWN4YmVzdDVKaVRmaGJCeW9BTmVieUpyRU1KTDBDNlh2dnJDVWlw?=
 =?utf-8?B?RU5qNmw5OXU1MWtLQXI0dkt3cG5RbXcxM0UxNjRSNk1kZWpCWU5qUTVtTDNs?=
 =?utf-8?B?RjMwTFpjTFlucTJXWEM3RGxLdUZWT2x2U0NIZVJneTN4d2ZTQUVQSWFMQUp2?=
 =?utf-8?B?ditjOXBobkxJZ212Ny91eGZsU0pkc2F0T1dNazZiODJYREtxVDhDWUNEaFBL?=
 =?utf-8?B?RUZIQ3BiRnU0RENkb1pXY3B0ZE5FUlRKZTBwVHlVTkVOQmtBYmxERkVLWDFs?=
 =?utf-8?B?aE00NWdIQnR1bUFtZXUxMmRhM1lQeXJOZFFCaDF5WWZTYm55T0lqRktaTTJ4?=
 =?utf-8?B?UGhEUDZkMkdTckwvTkFMU3N6RmhZbU44MmtNa3hCNGVhT0VsK2VXeUwwNFVE?=
 =?utf-8?B?T1VXN2hxeDVmQnJoVmxRZUdBMU84d0hqVlNlN2hzZzVMaHZjaVNKWGlQSzA1?=
 =?utf-8?B?a0JKR2U0WnhGOFE5UVdnKyt1bkVXQVVGZ3dGKzFUdkhaOEF4MmpFNXFidWN0?=
 =?utf-8?B?ZkJyeXNpUGFKUGgvbVhpRldnMHNwNGVjd3B5VTNaNWRBdEVISlNRZ1Q4K3Zw?=
 =?utf-8?B?V3RjMzV2bklhNTJVSElHcWRId2tOVHJTUTlXYTdFV0lGWE1JOEJzcHF1aTJK?=
 =?utf-8?B?cHlDSTdsa1ZHR2xIZWpwK2V0VU0rYkJWcUlWczNleFJ4SHZFbEVBL0JDVVRh?=
 =?utf-8?Q?a9a+a39WHA3D41TZ0emyfNml2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T6HaCGxBfx3BWrlvkPsX/Uz5TnRCWLfp92ysKg2JPTG1cDgWPUXpnyE0TKtGZM76b08Im+j4UlActZUi+/LBn+kfjM46rJrnyw1soDsfTJdVz9ThCvpmtC9j8FF1GnSLlki5dYj+aqOq23wG/i53a50HTvk7umsQ6IqgIyQN7+DSYpTHjzfUixQKmrXYRi6SN6RYKX2eBhp+o3Oq7HVlyo2uWbS1VwxZL6JcdKGJi78h2d25goyAXSNFl4TqZcpgmNVUYzGoZqYAdSh7VTOANviccgKwjPkO+msi0XUrXfnFAYZn8uVMmM9E9AQmRjVjYqBzQV7vkdga7u0HRCDOmAKOeic0VqkmlXXoVYrWLD1dw/DChszd3QBTzAFdwB8VVXE6gHlVZUviW+6aqFZn4wX3X0UM2rRMQ5XH8U56b7IMYG/tiH7G9VhxBA1urzDuZqvD2+whwxFX4cWHFPt1AiL2GEElzUKDDirOzNLa9DgHi7bVeE+Zk5Mt7tLig6f6tQVsYJV6M43FhqRg0zz4d4y13Fb4zDN7G5uvqYv3+XpxdH4suS1HetBEOmAn0hbH48f+8wDYE4/xvOenk/isoOyiH3UxFaRrr3cSdU339h02WdLTAA8hZO0C6JOp81oMbEnQM72IZt10ueHaby+RdW5WOkh04Eror+F9chGfv5FiNA7WEnDyaeOC6XGFb4UJJBZQciXWUYu0FSjUakcBJvn0StlXjBXj9SRIyxtDj4kRfjBqpLfStsDntkpBaygj9LXUyhmHDaTbzhRKH8UJWz2/K0ZG01fQkK6NqFjWCjAawZ5fM8XT+kEPAdgs0ome
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994f8dae-6a35-4811-52a4-08db367fda7d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 09:18:16.0178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+Rk58LVKarZQjUR0WYvbYpyzKb5FBmroMkER7wA+KUhP6fVEOxInWsm2A4dAnXRbdV+6/IXF2jZZX2nA+lYXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5237

It's a GNU libc specific header which prevents building on musl for
example.  Instead open code an equivalent replacement for the usage
of ERROR() and DIFF_FATAL() macros.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 common.h             | 10 ++++++----
 create-diff-object.c |  1 -
 lookup.c             |  7 +++++--
 prelink.c            |  1 -
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/common.h b/common.h
index 9a9da79..ec2ea33 100644
--- a/common.h
+++ b/common.h
@@ -1,18 +1,20 @@
 #ifndef _COMMON_H_
 #define _COMMON_H_
 
-#include <error.h>
-
 extern char *childobj;
 
 #define ERROR(format, ...) \
-	error(1, 0, "ERROR: %s: %s: %d: " format, childobj, __FUNCTION__, __LINE__, ##__VA_ARGS__)
+({ \
+	fflush(stdout); \
+	fprintf(stderr, "ERROR: %s: %s: %d: " format "\n", childobj, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
+	exit(1); \
+})
 
 #define DIFF_FATAL(format, ...) \
 ({ \
 	fflush(stdout); \
 	fprintf(stderr, "ERROR: %s: " format "\n", childobj, ##__VA_ARGS__); \
-	error(2, 0, "unreconcilable difference"); \
+	exit(2); \
 })
 
 #define log_debug(format, ...) log(DEBUG, format, ##__VA_ARGS__)
diff --git a/create-diff-object.c b/create-diff-object.c
index 780e6c8..d8a0032 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -45,7 +45,6 @@
 #include <string.h>
 #include <libgen.h>
 #include <argp.h>
-#include <error.h>
 #include <unistd.h>
 #include <time.h>
 #include <gelf.h>
diff --git a/lookup.c b/lookup.c
index 39125c6..b440102 100644
--- a/lookup.c
+++ b/lookup.c
@@ -28,14 +28,17 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <error.h>
 #include <gelf.h>
 #include <unistd.h>
 
 #include "lookup.h"
 
 #define ERROR(format, ...) \
-	error(1, 0, "%s: %d: " format, __FUNCTION__, __LINE__, ##__VA_ARGS__)
+({ \
+	fflush(stdout); \
+	fprintf(stderr, "%s: %d: " format, __FUNCTION__, __LINE__, ##__VA_ARGS__); \
+	exit(1); \
+})
 
 struct symbol {
 	unsigned long value;
diff --git a/prelink.c b/prelink.c
index 2039e5b..18c5159 100644
--- a/prelink.c
+++ b/prelink.c
@@ -27,7 +27,6 @@
 #include <string.h>
 #include <libgen.h>
 #include <argp.h>
-#include <error.h>
 #include <unistd.h>
 #include <gelf.h>
 
-- 
2.40.0


