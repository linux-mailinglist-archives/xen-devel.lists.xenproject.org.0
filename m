Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0790741DE74
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 18:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200076.354464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVyck-00078G-5i; Thu, 30 Sep 2021 16:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200076.354464; Thu, 30 Sep 2021 16:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVyck-00075w-2c; Thu, 30 Sep 2021 16:09:30 +0000
Received: by outflank-mailman (input) for mailman id 200076;
 Thu, 30 Sep 2021 16:09:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v5L4=OU=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mVycj-00075q-2Z
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 16:09:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c93859c9-2208-11ec-bd59-12813bfff9fa;
 Thu, 30 Sep 2021 16:09:27 +0000 (UTC)
Received: from DB6PR0301CA0052.eurprd03.prod.outlook.com (2603:10a6:4:54::20)
 by AM6PR08MB4182.eurprd08.prod.outlook.com (2603:10a6:20b:ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 16:09:20 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::ab) by DB6PR0301CA0052.outlook.office365.com
 (2603:10a6:4:54::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 16:09:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 16:09:19 +0000
Received: ("Tessian outbound c21c48fbc857:v103");
 Thu, 30 Sep 2021 16:09:19 +0000
Received: from 8ecf0c33fb25.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3F5306B8-6B91-4CB9-82D8-DD5E0486C22A.1; 
 Thu, 30 Sep 2021 16:09:07 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ecf0c33fb25.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Sep 2021 16:09:07 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR2PR08MB4745.eurprd08.prod.outlook.com (2603:10a6:101:1a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 16:09:05 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 16:09:05 +0000
Received: from smtpclient.apple (217.140.106.55) by
 LO4P123CA0058.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:153::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 16:09:05 +0000
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
X-Inumbo-ID: c93859c9-2208-11ec-bd59-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfvFlHQbUs9B4O1IsuZ2sz6yZd7cM0C64X4xZDlnGJM=;
 b=VCsK7eA12xqUuTUsEIKE1ROYdqI0xzNKFhAmWVGcItdT3OzSThoUtL1dLthJpT+FZSa6rcovawnvtVVCmPbeb2vosqIYsOjaFCzxARzQreVFuJoTqNWMdDHLsi2/b1T4uZ1ytuXniAr8ir/tTbjl3jnHLXdFpW6dTJIpA8q451I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c61d9c83a9056149
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=facK5Jhf0mhGT7N+saymLPcHeo4Nn84HnE4eTaZXpTXKt9Zjs3crEHAZnmczwgTMVAHk+VDEKSAo90S80MMyIm10mZczdae/BuEpMBBVjoKFnVuWTB6haECMItp5VoUSuX1wCNWwR3Wo0t/hEnWJ0giHe00TZ5+F28XFnL1Aahm+UOlRsSh4HYyEoLznfFIv3YbVsFjdzgbCncnVklcqPhksxgs/7hdPylxHaXCwsaU6/fEmTaKyJ6c3KnX7fxZmLor4c4HH+NG40uKoeZ2fhBsPOaqqyl9WCUjt1USVcfH8g4vCtZl+JflDninh0URU7HJZ77wQYsSE5+5abOpWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=DfvFlHQbUs9B4O1IsuZ2sz6yZd7cM0C64X4xZDlnGJM=;
 b=PjUJFpeK9HG0aagrvYz5rY2/2G2s7ggLn8hToAbKLVGw/XaricYQh2rBg+27w7iqhQbb1nNwS9Zml5q0h74QepgBVWtyzjQmqilPkaLpze0g1FKyPg4BZoiMzP3RQQXSA38h8JvWwkSKFQLOwElR33iKESBCZe/0xT8PzZ3C0o2HeTM6kiPSXQ0db+qLnFyKHGanmV8tgw48HEkGsPMXgKZPNVY2/OUEQrk8G/zervzx9sv7T15OWogV3ekfXziRTDP5XvYx9/lVLQ8+nWwFpHrASigNC1yWHOrDEngyxEUxDPWzyP3BppuFMki/2K+EX6ofXbU+r4faPsu9DSwrBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfvFlHQbUs9B4O1IsuZ2sz6yZd7cM0C64X4xZDlnGJM=;
 b=VCsK7eA12xqUuTUsEIKE1ROYdqI0xzNKFhAmWVGcItdT3OzSThoUtL1dLthJpT+FZSa6rcovawnvtVVCmPbeb2vosqIYsOjaFCzxARzQreVFuJoTqNWMdDHLsi2/b1T4uZ1ytuXniAr8ir/tTbjl3jnHLXdFpW6dTJIpA8q451I=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v2 1/3] include/public: add possible status values to
 usbif.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210929074620.28495-2-jgross@suse.com>
Date: Thu, 30 Sep 2021 17:09:02 +0100
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: 7bit
Message-Id: <4EB52D64-766F-485F-9B24-D213E8B8BC49@arm.com>
References: <20210929074620.28495-1-jgross@suse.com>
 <20210929074620.28495-2-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0058.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::9) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9afb4cf-5e67-4c3d-a2d2-08d9842ca90c
