Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89662467B63
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 17:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237848.412506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtBSG-0002h9-4u; Fri, 03 Dec 2021 16:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237848.412506; Fri, 03 Dec 2021 16:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtBSG-0002e7-0o; Fri, 03 Dec 2021 16:30:36 +0000
Received: by outflank-mailman (input) for mailman id 237848;
 Fri, 03 Dec 2021 16:30:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOtX=QU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mtBSE-0002BT-Pu
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 16:30:35 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5661d722-5456-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 17:30:34 +0100 (CET)
Received: from AS9PR06CA0004.eurprd06.prod.outlook.com (2603:10a6:20b:462::20)
 by AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 3 Dec
 2021 16:30:30 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::67) by AS9PR06CA0004.outlook.office365.com
 (2603:10a6:20b:462::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Fri, 3 Dec 2021 16:30:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Fri, 3 Dec 2021 16:30:29 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Fri, 03 Dec 2021 16:30:29 +0000
Received: from a79cd7973414.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FAC48ED-7CED-418A-BFF8-EADA11DAD459.1; 
 Fri, 03 Dec 2021 16:30:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a79cd7973414.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Dec 2021 16:30:13 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6688.eurprd08.prod.outlook.com (2603:10a6:102:130::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 16:30:11 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb%6]) with mapi id 15.20.4690.034; Fri, 3 Dec 2021
 16:30:11 +0000
Received: from smtpclient.apple (82.8.129.65) by
 SA0PR11CA0034.namprd11.prod.outlook.com (2603:10b6:806:d0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Fri, 3 Dec 2021 16:30:08 +0000
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
X-Inumbo-ID: 5661d722-5456-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qh5am0VjrmfVIB+arjVKc6QYJcXBkq8K24X2CYEx2Co=;
 b=e4R9lkxBlxgOOiDoXGp2rcDZspGTtlPBoAfzw7wP99Of+k9peIR1UR5p0+pDzaiofuBMGyORQTCGfkCkp2esp9LSNqNlR7QxiqnjQ5hv3XyxZpFraSbwsOyRSYL2ROu5xWPcnJttomFs3dGye2APnAIdtbDMJyBQ0HR3B3NI/es=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b4d3cf6bbf725bc7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWzAOCOHp6tWI7uVQCp4JH0XIwznor0mabk2vUcOrm579ZtD1X9u7YSQPa5HPo0+QUDcw5dJOJiWVJI1O6yZEdRdGWFjs5rFW/dFnjH6e7o+hW5GXnb6FD7nWn6FYCSFedweHA1+c5+StLeuw472WE7b1iEB3t7FeLmvO5HcXVXBOGyIXA5BZ6xqUsur43IMy8hzSpK4RwJuKTsIwsthHmhYPJfE6rxX90YybftbzviyYG0MNy0J/iaQBzPRhjc/XGOJMp4/uP6Vdyd170oJXVPbMKGMOqWlOhdIuNsA2Rqwyup0TpJTxJC/kjOl/dTItZd0l0pf+Vrk8UsfPjP0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qh5am0VjrmfVIB+arjVKc6QYJcXBkq8K24X2CYEx2Co=;
 b=D5i519QomG4IO0uK/hjxPKq0onwx6NuSnN9YblQCNvFaHrEQ2r/zlPhHLhdU5nWQO6PGOibD5RdtSYUtDPwqHt7qXam1FrIVtCCTA7ziK2O38HbnsTGajDFgBbFP41knCqNrWWLXHQZ2emHzsHqcWHLcivblF5N5c7azhH1uUVY0sL3icni3OpjbtVqiTqw9+qlR/0BYpjpobpjVditrTk4R2MqrjOqdKwldFLdBkV0rGq+7aMyysydYsA3mJkDvcPpm+H/Yl7Ddr85/wrwH87umsx0/WiDw6gq9Z6mvU8oq6YHYFiV7SypWZVm7ec4z3RwBrWVW6nJ/YbCcubh6Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qh5am0VjrmfVIB+arjVKc6QYJcXBkq8K24X2CYEx2Co=;
 b=e4R9lkxBlxgOOiDoXGp2rcDZspGTtlPBoAfzw7wP99Of+k9peIR1UR5p0+pDzaiofuBMGyORQTCGfkCkp2esp9LSNqNlR7QxiqnjQ5hv3XyxZpFraSbwsOyRSYL2ROu5xWPcnJttomFs3dGye2APnAIdtbDMJyBQ0HR3B3NI/es=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 1/5] perfc: conditionalize credit/credit2 counters
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <22325915-c51c-a091-59e2-e6e214576f80@suse.com>
Date: Fri, 3 Dec 2021 16:30:02 +0000
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: 7bit
Message-Id: <95FF4173-9435-4260-88E3-39A9BBDAA69E@arm.com>
References: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
 <22325915-c51c-a091-59e2-e6e214576f80@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: SA0PR11CA0034.namprd11.prod.outlook.com
 (2603:10b6:806:d0::9) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60c4e5a1-0583-4f9c-183b-08d9b67a3863
