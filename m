Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02496534DE1
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 13:13:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337555.562179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuBPo-0003EX-Fb; Thu, 26 May 2022 11:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337555.562179; Thu, 26 May 2022 11:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuBPo-0003C1-C5; Thu, 26 May 2022 11:12:28 +0000
Received: by outflank-mailman (input) for mailman id 337555;
 Thu, 26 May 2022 11:12:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibG2=WC=citrix.com=prvs=138a1b502=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nuBPm-0003Bv-EX
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 11:12:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b70454ce-dce4-11ec-837f-e5687231ffcc;
 Thu, 26 May 2022 13:12:24 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 May 2022 07:12:20 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6527.namprd03.prod.outlook.com (2603:10b6:510:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 11:12:19 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 11:12:18 +0000
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
X-Inumbo-ID: b70454ce-dce4-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653563543;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=jaxpZDw1gFbF6UtZnOXAikGrvXO74Ch76SFZtNvfnlg=;
  b=T2C7b0KMEl9te44/g2YAVLUetP5lfuJ7hJo6lmkXheoM5mP9L3QgGQgC
   jrd/zUheJQQgPl1k1xvjY7hlYZlkzkPLGL6RdQZiDcEjIdQ0IHlG+wnW6
   B+sExrErz1Whl/CqliglM3R6YMv14g34jCj/HDq5MjWzZBvzuHcv4zvZc
   E=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 72229428
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cqtbe6lGR2eqRJRx1r4vl9Xo5gxDJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXjrSM6rZNDD0LdxyPYvg908A7ZDRyd42HlFp/yFnEiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWV3V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYaiQMH/zup8MhCRRKAh9hBJMYqJ34Li3q2SCT5xWun3rE5dxLVRlzGLJCv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXuJkBhGdYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8gjP9PZtswA/yiR03IbXYNntfuapH8EMjEyV/
 T30/3j2V0Ry2Nu3jGDtHmiXrv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWWc9Zb
 Uod+SMsrK073E2tUtT5GRa/pRasvRMCWtwWD+wz7imMzLbZ50CSAW1sZjxLZcEitcQ2bSc3z
 VLPlNTsbRRwtJWFRHTb8a2bxRuwJCwUIGkqdSICCwwf7LHLu5ovhxjCStJiFq+djdDvHzz0h
 TeQo0ADa647iMcK0+C+4grBijf1/pzRFFdttkPQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytalUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:U5b6M69l08CWe8qNkHZuk+FFdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsjaKdgLNhRItKOTOLhILGFvAH0WKP+V3d8k7Fh5NgPN
 lbAs9D4bTLZDAV7PoSiDPIaerIq+P3lZxA692urEuEGmpRGtpdBkpCe3Cm+gocfng2ObMJUL
 6nouZXrTupfnoaKuy9G3k+RuDG4/nGjojvbxIqDwMurFDmt0Lh1JfKVzyjmjsOWTJGxrkvtU
 DDjgzC/62m99W20AXV2WP/54lf3PHh1txALsqRjdV9EESkti+YIKBaH5GStjE8p++irH4sjd
 n3uh8le/9+7nvAF1vF1CfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZw1BIhqAx7I
 t7m0ai87ZHBxLJmyrwo/LSUQtxq0ayqX0+1cYOkn1kV5cEYrM5l/1TwKpsKuZPIMvG0vFnLA
 E3Z/uspMq+MGnqJUwxh1Mfj+BFBR8Ib1S7qktrgL3m79EZpgE686Ii/r1hop4xzuNAd3B63Z
 W7Dk0RrsApciY3V9MIOA5Te7rBNoTyKSi8QF66EBDAKJwtHU7rhtre3IgVjdvaC6DgiqFC06
 j8bA==
X-IronPort-AV: E=Sophos;i="5.91,252,1647316800"; 
   d="scan'208";a="72229428"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8qNZK3YxgrASUR1X28PqrJYu7bPPAEBTAbv5W3OHe6fxM1Igs09C2q5GMsvhg5r95UpgBhu8RHWeyCnNLhNUfqGwcwvovPGwPq/J6u64gagAeXyDAfq/p6hrEPogXFgHNZ5t7eyeRtp44HOpmNMdyz3dKO9AGZPaIsNjARgpIyumyviP2F8gqDAqL9m3evomx/kANltjCaXPD9Z3n3u5hOdsQ4neTimXcpejJBNC8T2ao3uB911GXYfe8IXqCWh4SxYaVQCn+3F88YXDlzZKxumjFOU8a5w/5DjD2yP4USLtMW5A7GHB4Bfm9Tiyvx30hVIokXyJYJxbA2/PdI+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j998d+wKI+B5c8Q4Pu6YwrODgFxmp/+EKuzijI1YW4=;
 b=e3YHuPgTVetaaZfxFP3fltBi0XTOvnmnqkmU2IKqNr8nufhH6f7Nz6N3mFSKwd3c8iiSTHk8yiVLJi5O/sHs0Zw+I7itFg5qQDn9R2yqOqwdFjR7kzdLOL41HI5e73FJHjBj7QVlSGVS1oEyneW2CnsODQyam1amZcYG4osRSnn2TUxgJ5hoKOl7CKtwanvNSakqU+vEBnx5xXMk9KMcKWMX/BP7S0wHoWFZFkq9Qqv7Fxfif7NCJlDGgmDIKmc2/BQ2Y1SsFjMUNmN9wS9btwtDm/QiruxWXHCbgZ4t4wJiCptXl2W51OpEEgnzI+huCikjrRdli5CGWUqgZzPWcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j998d+wKI+B5c8Q4Pu6YwrODgFxmp/+EKuzijI1YW4=;
 b=DfbillU2PWBe0ZYUKsMq0g66axgdYvLyxufTr07OTW5ViEH6LHWA07ApgQEqkhpPB/04v1K1TJN9cZRur2aHpXv6CLv3b41HQJE0pByBljeJ+fcwBX/EI8XxH/L/qfOdkY6SsaS9SVhRysGnCsk5R+SP/g1jQFj1MwHo8j06ar8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/3] x86/vmx: implement Bus Lock and VM Notify
