Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0248A7A17B7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 09:44:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602943.939784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh3VI-00046d-Ow; Fri, 15 Sep 2023 07:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602943.939784; Fri, 15 Sep 2023 07:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh3VI-00043t-M8; Fri, 15 Sep 2023 07:44:40 +0000
Received: by outflank-mailman (input) for mailman id 602943;
 Fri, 15 Sep 2023 07:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x70d=E7=citrix.com=prvs=6154552af=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qh3VH-00043m-6t
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 07:44:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5b8c5eb-539b-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 09:44:34 +0200 (CEST)
Received: from mail-sn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Sep 2023 03:44:28 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CO1PR03MB5779.namprd03.prod.outlook.com (2603:10b6:303:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Fri, 15 Sep
 2023 07:44:25 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 07:44:25 +0000
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
X-Inumbo-ID: b5b8c5eb-539b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694763875;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=2bZrFlAo+VEjSHAiWpg67XRlMxWh+ouYvTtyBcd1FDs=;
  b=QW0P2QDDLdQ+m8TOlJhnuoJVtVda2GDPFpHVxsyRoCcBAH0WpZYxNonb
   UcBvaejxHG7y2ebPvW2QgZ1VpTlFa3/IzXfLwOKCcLbW5EtIMyCEXMPpM
   gEjPD4QBqeZPSWxw0a5CfjB0HogsUqAYYV00XrR+rOUayWGrTitLbdRcd
   c=;
X-CSE-ConnectionGUID: Goeh0XrPRV2ap1Z0jtZHsg==
X-CSE-MsgGUID: 1zQIWQt+TRyEp3CMU4K9Kw==
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 121998424
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:umSoZK2B+xEsubh0N/bD5fRwkn2cJEfYwER7XKvMYLTBsI5bpzcAn
 2UaXGGBPvqNa2b8e90nOdvi/U5X65PTmN5nQQptpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8nuDgNyo4GlD5g1nOKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfLmZD9
 aQoMgg3UEqKn7uEmLCneMl3iZF2RCXrFNt3VnBI6xj8VaxjeraaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6PkWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv2376ezX+hBOr+EpXh5MdLv2SPhVApGTAODnCenKWa222hDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsTDRMddgnv88eXiEx2
 xmCmNaBLSNrmK2YTzSa7Lj8kN+pES0cLGtHfildSwIAu4PnuNtr0k+JSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNTNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:QQ6LaaD8pwFFq2vlHela55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZImPHrP4gr5N0tOpTntAse9qDbnhPxICOoqTNCftWvdyQiVxehZhOOP/9SjIVyaygc078
 xdmsNFebnN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-Talos-CUID: =?us-ascii?q?9a23=3AWrzfvWjKT4KEbZFQRYDEyZquTjJuXXrQzC/gOXe?=
 =?us-ascii?q?CNzxgUOSnEV2MyoN/nJ87?=
X-Talos-MUID: 9a23:T5S1HQnaqqk39r7qyRcmdno7Jv5J3J2yS3w3gLge4OKhCHBTahSC2WE=
X-IronPort-AV: E=Sophos;i="6.02,148,1688443200"; 
   d="scan'208";a="121998424"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TT0S6gPHLC/r+DmjmCBaeLURplZAsN927B5P6JsXVLkz7HrpBXHDfP11WEjDIZPBJItoyHEM9vaBF/3mRL7Hg5kEds5OXfYb7sx9eOYLVetulXhtXyYEis2pYbM/mBGQHO5hZtmDpq975XY7Zv5cJ37S/Ko2z5dnZ+WOgcN5K70m1l3RvpCYtTm7WL/RjLXJiEIg0OYoSFlERxjUfspM1ykOxu9sl+hjHz0rNo0DgDyqs5nwHUNnmzUReUVqkXzFKVLefdvwKRIeAZnq7Z7w1xzHJYKfClUol86sFxYSHtNUu7XdxCaq8c9cDoJdonj2Q5tvo7M2BtWycpj7PRDKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmoFpiWyxAf5Kk0LcF841RDP7r8bqATfTFJiOLCgyec=;
 b=oDCLrPMo25lbWM/5CVs9XwIhwnwSs5VPkFpeV24whThxTgGMH962S2XtdBDR280RaStkWsyLSxtG/kI54V/JZFscPO2GmO1TJ/bs7Qo+mjH/961X/EV6KX9ZVjAdoko7G+/dGwlbFMpwVfUgqozhZjcU3z51bGbsjU012y6pnOegRmd8BYJcoHt4NSZsi95iF7wzPezvO9DJ6xXwRVRlrbk4M8FgmctUhd7OC1z80IwIyVOBlZRjUma6YzAUUhgfxK3foefTov8NEYBL3Jjyab9Z0nNqzeP3w2HMHJ0Y+V+bJ1NwncBPDQjzlepAVPqWxPGGi/CJtugK39Vio3abrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmoFpiWyxAf5Kk0LcF841RDP7r8bqATfTFJiOLCgyec=;
 b=V9BemnBEBVdx62EwOJE1KENsqpZdS9sE76e2wXJ3oWguMB9ykAp748ImomTZVwdmPWQQvsFs/8K8NzEMwDl6BIYjytGPL+Ntz5iiV7Z04WILam6Yaek3xroU2+CephZfM+kF/SC2JkmFfMjmKFrOe8GVPTauXy7O+wMbpqS3oBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/shutdown: change default reboot method preference
Date: Fri, 15 Sep 2023 09:43:47 +0200
Message-ID: <20230915074347.94712-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CO1PR03MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: ee17e30a-2df2-4f7d-efa9-08dbb5bf9508
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZLgIHxWeLJfgZrACkZn8ZGS9YaKauGV0e0D9h2jB9McN+uO1ee0Zird+9SQ42jJ3SRBqAhU/ZlPpYN8vTv+sxIU+mUckRa2tHzd3EjjsHGoClo1mInApDb1YI+zg+vj77cKtx7K7Nw5OWelb1wR+ipuRIhvf8tFdYGTF2EAIqW4ukv9nU2SeLq7GLBHC3FuK4RMMi7mx2efMNJ2QtnoS9McuJGbLBQS5JmP8MNyN7QR0FCH2vUoGaHQBlsLgF+znyd63nMd8cl5U/4Ro6t43V60E/4Mlm3JFE7j74rJpZUzoBO+MYvN+pASbHOr7I81vsiX9gETq1FDFhBFRljRAYRJ+LPtxeUslNOFfcUpYj/OJHfYclX19cbCafSpuRriDMGuUBKmUjN1quTwUR1MLYsdOZcK7pA6q8iDbwgBXGOrdyLegjvop4E/SpC6rYOzAL+jrVwcIvf7fL/49HtN6MCeOpdS4ybKQAMHZ9WsUoHpNmVCzF4PSXbtQOkW4GTUTufAcxpw9ZOM3Q2lC6wAgnZZ4J/yCQRdCB2OQajYta4iOdLBim2ql8CH7gpQZ7DXY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199024)(186009)(1800799009)(66556008)(2906002)(316002)(54906003)(6916009)(4326008)(5660300002)(36756003)(8676002)(8936002)(66476007)(41300700001)(6506007)(478600001)(6486002)(6512007)(86362001)(38100700002)(2616005)(1076003)(6666004)(82960400001)(26005)(66946007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXBrVzkrOVlweXFtQzZZTWsyV3I1cVRtNWhFTnBnNVR4ZUF0bjZzOWFwUDl0?=
 =?utf-8?B?TjNSN0xhRWdCUVNxMzBpSzA2STh6ckhBOU4wLzAvYjJlVWxiU1hNSXA3V1Ur?=
 =?utf-8?B?YTlhbU5XNVBCRiswdHVyL1RtSWorZVRJYldiUFJCT1JxcGptTnU1S0RJdnVH?=
 =?utf-8?B?aytFRHNMVis4YWFIbVVodXdqV01oRjRlM2x2NUR5RllmQjd3dHl4MVVOR2g5?=
 =?utf-8?B?QVNRWUllSUVWSnRsbWttR050RmZGb0J5ejVLajlvaXFVQVdaWnc2NDZ5MmpS?=
 =?utf-8?B?RTFZWWdEVUwwc3FVemNrZFI1d1BhbWpYZnNLR2R5S0RMaFRweEtFajYyV0NF?=
 =?utf-8?B?cGNPWjhxWCtjVFJwZUp5Ui9UUElMRzM1NGlIZ1VhZ2JVZm9DenRvUDJINUVu?=
 =?utf-8?B?emFVSWRYSlZ3Mk5QL3F3RzNYL2pETDIySW1rYWo1c0xNVlE5NjVoSW4vbjBa?=
 =?utf-8?B?VVh5cytLc3FiT1IxMDk2emRKU0FDWGlrQm51MEVnOVNWWTdueVRpc3hRSHZE?=
 =?utf-8?B?NGE2RnhDYzZRMkh2MytQUlYrS3N6Vk1weXFrZjFrdDNod2E4QXJ3N1lXNFdD?=
 =?utf-8?B?b1lJMnViU2ZhZTVsNUFkREZvMmkvSkNaNkxHSjRlMGFOL0h6NWRUUjFTSWhX?=
 =?utf-8?B?UXRDLzVXWDdabXBtZXRUcFNDNFZuQ05NTURFOHhua29nZk9oUGVKaTdOTmFF?=
 =?utf-8?B?YjA0cndZaHQxS3AzUWxzWFAwMTVvTW00bkVkN1M4RHRaODcvN0RaT2tzbTBD?=
 =?utf-8?B?a0pJNVB5OWRFQ1F3ankrV3l3MGU2Y1dMNGtTRWFLSFQ3L1R1OE5SRzQ5WGJ0?=
 =?utf-8?B?NkRvSGNkNGdrZU4xU1F2TEZBUEk3SnR0UDJySEpEUXFFckprblB5aUpmQTJZ?=
 =?utf-8?B?THYxZzAvaklDZkEwaThxNHlySGM5Ynl5MEhWZ0g3RGFOQnhoY1czODEyYi9Z?=
 =?utf-8?B?eklidGFaNzJJd29IQUpFMVgyNzBsZzhjUnY3TjJnaUFGWTkwczhsZ25kV3VM?=
 =?utf-8?B?aEhnU3YyaE4zbXhMaFZQWnI0UVZOOGZPaHpRZlJWVVJyUlQ1N0RDUHptTU9B?=
 =?utf-8?B?YisvZ0dERTBORGtGZkhxbTh6VGNOSFlpaHlYVytSbkVpbm5OMEh1WUtCYlZa?=
 =?utf-8?B?Z3dpRkQ1c0trRnEyTXl5ZEdrNWpTZ2VFVTVnaktFa2lqRUNCRElnUFJyZmM4?=
 =?utf-8?B?REJnQVBMN2IxZUQ1dUUrT0tSZGVTYndKWjZ0UERtQ2ViYXJxNmxYdmM3L0Rl?=
 =?utf-8?B?QVA3d2FHYSsrakQraDMyUmFka1JzaVhjSGkzb055RDRHaTNmbmNXcHJKV0pR?=
 =?utf-8?B?L0RQTUQ4UlpOV2ZkM0FxMXEzMkhJQUY1U3Q3cUgvTmZGREhxSzg5eW9XK1E1?=
 =?utf-8?B?L0IzbUk0aUpDOXk4RnBWenJWenp6SWQ5TGVzVDBDZEpjcUFkd2N6VGhLQWgz?=
 =?utf-8?B?TDdnVCs4R2Jwd3Ztb21JRVZtRDBhMmM5Nng5dk54MU5ZZUhmU0VwaUFkdlZo?=
 =?utf-8?B?bWFFWmhvNFhMWmxIb1RubVJXR1JEYXJ6VVUzNnB4OEd0SFRZZTdCNmo1Qm4x?=
 =?utf-8?B?QUtEZ1JjZnA5S25PM0twcmdkblZTOEh4ZGZuUVdnOTRMclhDeU5MOXYxZU9E?=
 =?utf-8?B?dEZBR2R5MXBmSWFUcU1ta1JqREQ2dkJJbE5uUVM1NVd1dWVxR2drcGJaWjRw?=
 =?utf-8?B?Y3VMUGY4STZBQmx1QlB0ODNTbEU3clM4VWoyVHpXSmFvWkRtMngxUm9kQkhP?=
 =?utf-8?B?UzF2L0lwUVMybEJ4YlNaY1JxYXVaYUloQW5kQ29lamdBZU5iN0l2L21kajNI?=
 =?utf-8?B?NzJUOEdtMTNLUFh6Qjg0U3FRNDVWZGpWYUJ3SVY0Z1BxcGtCdnNpVnZlaGxk?=
 =?utf-8?B?RnZUUE9BWTI4UVhGLzgxeDh6RjVtVmd2d2JieXlodGtucGxXMU1ja0dTeWFD?=
 =?utf-8?B?T2NTWGZyaCtyZjU3c0ZGWDV6bEowNG5Id0NKa3E3Sm9qVGh5VTY4ZEJ3U3VS?=
 =?utf-8?B?MXNrdXpOa3gvMHJqQVY1MXpVQ2dxclpmMzhlOVhZYkE0dktNZ2JRRnJqdFdm?=
 =?utf-8?B?RnV4WFlRYXlvQjc0cjRudWhCdlEwNUdSdDhhSFhzVmI0bXFCV0hlemtXYkIy?=
 =?utf-8?B?NmtXNUErUlViVFRlZkx3MkE2VTZBcjFmcWFKa2U2MmdMVVFIOGt6OE1yRGt0?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BHHDexIYxzA08oxB9o2PnJDhgMz984yfeha0pqx8pj7p7OmvZ0L4cV4LySB3DsefQQMPILrvldckH8REVaSZRPDe2uW+rmFrPyVvQ4IqQoTlnFAxbBUi01JZCMyHy12g/A0/KoQamd7PJ/QBzshZJ9yKtxuiLwFvvoFbxgXyXZ0Zv1kMJ9l9CxNtEMzFCALgvi0fe0HybG7kiMwsD5YZw7+WgXvF+w52NirjGpWlE7FaJ6cX7LvNajYBJIG+12Og660Z/tY2GFFjKsm/FAihJ00jayk++59y5hkj2mBUgV1UPmbw7mwWPMOh9csAGaJ35bQSbV8DF0JyDHG+QefZQ0Wx6xxHDWu+5vKFzxJueXUX7A3/LAW4QhfqaCEjwFjEunWJ/od/7Y+Rq8n0ZP/RMpemk7E38VNuZjpzEVwyGh/Lc7wLSe3Q0INxKoRouaGQ7o0lldeWDdRkiByh8rwS2Cy9o/9qVY/53iuKyVUawcvC6947Gr+qJe/WZLB9IwdPYEmcKJS4cuZQuUzClcj581iX+F3XKyZ0Ua69pFNmcq57IOj0yr81M3SXXEKJAiREANPKOCVrXsh7ysDaDX7MO6q5vDiXXD1qqPtHIVeaJgMxwHBiAIjBHa3EeuK8F1cxaQ1jXQZy/uIswMCRbQWLBvQooJ0ABLT8mmsfF6KgKccOXrfx1qhKx38FDlJaEApC+oHFM6f9GgZDPBr6t1pewl2Qo9r/OpaVVLYMWX/yJ1fYgpBLDM3+kvZizDWoW1yfN4ly84UnIiQCPcbA4gZFdMQksjoUZRYtPDQIGcSwTSYP6QOqmL4ZRR73WvQUBH6U
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee17e30a-2df2-4f7d-efa9-08dbb5bf9508
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 07:44:24.9428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EICPKRojmN1ZheivMkZhnw4+Lu5GyuAc9vyU8OBqGXOfhR0QAxztA/1CDtMPjRVjRC2Uyx5MN99NpLQVc/xsVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5779

The current logic to chose the preferred reboot method is based on the mode Xen
has been booted into, so if the box is booted from UEFI, the preferred reboot
method will be to use the ResetSystem() run time service call.

However, that method seems to be widely untested, and quite often leads to a
result similar to:

Hardware Dom0 shutdown: rebooting machine
----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
CPU:    0
RIP:    e008:[<0000000000000017>] 0000000000000017
RFLAGS: 0000000000010202   CONTEXT: hypervisor
[...]
Xen call trace:
   [<0000000000000017>] R 0000000000000017
   [<ffff83207eff7b50>] S ffff83207eff7b50
   [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
   [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
   [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
   [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
   [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
   [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
   [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
   [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
   [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee

****************************************
Panic on CPU 0:
FATAL TRAP: vector = 6 (invalid opcode)
****************************************

Which in most cases does lead to a reboot, however that's unreliable.

Change the default reboot preference to prefer ACPI over UEFI if available and
not in reduced hardware mode.

This is in line to what Linux does, so it's unlikely to cause issues on current
and future hardware, since there's a much higher chance of vendors testing
hardware with Linux rather than Xen.

Add a special case for one Acer model that does require being rebooted using
ResetSystem().  See Linux commit 0082517fa4bce for rationale.

I'm not aware of using ACPI reboot causing issues on boxes that do have
properly implemented ResetSystem() methods.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Add special case for Acer model to use UEFI reboot.
 - Adjust commit message.
---
 xen/arch/x86/shutdown.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index 7619544d14da..3816ede1afe5 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -150,19 +150,20 @@ static void default_reboot_type(void)
 
     if ( xen_guest )
         reboot_type = BOOT_XEN;
+    else if ( !acpi_disabled && !acpi_gbl_reduced_hardware )
+        reboot_type = BOOT_ACPI;
     else if ( efi_enabled(EFI_RS) )
         reboot_type = BOOT_EFI;
-    else if ( acpi_disabled )
-        reboot_type = BOOT_KBD;
     else
-        reboot_type = BOOT_ACPI;
+        reboot_type = BOOT_KBD;
 }
 
 static int __init cf_check override_reboot(const struct dmi_system_id *d)
 {
     enum reboot_type type = (long)d->driver_data;
 
-    if ( type == BOOT_ACPI && acpi_disabled )
+    if ( (type == BOOT_ACPI && acpi_disabled) ||
+         (type == BOOT_EFI && !efi_enabled(EFI_RS)) )
         type = BOOT_KBD;
 
     if ( reboot_type != type )
@@ -172,6 +173,7 @@ static int __init cf_check override_reboot(const struct dmi_system_id *d)
             [BOOT_KBD]  = "keyboard controller",
             [BOOT_ACPI] = "ACPI",
             [BOOT_CF9]  = "PCI",
+            [BOOT_EFI]  = "UEFI",
         };
 
         reboot_type = type;
@@ -530,6 +532,15 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
             DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R740"),
         },
     },
+    {    /* Handle problems with rebooting on Acer TravelMate X514-51T. */
+        .callback = override_reboot,
+        .driver_data = (void *)(long)BOOT_EFI,
+        .ident = "Acer TravelMate X514-51T",
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+            DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate X514-51T"),
+        },
+    },
     { }
 };
 
-- 
2.42.0