X-MS-TrafficTypeDiagnostic: PAXPR08MB6688:|AM0PR08MB3747:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3747D6E46A35F5DD867B4515E46A9@AM0PR08MB3747.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Q5twp5jxs6gUYm+2nkDCB+Y5G/BoYDcleHjxZ9ElqUBz+74LpojtFHfiwSvfCY1PO4XDNyHU7+6PUpNyicbsEMb2TDXkrt5N3o+H6iTj6NnBqCs0QNXdBopGLsFgkvud9h0VBtj+Oc5Mcco9CdRnElLnWjLC2NJzXoZQzKphjZQ+nU0MjZFqp8EoJ1o8kijrOWRJOd5WJu8racBPlaLLvEKLCwXjCWgtZ6ttXwnpYsn5kFVla0pprnDy5w2uiR3ILcHLdKYTdZq98XfZGnjoq5ICHUECeo9I2B0KUEOqnCoc3pmkG0EcgrNH0H0XOKSAQHqHvwkdxnU5eMxQn/lI5Srhgqu0nBZ0UFlTx8hoWH4ioZNyo00/Tx/B1aLzwJF8Kl/8V+cVOdIwnXx/rDrH0ubYydmsGwQ9LMLNKgKa0cF4uE1LwtqLCB5+ST9HniLlVjuFFAOeYH0Z3+0BQkowov+x57b56kkl0da4HSZT8+mgrzB6YHFCBxu2n6tKq5vzJKMANxR4Kn/uLdM6IqTOaV4P6P1m87y5L4TVkipIi7mWXKA6wocszX+bSRkNNVdP1dZ0/IZFAeIQ72j8s9ykEU9BcJ2OvyyBGRdP8fsvRbhjzoUsaw9XnS//FAPlSesDKKfURleB9t/L8BesCc+7WR9P1qvTjaFOlzI89F7Ry/TgUhtA6i/UKq9rKYkfdyuUCe8LkXfoIJSCpmZLz4EtaGmLRFUllXZto80HQ3DZMZop88YqYMd26Hp2Reaf9s7W
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(8936002)(66946007)(86362001)(66476007)(956004)(26005)(83380400001)(33656002)(6506007)(508600001)(5660300002)(6486002)(36756003)(8676002)(53546011)(2906002)(6666004)(52116002)(186003)(54906003)(6512007)(38100700002)(38350700002)(44832011)(6916009)(2616005)(4326008)(316002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6688
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e36eae6f-6307-4395-62e5-08d9b67a2cfc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TyFtb8UU4zJXQhdqHZoK8SfTYnMwDSnPOUh1aHQCsPUTnl/VoSfTDxgfYvISKeZ4LUEl7ninAFbRHm9c/gSrvAq5HFcpW2hV4LMBt42UO50SWh7iMu4k0EahlksCBr2DvN/l3WN+hVzxqyetAsYMCII1OCtINJXidmm/k11Vu0Mnk7t8b+Sq6p8qqwycKGl9AW+Y0ppa0xJfzpu61Fszgu5jXjVEtpnv1nlR0RjVFuxZJR8f6aw8Sk+9lXFcQhC/Nnm3IMWF2t47aVYq7sFwy2jvlGJDznG/xRcU3hhqtRET9zDusOkpRfRnAtXE8nbhazDkaiFsosPT7cI0xWdDhxCLbEYnObdEbh77FPuX5z1PxUtfOGtYAuBIjKywwzhTl1N3viUOCnkxuR03Ng7cTU0Jk55iwWCK+AG5BEz5kzAzOmyM5tcJVnl+umG9KVgR35Uye/AUd13uWJmMem3Anl0NhG8Jm1r690BoYTrSq6d5kW3NwTP1yCdky3IudLwrE3Prl027cWbXjieV7Of2aEHuDZpUmKoy/rqy3aYP34kjfYfHyIjyU9Hvw8YIh+hSRYIe08PuddZWyUrKmSwWldTyuB0ermJMUbq5YsXzPbuoIWQAWFc1gr+m9o/ARFzgaby6d2xUkP1ALl7rCywLRcRN2qr1DC56ni9oofprZoeZ5rss19K7Ec0iXHSLrU1b1z8YQkohG3MhjcqL+SpuKA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(956004)(82310400004)(33656002)(36756003)(70586007)(508600001)(336012)(26005)(4326008)(5660300002)(44832011)(86362001)(36860700001)(6862004)(70206006)(47076005)(54906003)(53546011)(81166007)(356005)(6506007)(8676002)(6666004)(186003)(316002)(8936002)(6486002)(2906002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 16:30:29.6825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c4e5a1-0583-4f9c-183b-08d9b67a3863
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3747



> On 3 Dec 2021, at 12:03, Jan Beulich <jbeulich@suse.com> wrote:
> 
> There's no point including them when the respective scheduler isn't
> enabled in the build.
> 

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xen/perfc_defn.h
> +++ b/xen/include/xen/perfc_defn.h
> @@ -37,6 +37,7 @@ PERFCOUNTER(tickled_busy_cpu,       "sch
> PERFCOUNTER(unit_check,             "sched: unit_check")
> 
> /* credit specific counters */
> +#ifdef CONFIG_SCHED_CREDIT
> PERFCOUNTER(delay_ms,               "csched: delay")
> PERFCOUNTER(acct_run,               "csched: acct_run")
> PERFCOUNTER(acct_no_work,           "csched: acct_no_work")
> @@ -58,8 +59,10 @@ PERFCOUNTER(migrate_queued,         "csc
> PERFCOUNTER(migrate_running,        "csched: migrate_running")
> PERFCOUNTER(migrate_kicked_away,    "csched: migrate_kicked_away")
> PERFCOUNTER(unit_hot,               "csched: unit_hot")
> +#endif
> 
> /* credit2 specific counters */
> +#ifdef CONFIG_SCHED_CREDIT2
> PERFCOUNTER(burn_credits_t2c,       "csched2: burn_credits_t2c")
> PERFCOUNTER(acct_load_balance,      "csched2: acct_load_balance")
> PERFCOUNTER(upd_max_weight_quick,   "csched2: update_max_weight_quick")
> @@ -77,6 +80,7 @@ PERFCOUNTER(credit_reset,           "csc
> PERFCOUNTER(deferred_to_tickled_cpu,"csched2: deferred_to_tickled_cpu")
> PERFCOUNTER(tickled_cpu_overwritten,"csched2: tickled_cpu_overwritten")
> PERFCOUNTER(tickled_cpu_overridden, "csched2: tickled_cpu_overridden")
> +#endif
> 
> PERFCOUNTER(need_flush_tlb_flush,   "PG_need_flush tlb flushes")
> 
> 
> 


