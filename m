Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF0E533812
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 10:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336976.561437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntm97-0006hd-G7; Wed, 25 May 2022 08:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336976.561437; Wed, 25 May 2022 08:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntm97-0006bD-Cq; Wed, 25 May 2022 08:13:33 +0000
Received: by outflank-mailman (input) for mailman id 336976;
 Wed, 25 May 2022 08:13:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x7Hr=WB=citrix.com=prvs=137588b7b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntm96-0006XY-As
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 08:13:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f05a45e-dc02-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 10:13:30 +0200 (CEST)
Received: from mail-bn8nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 04:13:21 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN2PR03MB2384.namprd03.prod.outlook.com (2603:10b6:804:c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 08:13:19 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 08:13:19 +0000
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
X-Inumbo-ID: 8f05a45e-dc02-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653466410;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=i0DHl/Fggy3s8e4om9UV0iV14j+LgxQomjRyTUyxx1Y=;
  b=PDjMn5T3RBJUokCO0iJFOUWM6gi4srBbCBC7Tk57OVovsC8c4AI+cQrN
   HuonYakEGPlSMFfobn0LywTfiQpsIL1qxO/PtCR3yRDhMbIJM5pBSa8jf
   2MKEBkpfWhDg347H6bAzxmrviA8u/AnsyMP7dkkvWE+iADZlH5fTYYeUh
   s=;
X-IronPort-RemoteIP: 104.47.58.170
X-IronPort-MID: 71982223
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ca1TrqBQCq55GhVW/13iw5YqxClBgxIJ4kV8jS/XYbTApD0j3mMEm
 zcYCmyCOPuCZGLxLdtyYYi1oBsFupSDnNVnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Nj39Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhIl
 It9iZGzVD4TGbHLmqdMcShgGQZHaPguFL/veRBTsOS15mifKj7G5aUrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t2B8mcG80m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjx1ymlKWcDwL6TjbIu8TXr0zMh6beuMOjLKoSqf+5ou3/N8
 woq+Ey8WHn2Lue32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAa60iDXtT7GRqirxa5UgU0XtNRF6gw7lGLw6+NugKBXDFbFnhGdcAss9IwSXoyz
 FiVktj1BDtp9rqIVXaa8bTSpjS3UcQIEVI/ieY/ZVNty7HeTEsb1Hojkv4L/HaJs+DI
IronPort-HdrOrdr: A9a23:JrSOS68Co61nfkoFrpFuk+E+db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsjaKdgLNhRItKOTOLhILGFvAH0WKP+V3d8k7Fh5NgPN
 lbAs9D4bTLZDAV7PoSiDPIaerIq+P3lZxA692urEuEGmpRGtpdBkpCe3GmO3wzYDMDKYsyFZ
 Ka6MYCjz28eU4PZsD+InUeReDMq/DCiZqjOHc9dlcawTjLqQntxK/xEhCe0BtbezRTwY06+W
 yAtwDi/K2sv9yy1xeZ/W7O6JZ9nsfn17J4dbqxo/lQDg+pphejZYxnVbHHlDcpoNu34FJvq9
 XIqwdIBbUA11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA1bkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMEjgYdq3MMiFX5uYdk99HqQ0vFnLA
 AuNrCW2B9uSyLXU5iD1VMfgOBFXRwIb2S7qwY5y4+oOgNt7Q9EJnsjtbAid0g7hewAouF/lo
 L524RT5cRzp5wtHNZA7Nloe7rHNkX9BTTxDUm1HXPLUIk6BlOlke+G3Fxy3pDjRKA1
X-IronPort-AV: E=Sophos;i="5.91,250,1647316800"; 
   d="scan'208";a="71982223"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvGufHWOHvubzJLqI7wJN0pgfyI8vlC4OIbV2q5I21HXaFnirodD8cNCEldAt3RPjsf6m57ESpNpTWXM6ZQyKjqHzuToThun/cMEZJfX8MYA8g6OQrF337lyPBy/TKoSive8JfrZOaKTKlzpcYWe2iMmS3ihQK5cp/G043AMgiUp9Sxos1iY1qMInkC/R+GPGk/ATZSFL7uCCNNGpYO/AmDE6em9X71MdjZ8CUs8kE8F0oUXWwK0jmkXFqN15TiJVMA4lTaUhBieWUE4oODd57IIHyn8j7QzyyG4s8Umne887LpVadY4bC59be9+07hquiUw9Mhe/JWqfYvx1KIUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfoDn3oJE1llxFj9p3Nd8P/WEBh+QYk/xyl4xWf42+g=;
 b=ChqJNEbTh6woPGxag6OhCu90QRlC7ONfJsAh9n1KhyiZJ3Qcn97N6wFf0Xj5KfTpiCzMlMYtuu5fDGaGXfl+4ALRKujgXPCBBQAkyzpEsg6/gfEu04spASnelIjLBpjuK3Nwbtn0p6y1H0ZvbmZuwU5OnNIppLNrxgd8Y4fNBXGKb9o35uw4pQT4dLjMaVW+HvezAYctYieBzJwDOtqxyLTk/GT8yiPil0CNCnV4vsfbAaiAWtB03z5wJk42ivIDeMU+1bcIUULlm7rC8VvgoyO380ZTofz7MgqfNTp8yIjfJBNhITU7fv7ukuyK/CrNrtEyGvslx06Gsla8qZPUnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfoDn3oJE1llxFj9p3Nd8P/WEBh+QYk/xyl4xWf42+g=;
 b=ETXQGZNYiSrtO18ZsEoLKRVje/82GGp3tX9uJrbxblHoIPopdEgj0ALu3agqMCV1ReEz6pP+ho8rZQfx1Rs2vGXesYM8CJayNqfSsQYAsF5ZD2g9Ob/J8P9jcei+Wa7HZ7AsCagn+oLUTY/qNpLuJX4b/Ov3MxNuwsWjumqhkSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/2] x86/mm: fix regression when booting with CET-SS