X-MS-TrafficTypeDiagnostic: PR2PR08MB4745:|AM6PR08MB4182:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4182FE5C06A32BEB54F11254E4AA9@AM6PR08MB4182.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AGmPcCaodY5m3XE8qBdv8cprNUQnhLH74qwypERvZKNuLQ3055+VG933N3YOju3soTActWDt3EWJkMCW2d0Xx3eDrbqYqgRaPyZs8nbZadKCYkbKbnFxk5dIGzE6Np4ew1Eqz5sM8m8WkGCCKxO3+fkmh5yIn+YmX+79W5GQk/1kOOY1bp5kZp47zQqH3G0zHWooP53kgvBt+FIC79wGHuyoeHkgxIRQRbWH4N8fKQe9I0auCJYO4KqvjlVsRW5m3XHKPsbzr52NBQch25ILXTwQ0OsJ0PD2KQ5hz2ZLTt+m3tUdVU9mYld11sncxArWorqir9h1JBVv0xgxn5Y6ml0oi2xeyVSrKeN4EIijT19aaQMW6E8mW9WdrgZX5p1fNd4BJ9MZhMsMD4hd4WGQtteQHzG1WOJzwwiO0ZfSdJjYyEmXYQGIFsgRUbyS2dHFiJBDRxwuXazXaWWysypX5GtAtpNDzigPlqncuomweUC8PvWViOLiHrJoHXjtCoaj6eJ6aZauHXl+NEE6WeVKji2AyI+SGvfdLMT4e8WrvyYYxlp3ZHDoULzcal+l2SjQJP/QgLwzVy0rwRTuyPuEVPaWWoZ7xUw9ag7DanZUTW72iMuxj5U8HVryiu8Trtqb1KG3sX+NWQcHsiN7z+tKAyKrt6IXs1MbRD1s1Ouog60Z6Chyxj0wqnxKKJqwWlMfN7eK+wIrCY0OI4MNC4x0+6UayYLxCGatJL0dJRV15JU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(8676002)(6916009)(26005)(5660300002)(2906002)(66946007)(8936002)(44832011)(33656002)(186003)(6512007)(956004)(38350700002)(66556008)(316002)(66476007)(6506007)(52116002)(53546011)(2616005)(83380400001)(86362001)(36756003)(4326008)(6666004)(6486002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4745
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f05700d-7826-4559-a8c1-08d9842ca065
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YQxO9CuvrGbVWWtGM9TMbNpLb+tENYgZ80d5dX+186TvXUKY7IXl4iVPXxfXoq7lcuTxyJl9mqmQzsynB1tCPSQIoXRArlL1Z8HJorfGzEiHEm8ny2TZt0aUjuRsH9whjIuIRsf4b7SacOgpUfK6u38ovHaEVgMRD5e2FMKQ+YHXuenp27GScfmozam/jl/sL6GptstnZ60QpXFtKJ8wBHZTfSg+Vm3PDHEJhHT6CY/aAVQIQAu9xTwBaXOa7KBLUmoeYpBB/nrG//1wgU/tncx7Cdz+tGVqR4V5Qdthn+vg1WVv94ledrIx4DkEz3im3wLIGNGlYWWN4fhp2QxJDP58RcJSg/9WRILjyGlrjjJd9R8XDfkl3OOOP9jGrY8pwxzFuGsqZ9LpS4LBdhqa3OmHNxvU4xiKiznMrbVAg9KAuVXKaVvkUFoe7uBadwKW1B0n1YAO3l3qDdsXVr3CuQo+Qvmrkxn4zohrIpK9eDnRH8a8JcRweQI44gTyA+yDRRz53EbirJRg9oE08O2EfVDWGoam+3EGq9GCe/xI9vrB8kQuK2HIXUbRUi50YNlFB0B4ybbOaaYq9//B56Sb2cGfZ25yECyLjdp5DS6HAUso2izWakDZwaK6dawtxHogYKWXkqZjPGZ1kkbn5iZniix5mZHd7kadMhd3vg5UIE6nayelg2vaAkInxYjYQREspL/jwcPZF7H+W6H1Ze4nbg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6486002)(44832011)(4326008)(6512007)(33656002)(36860700001)(6862004)(508600001)(8936002)(5660300002)(47076005)(316002)(8676002)(356005)(81166007)(2906002)(82310400003)(86362001)(6666004)(26005)(186003)(2616005)(956004)(36756003)(336012)(6506007)(53546011)(83380400001)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 16:09:19.9180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9afb4cf-5e67-4c3d-a2d2-08d9842ca90c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4182



> On 29 Sep 2021, at 08:46, Juergen Gross <jgross@suse.com> wrote:
> 
> The interface definition of PV USB devices is lacking the specification
> of possible values of the status field in a response. Those are
> negative errno values as used in Linux, so they might differ in other
> OS's. Specify them via appropriate defines.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> V2:
> - add parentheses to macro values (Jan Beulich)
> ---
> xen/include/public/io/usbif.h | 7 +++++++
> 1 file changed, 7 insertions(+)
> 
> diff --git a/xen/include/public/io/usbif.h b/xen/include/public/io/usbif.h
> index c6a58639d6..96b9fb661d 100644
> --- a/xen/include/public/io/usbif.h
> +++ b/xen/include/public/io/usbif.h
> @@ -221,6 +221,13 @@ struct usbif_urb_response {
> 	uint16_t id; /* request id */
> 	uint16_t start_frame;  /* start frame (ISO) */
> 	int32_t status; /* status (non-ISO) */
> +#define USBIF_STATUS_OK		0
> +#define USBIF_STATUS_NODEV	(-19)
> +#define USBIF_STATUS_INVAL	(-22)
> +#define USBIF_STATUS_STALL	(-32)
> +#define USBIF_STATUS_IOERROR	(-71)
> +#define USBIF_STATUS_BABBLE	(-75)
> +#define USBIF_STATUS_SHUTDOWN	(-108)
> 	int32_t actual_length; /* actual transfer length */
> 	int32_t error_count; /* number of ISO errors */
> };
> -- 
> 2.26.2
> 
> 