Date: Thu, 26 May 2022 13:11:54 +0200
Message-Id: <20220526111157.24479-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 962d15a4-da63-42c3-0daa-08da3f08991e
X-MS-TrafficTypeDiagnostic: PH0PR03MB6527:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB65277370E834EB2D0C30FD808FD99@PH0PR03MB6527.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k9y5zYjArhUOG8JaqK45ZGj5AExWANfXdGXwxT+oCGaj/anAflCnJzuPv/aUSKSXjyzDUS6hq3XMxxlHvuWz6NEM3t9/i/yoGWcq1/ECvC2+6gzuWtZT9FjrCqlbH0VKfc7Ei7tEB8Q1C6ZEHYP9IHZSPE3gVnShb8+bEPxc76+WmiAG+f8/JM73I5ouyPlMu9TcYE2xYfFyhgNMrhG7QvHZC2ZMtRjwreHahoQcqBiVgjdsfX+TySZe74Ch7/kh4HC/QVldRakP1QHiIEr66fKxqOHdS+vgFiVEkEuynuIGJ/8YvQCyJzIul75P91twd4idGb/SRBKVrkUJSFw0KsB6NKgwdXCQmrNou53wsyA//xTLJxFWV7th0+Jbx0gLz/+C7lPUKdDn4Ns/gTaytrGRmpvktvbGgIfwpa4JTWmtyO+aJRDGIoeHlCtWD9sIy7frKKuDReTHZcIo9E6uDsYAx0J6gnqqiBpENlkDkh32gQzoM3FxPaNqaAo/QESoQYGoWOYyC5MkepZJz6hxAJdjgu4FKo2XpxqAkYME6s2j+rEwF9POj40lEIfJtZXdiTCFlASoAVcRsQMEryO1gXOZRrrk/MBL5rgE2wG2v9KsL8nm5TPmCM5ymZkXG/XFBylFLWkzMdpY2hJAUMSs/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4744005)(5660300002)(86362001)(4326008)(66476007)(66556008)(66946007)(8676002)(8936002)(54906003)(316002)(6916009)(38100700002)(1076003)(6506007)(82960400001)(6512007)(26005)(6486002)(83380400001)(6666004)(186003)(508600001)(36756003)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUhvS0ZVLzNuNDNVNzRTN3BKbUZ1WUxQTlpKeWlWbnBOSVJRcEliV2I1RzQ0?=
 =?utf-8?B?ejJXYXl0bFI4NkJsSEpiVWtsaGJ1a0JuVTlsRFBTRm9JOVFvTnJFM2pBRGxK?=
 =?utf-8?B?bnhmb0tKR3JOdHp2R1JQSzhVaVJOcGlnNnFtUk9zQUoySFB3K1JaeDNtQnIz?=
 =?utf-8?B?V256YjZYemRFa1dVWmlocFFVcFZJNTNYeks4UXRnaCtUa0t2a0pSVFRPTDJo?=
 =?utf-8?B?WDFEZFpQN3NnZS9LSlgyN3oyRjRWY3p2LzVBL3FxQ3FUTENEMzhtVFZ3VVdz?=
 =?utf-8?B?bEE5b04zZ1lKY1BLVHpmMVVFNm40d1Z2V2dERjNTclpTbTZHTG1VSlVzRXZu?=
 =?utf-8?B?NTdmV0NjZ09VaVVkUys1dlMxUUV0amxhdUhISHJ3Q3hPTUdwclFsM0hzMVBK?=
 =?utf-8?B?bmtmUWdrbk9JYlNPUTFFWGlQRkdvTkVBNkhnMGdEZHJOSVRjMUZJbFlSaG95?=
 =?utf-8?B?Yzhic1BOOWdKeU5BbGp2YTA5dlgwYkthU0JuVEdjaE5ybS93alpPT0dNZ1J5?=
 =?utf-8?B?WDFKY2VKcjFtTWVHOVBxVnpzVml5cVlPVkdNa0liWUxzNUEvRFE5VytkYytM?=
 =?utf-8?B?eXZHWnR6R1ZQZ0VxR0QvZnArOVBwVGlINHFpZ1FublVxTXI1OWFpQW4vejla?=
 =?utf-8?B?Mk1TVFduNXFLNlBWb1c4aG5EZ1l2UktsQkZINmwzU3BKK2oyWVhrOWorU0JM?=
 =?utf-8?B?a3RiZEZqL2RpczQ5eFRZSWRsS0tKbEZ1Z2xlL2NCSXk1WWpMRHJkbkIwUWs0?=
 =?utf-8?B?T20wUkErRHhlUmpaazJLdzdIRy8zTGxJK2N1ZzdPeDZSOTI1MDhiM3RpQWRm?=
 =?utf-8?B?dDNKK3kvKzlYbzB5T0ZwTTBjVUNDcW5KZkhoWUJ0bE5vektobURYeFV3Y3Vz?=
 =?utf-8?B?b0tGQmpBODY1VEdmSmFMdHJndmswaGR2S1JjdGE2U1lJUTFHSjN5UGZ1M3BQ?=
 =?utf-8?B?eHlZN2V2OXBzWHBGVjlqWjdseDRScDZPbkttSCtjUWNSUDlRU1VVUVpacmZo?=
 =?utf-8?B?WU56d20yU1ZLeFZoS3VMZUJqTUpQS0x0ZW9vdWJZWk1JVW9XV05lU05SeWND?=
 =?utf-8?B?K1hsTWpGS2RPejMvcUtTbFRybUJNd2ZjVUlVcm0yeCttcnYyZFF5RXd1dkdv?=
 =?utf-8?B?Rjh5VlQzN2hzemJWV2UxVXBQOVhTU2kwNERabjVhMWZEaHViaHVyUGdBZnEz?=
 =?utf-8?B?YWp5aHNaRGl0UHI3MytWQW9DNFpkQnJBZGlkY3lTWGEzWERFblJLeXZsMkNE?=
 =?utf-8?B?TjE0ZDFLWEZQK3UxN1RPU2hsaWxHaGx3cTNJUWlXOGdpWE45TW1mSHczTExu?=
 =?utf-8?B?NXE5UUh2bDVTTC9qaEYrbmg0UExwMlppbEFBTWN1b20vdXhQRzZOU0JCSEhu?=
 =?utf-8?B?Z1BjQlloWFR6UDFvMHFkdzhqQjA4aEY1L1A2SXQxNkdjZWEwcUpHOHozVmEw?=
 =?utf-8?B?VTdDQkVhaWVYaHNHQThTWWxHem9kdmp0MExadUQyelBIZnFOU20xK2NaWTEy?=
 =?utf-8?B?b3N1TnpTL1h4L0FsYkxwOWg0aGJZSkU4dEhzRXpsL280T21rSkNuK2hTOWdQ?=
 =?utf-8?B?RXE0YVNad2VZQ2ZKQlNmZmRFcXRoZnozdk4xd2RTT0NOQXREbXpSakJIZGE5?=
 =?utf-8?B?dVRIWU92b2pMMVlLbUVKVDZoZVlYZlI5ZnFYdDludUdZcWV6RUJ6V213TXVW?=
 =?utf-8?B?elNxbmc0dGRUelRTVlh2M1JFVUdwWTJBZ0FBL01Cd3BQR2dWU1M1cG1TazVL?=
 =?utf-8?B?VmFYbWp0UkFrRDJCZXlEWjRVWTFoamVzMmRValVPRkhNc2RuNXNJVEF6elB3?=
 =?utf-8?B?RzVjT1o5ekk2cWVnNmN6NGk5aDg1VEhaVXFpWnhqUFJsSlI0ZVRoOCtMUStL?=
 =?utf-8?B?L2ZJWW1zcENZdmZ3SXZuMlgvaVR6Zk1USVZFSTEwRU5Fdk52ME5yUnhwVy95?=
 =?utf-8?B?MEFLOG8yc3dNOXEvKzlYNWdhU1VKc2JJZmt4UWJCcnV6SjA1WjI5SHpTV2ZO?=
 =?utf-8?B?blNoUUgvS3RXbnR6bU45MmJvek1DSE5sNGRHNWt4cndteE83VTJyZUp6N1BC?=
 =?utf-8?B?S20vbjZ0amVBSEVFOXMxR1IyQTBubHhQRkFVbG5lRURUbFphS1BCSGNhMmI1?=
 =?utf-8?B?eXhVQmh0cmtkQ2poN0tBY3JVemNrSkhKVVBCZituOGJMZkZrUnNnbDIyckh2?=
 =?utf-8?B?dE40Um5KdVRoRElvdkFmZnVzVG8xSlZnZHQ3SFVudHk4YnhTdE8wTDcvYkdw?=
 =?utf-8?B?aXBlYzlVVFdBS2lZNUhTL3l2NlNxY3R0RXFrL0h4NC9NOUJmUWlzdXMrV0JW?=
 =?utf-8?B?UkIzZG4xQ2RBL01VQ1Y0YURiaG10VjBqbkpFeXVwbTU1NGxxeVExdFBSVVky?=
 =?utf-8?Q?T9tedj7lvxCUbJCw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962d15a4-da63-42c3-0daa-08da3f08991e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 11:12:18.8611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtWii/eP8raGsjsxay5b41xL1EPBpSrN09q7SwYsItkxmaJuYxY5qJfdMlFqKwqz+UdbH/d9rTIJoYlvQMqlzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6527

Hello,

Following series implements support for bus lock and notify VM exit.

Patches are not really dependent, but I've developed them together by
virtue of both features being in Intel Instructions Set Extensions PR
Chapter 9.

Thanks, Roger.

Roger Pau Monne (3):
  x86/vmx: implement Bus Lock detection
  x86/vmx: introduce helper to set VMX_INTR_SHADOW_NMI
  x86/vmx: implement Notify VM Exit

 docs/misc/xen-command-line.pandoc       | 11 ++++
 xen/arch/x86/hvm/vmx/vmcs.c             | 23 +++++++-
 xen/arch/x86/hvm/vmx/vmx.c              | 78 ++++++++++++++++++++++---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  7 +++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  | 11 ++++
 xen/arch/x86/include/asm/perfc_defn.h   |  5 +-
 6 files changed, 124 insertions(+), 11 deletions(-)

-- 
2.36.0