Date: Wed, 25 May 2022 10:13:09 +0200
Message-Id: <20220525081311.13416-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32c1a7c0-6e3f-44b3-d806-08da3e266d5d
X-MS-TrafficTypeDiagnostic: SN2PR03MB2384:EE_
X-Microsoft-Antispam-PRVS:
	<SN2PR03MB2384BA6FB74F9382CB0BB8908FD69@SN2PR03MB2384.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c+/bkiXJxphM75ftgzSf3owrHBIgKtKxJbfQuZxeL/aSe89+M5+1wyiyNBwfEoJtjcD6E3r/rXR+rk+puIM6NY6PnR7izhMn1ff2+DLDhVjbGH3ILJAe9+axAoCephCFp5QlGMlIFnarddqPXXWaV1yAb9m8fAkqMp6vr5yImcpigrLk3Mpt/tpPOE1QVP1a9bVCmV2r0p4L0gD9HTGiINBa3C99Ux5Cq5JNrIxdjFtvVck3CXTjwT6qJQJnAPm5/NGt2mftqlIqiTc4df2WE+Mqf5jWNSkY1fCmhaImbHHRoTVwIEVBBf1M3Sxk/CzRdpRTuny7BhSswjdPR9Pzp1C2+YlEmVkKcl4ytedGGFNBCTjZlnnuFasnR/aL+kmIhn0biSMvEXTTWLf1pGWQf6eUikHSJ5Jf2xsMGoRconPWRmP5jY/faQC6F7xub/FJD3p6qrsgFqeJEMK0K2l1czO1UR5XSXgc6ZAqzBP5RjPHjRyxXWQ+bvX3V8hlOscQjr/BphpTRsYnGlTiyoxI/ft/6jJQtfq/1ZGdz3ZZE+bKFNGeN44F8LrK0vtI/HiyVcsYzqItpm2UGkxlpH2XBeyoorLlwqiYEfv2HaaLlc0WnaPsqhUvNMHAaJL4Lzk+g8u2XDq1JOjaEOb2901scA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(4744005)(66476007)(6506007)(4326008)(26005)(6512007)(8676002)(82960400001)(86362001)(5660300002)(508600001)(83380400001)(8936002)(6486002)(1076003)(2906002)(38100700002)(316002)(2616005)(6666004)(36756003)(186003)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WC9CR0g4VVRmdVBQSDZyQ3pQTm9qN0doZW1MMlpoOGVuN0Y1SjRhTXFBbVR2?=
 =?utf-8?B?Um93YTM5ZWREaG5NQ3JxZzVZWjltdTZpMEpQRVJLWk9BQXhUOVlvV3RWdFZ6?=
 =?utf-8?B?RytlaW50ZGFobm1CMXMwWEZoN1hsd0NFSmVuRUJvRUdhTXBabmdFY2srTngr?=
 =?utf-8?B?OEpadzJoS1NNSk5iMjV0MFpJY09BcEk2QjVFYVFHTHZCV3U0Y2ZRNE8yUndn?=
 =?utf-8?B?VldmcjFCakQ4MlVnNEhlR2cyaUluQmgwRmlFUzk4NVZFWmFlU3pHZEZ1cDYw?=
 =?utf-8?B?UHJaVjZWUTBINnlIZGYxM0xhaXZrcCtMdi9FVjVXV1dhcytvakZUQ1JjMGVp?=
 =?utf-8?B?NmZGci9tRFBjdGR1N2VJc1crK1BQdmwrYXp0S3RQK0V5Qms4b2JQOW16YjlH?=
 =?utf-8?B?bm1tYzUwcXV5djZERi9SaHdCL252S3JFQSszMUI2WjQ3RStYVi8wZFB6VW8r?=
 =?utf-8?B?TWx6K0ZWdlp5VWtrQnRWZnM3VUpzTFpUaWY5OHRYTXhKMjFMMUFsUWVTSnFL?=
 =?utf-8?B?cXhnamxkQkdHNzlneE44WUJ5WWpwSlowL1lYcndZdW1WVGszYktsVk5BWkQr?=
 =?utf-8?B?UWZWdjBIZkNwdmsrSncwU3JPZ0VKQ0h0L3VyNVVwK2QwVllYWEk1ZXV1dUI0?=
 =?utf-8?B?bVFhNGxUc09TTHk2T3pLRTFZd3JsSmRkUFB6L1RZWnp5NEUycWhvWTRDMUg5?=
 =?utf-8?B?ZnJSQXNhMEttNjYybnFqNW5UaEVqVEF6UVFUdVFGNmRSc2lud2N0ZjNKMkdG?=
 =?utf-8?B?eUNrc0hZdGFJM1hXNnFPVG9VNGFvdllXTUxZRlRiUUF3S0l0NzIrbmJ2ZmdC?=
 =?utf-8?B?L0toa0ZRUFZONU9ud2lSOHlocEI3eEg5K3FuMDdtcVI5d2Q4dzR5cTh6Uy9m?=
 =?utf-8?B?bzNMb2l5cnJSanR0eDB6R0dEY2xMV2lCc0Z2QVRXc01EOXR5bXErdzA2Rkxh?=
 =?utf-8?B?NXp0NG44ZE1JbHJjeFhBSnh0eEEzQUxaZDdMZTMvelJRYWNyZHhGNXZzRWFs?=
 =?utf-8?B?TkhZdjBzclhSdDJJV01QVHBjYmtNVmRkMml6UXBaTkhPTTNoZ2NqK3NmZ0dE?=
 =?utf-8?B?NzBxK0hQVkNsc2lsVHV0RG9FVjlBRFNOejFmU04vOGdDMDJha1JhTnk3WlNE?=
 =?utf-8?B?UzhnWElLQ1FmU3RYT0k4UUJUR0xDR0s1ZGc5VTI3ZzdvZ1gxTXUyNFlMODNu?=
 =?utf-8?B?MUVFdjBHWjNRZTdYUGFYTENLUEVaSzFTZkc1aXJhSFhxU2pYRDljd0ZmbnZO?=
 =?utf-8?B?Ym9LdlNudStoeEpTZ2xmd2V0UXpJY2VNbDdQcktzc1BaeXphRjJweVNXeUxB?=
 =?utf-8?B?ZTdxZDM3d040WVVndllzM21WdmRiTTd6RWJBQVgvcCtLWDN4ditvTjB2Skxw?=
 =?utf-8?B?Z085WS9zREFRV1N0L2JvZHBmUlkwWmV1ZHBuZkVuOWN2bjF6a2hPSlNTZGFF?=
 =?utf-8?B?Ym9ZRTlEWklhckRJc1BEb2Y0V0M5aGJUV2p1MytsbURaMmU1NnBTRWd4ZXpQ?=
 =?utf-8?B?RTF6QzQ3K25xRFF2Y3hlY3RRWDJES1pnS0VZT0VSeGxvck84a2lDM28yNzEy?=
 =?utf-8?B?VGZSb0NrQVhGZ2tCUGdZU0hsZVNzSFlEN2hGMi8vQXkwTU0xTzg2Wk82RzVZ?=
 =?utf-8?B?NjIwWHprVUxqZlluQzZnQ3RkUHZKMjRjTTVaMWg2Y1ZzRy9sVHRKUVNZOElm?=
 =?utf-8?B?RHVqU3duclNuVHhDT1BqWU9ucm5GRkFydWNWSlYwaG5qbXBzZ0N5eUVENzh6?=
 =?utf-8?B?SkxVTDg2d2pDSGI2NFNUd3FjOEtHRHV6QytVaXpCSy91NDc3aW9FZWZQRGpn?=
 =?utf-8?B?c1pqdC9hUHpnQ1ppSWZIbEM4cjYvZXk5RG5TTFNoYXNQaUpSbU1OM21GU2t6?=
 =?utf-8?B?czJWT1lETm00b1B2Z2dQQzQ0RER4ZTVLdzhWQVpxeWYrMDlaSEdvdVZmSnlY?=
 =?utf-8?B?UEdONTc4aklpWlFKMzA5emtDTCsxWmdDblNiZ2luT0lOMHl3T3pjWVRLbFNt?=
 =?utf-8?B?S0cxbTBPOVZMSjk4M1ZPbHBaTHJ4bVpvQnpIVkhYaEtiTlFkMit1QWhhREdG?=
 =?utf-8?B?ODNhSGpIVEpEdmREMnl1Nks0RTgxdDU3U0M0UVN1Vk5YeXY4a0wvNTh3UGE5?=
 =?utf-8?B?ekJXUzUveDlaT2RaYXIzejR0UDBCMDZuS2lIMjFWQXBFeUdBMUFlaGZqRDNy?=
 =?utf-8?B?cUlRaW5ubTVZSTBRSVpmbDRGRDYwWnZTbmp6UVVFeEtVMHQ3aUw0dkR0YUpF?=
 =?utf-8?B?Z04yY3B3R0ZMRjJIR2ladk1GVGZ4T0szeDFEWVBOQ2szS1pNV0NCdm44VWNv?=
 =?utf-8?B?aVZUZFBjT1VjcGM0bXd3QmN3U0FVUnE1YkxTZ2Rxak1wcnVwM0NvdXJxMDJ2?=
 =?utf-8?Q?FDI5Lch0jN4Ngvrc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c1a7c0-6e3f-44b3-d806-08da3e266d5d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 08:13:19.1829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnccXT8FP8SF4dzaM+/E8+PHzEVoXkQ5YEZR3s/6Tu998p/5hQpWN4lNIIl9EPNmE7b/O1lajbaYeHp4vgKUIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2384

Hello,

Following series aim to fix a regression when booting with CET shadow
stacks enabled.  First patch is a pre-req non-functional change, second
patch is the actual fix.

Thanks, Roger.

Roger Pau Monne (2):
  x86/mm: rename FLUSH_FORCE_IPI to FLUSH_NO_ASSIST
  x86/flushtlb: remove flush_area check on system state

 xen/arch/x86/include/asm/flushtlb.h | 16 ++++++++--------
 xen/arch/x86/mm.c                   | 11 +++--------
 xen/arch/x86/smp.c                  |  5 ++++-
 3 files changed, 15 insertions(+), 17 deletions(-)

-- 
2.36.0


