Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B86D1763359
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 12:21:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570265.891963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObdb-000531-5G; Wed, 26 Jul 2023 10:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570265.891963; Wed, 26 Jul 2023 10:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObdb-00050i-16; Wed, 26 Jul 2023 10:20:59 +0000
Received: by outflank-mailman (input) for mailman id 570265;
 Wed, 26 Jul 2023 10:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O1Wu=DM=arm.com=Hongda.Deng@srs-se1.protection.inumbo.net>)
 id 1qObdZ-00050W-0y
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 10:20:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a8413cc-2b9e-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 12:20:55 +0200 (CEST)
Received: from DUZPR01CA0163.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::25) by GV1PR08MB7986.eurprd08.prod.outlook.com
 (2603:10a6:150:9e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 10:20:52 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b3:cafe::b6) by DUZPR01CA0163.outlook.office365.com
 (2603:10a6:10:4b3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29 via Frontend
 Transport; Wed, 26 Jul 2023 10:20:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29 via Frontend Transport; Wed, 26 Jul 2023 10:20:51 +0000
Received: ("Tessian outbound f5de790fcf89:v145");
 Wed, 26 Jul 2023 10:20:51 +0000
Received: from 6b26572f93bf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8102DD6F-CDD5-4579-9E7F-F993A0B46C99.1; 
 Wed, 26 Jul 2023 10:20:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6b26572f93bf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Jul 2023 10:20:40 +0000
Received: from DU0PR08MB7664.eurprd08.prod.outlook.com (2603:10a6:10:315::5)
 by DBBPR08MB5995.eurprd08.prod.outlook.com (2603:10a6:10:20b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 10:20:37 +0000
Received: from DU0PR08MB7664.eurprd08.prod.outlook.com
 ([fe80::cab8:a6f0:2154:bfe9]) by DU0PR08MB7664.eurprd08.prod.outlook.com
 ([fe80::cab8:a6f0:2154:bfe9%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:20:37 +0000
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
X-Inumbo-ID: 1a8413cc-2b9e-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbEJPUGjsyryRbDAnuvh67rnSBq3+uUXFpvjgJi7cXM=;
 b=s4XxmSBj+48expwpTUNa51Yh3Uu5TlFidvHxcQ7iA7t3j4FRpsQ9VZ/Y9M2Sg/75ULiKiW0Iwe9piEC6hjVCczYo77+D8AjAphcgAe0JjjqmiZ32Zl5sI+pZ0q35ZXKqh+sBErZ9BQhIyIsxWrxyk1qSHss/h38qOhiwpU0w89M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b6146215ea4feee
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCx5kToR0Q5tXAyVF7XpIGPs+qrOlbpsG4TghPjLisy3ZVvowHuNjtZkbPoO3vJBAHmHXgfY1gjaWayo2U8/hMjxotqA3HzPR98tdS7ZzRd+jSjtOVBX/ADRqp5kjHvfWmZ+7a5txy/gciAbgRK/pcH/7BGYzgtdXHh8UYO3Q8QaqdxSuGkBgZNEOJeOYPA9S9Iy1mv7CE8BwzXPiXQcjvHKnAbGoE79mA7/sy8gVVeM9pIPP3Oex/5ArlbIprl/9D7KWB4rzK/8AdSWHo/XFN7M3YRTzFe1EK5iicQ1DrMDOe96GeeYZBb/pDgLg7uNU6oLPg0BjWP33iI4hPXIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbEJPUGjsyryRbDAnuvh67rnSBq3+uUXFpvjgJi7cXM=;
 b=L0XH0Ug5/DU6uIpAXlX5RukYTNwUyrMQ9Y60LnufQcN7qUex61eYZ/Ai2w/KaNRbVNwr0CEQq554kepZPNHvb85aUY1ptNcv9isKwriT2C6lu7oz72Vk/h/ne3XQ09Z15M6/8OoxGjXZ/mT8v1PAa+xbsHhTQQhSog/NSfWB+WrsKSKA9Pv8bBUnIGXn/GJuYBOsEG62kByCpInrIcxcvdzf6PBuLxIj6E2G0f5SChv3a7WbHOgbvpzQPKVTuuzvvt/u8OZ7ayRFi4kWJeRLFQ4xECFXxq3gBzkpx4QoIjM9eSQtnlaJWC+9C4yaJR14kDYHTiy8810YgVlCO71n5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbEJPUGjsyryRbDAnuvh67rnSBq3+uUXFpvjgJi7cXM=;
 b=s4XxmSBj+48expwpTUNa51Yh3Uu5TlFidvHxcQ7iA7t3j4FRpsQ9VZ/Y9M2Sg/75ULiKiW0Iwe9piEC6hjVCczYo77+D8AjAphcgAe0JjjqmiZ32Zl5sI+pZ0q35ZXKqh+sBErZ9BQhIyIsxWrxyk1qSHss/h38qOhiwpU0w89M=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <27ac40a8-4d9c-b55f-f7cc-506df8188400@arm.com>
Date: Wed, 26 Jul 2023 18:20:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/2] tools/console: Add escape argument to configure
 escape character
Content-Language: en-US
To: Peter Hoyes <peter.hoyes@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com, luca.fancellu@arm.com,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230712102917.37763-1-peter.hoyes@arm.com>
 <20230712102917.37763-2-peter.hoyes@arm.com>
From: Hongda Deng <hongda.deng@arm.com>
In-Reply-To: <20230712102917.37763-2-peter.hoyes@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:4:197::17) To DU0PR08MB7664.eurprd08.prod.outlook.com
 (2603:10a6:10:315::5)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB7664:EE_|DBBPR08MB5995:EE_|DBAEUR03FT013:EE_|GV1PR08MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c00d15-ee8c-4e28-825d-08db8dc1fcd3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xhcD2rlctzq6tbJTxiLQ5tFrcimlZZi6dcg0OegKJ3C22VKcBUpfMg75n3CZTm5TwS+DGbhLCi9JZR+iM9eTprUKf6Km6BBPRpN2qB/8xfdvsmU5eILotDWNoR64g3Sen7kJZg7bnY9cF8UqAh2WYypLAHS2GD2GwcqpToK+O/xIC1kK9dp/tkWPxKmteL8yzyGSAEiQvlYMEh1f/WrXAhl806Q1o+AinLlsvUPpZU6Q/K7EYsXya7CGItW2eONcSEoNo1++JdTErxYk/OntxuDTaruMAvj/d9pbZciAS1VIBPSyRwVs+CF4eKtcj0S4B9f0vNvlUvOddSSUMX4H/iaiL7LV7U1SI4MVooMQydlR9MrFCUes7/6Tb4dM2xqzmO8tDqD1Itkfm6oYnrb58zLAcHopWSPUnWl0mt1+wJzsedHbNnvO2HPQA5rDL+WWRtb2kpYMDK6B+Yo5olAVhKF4cA2TqADoTnJY6Cl9s0wSyyU/4AasnlJuYazCWW+WAMlhZJelcpzfRfY/leY8AERosSo5Q914LqAOGTb8eT7LWFe+A3FlkNM9HCXso0ph6xZZtaEqZUlQwmBvTeHp/g1QTL3rXkQpjdjEVRI9YWdySEm5s7Zjdl3xRt2xjf+tOuk+HRWAZEwuK3eh/QeEBA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB7664.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(6666004)(6486002)(478600001)(83380400001)(53546011)(26005)(6506007)(6512007)(4326008)(54906003)(66476007)(66556008)(66946007)(186003)(2616005)(38100700002)(31686004)(44832011)(8676002)(8936002)(5660300002)(2906002)(316002)(41300700001)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5995
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44d87275-3908-439d-00a5-08db8dc1f3e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cGQU98lfQEN5JXv64tfjLgN9Oy9TlsFOGiWV56tzFK6uuHKZnDcq/RrPbFo4bbzvMYrzwspQC3aUDoHJtCz3Urb80+iZm3sgyKd/5m884bgOEAv+SfhqrLsH65N/zNs3SANPoZ5iMMlNor3tntoR4Lautffaj4eDeNWkGHI4/pSLMBXIBxBc8SQ2Ln2m79h+AQwZE5ICOntrIudaKVIZPdVtzdFH9/8tZUsq+E4fhupUggyOgw3q9uMLGNGk5zHqbST56F2TMh0DqYP7LClG296sK+QkvDAa1qtkj3mjwVBJ8v1LBgOxkwS8aidc9eGkTybdPlSGYDRKSQzDXwIFPbNdXr3rZxTgs1/iZcYBc6UMfKJ4SIQ1NxUy+x8siR3mPZNn0DlnlxDn8NxjUC8794iihL/k9vX0v0abWhegBIGvE+6VNmul11FNsLyXahJDpcAcaREEBXKnXMa9egGOY9+yQHavrNnC6IMyEmd3Lxgx8wySv+ao01YwQft4AnJrKGGBTxhfE4qgXkrDGtwGdwHLT2TmdnNAKWQzOjwvKSbhjzM9YOFpvkO83RRa/AyndAmnT7fWuZt74VgHpLhpa+nDuI7ePpvmvTV91/a3LnjzP4sh/ZdvH5Pu6u1ywD8jcYWf+I+YRXgELsaBPYO+LeDSM0QarP3eyCPGNOfPHnd9BeKsrpUhJFAhc+l1zggZ60bINSuBjJN9pfHUdQgcaX6fGeROP5KztFwR0Cj0oQ/ymCKEyjbKldQn0/+BTyot40+R+QPCKzbyKu8PcB777g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(82310400008)(451199021)(40470700004)(46966006)(36840700001)(36756003)(86362001)(356005)(81166007)(31696002)(31686004)(82740400003)(40460700003)(40480700001)(478600001)(2906002)(54906003)(36860700001)(186003)(2616005)(26005)(6506007)(47076005)(336012)(53546011)(107886003)(41300700001)(8676002)(6666004)(6512007)(6486002)(5660300002)(44832011)(316002)(4326008)(70586007)(83380400001)(8936002)(70206006)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:20:51.2981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c00d15-ee8c-4e28-825d-08db8dc1fcd3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7986


On 2023/7/12 18:29, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>
> Dom0 may be accessed via telnet, meaning the default escape character
> (which is the same as telnet's) cannot be directly used to exit the
> console. It would be helpful to make the escape character customizable
> in such use cases.
>
> Add --escape argument to console tool for this purpose.
>
> Add argument to getopt options, parse and validate the escape character
> and pass value to console_loop.
>
> If --escape is not specified, it falls back to the existing behavior
> using DEFAULT_ESCAPE_SEQUENCE.
>
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> ---
> Changes in v5:
> - Add this changelog
>
> Changes in v4:
> - Improve validation of the escape_character optarg
>
> Changes in v3:
> - Re-add the Reviewed-By tag accidentally removed in v2
>
> Changes in v2:
> - Drop the tags intended only for internal use at Arm
>
>   tools/console/client/main.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/tools/console/client/main.c b/tools/console/client/main.c
> index 6775006488..d2dcc3ddca 100644
> --- a/tools/console/client/main.c
> +++ b/tools/console/client/main.c
> @@ -42,7 +42,7 @@
>   #include <xenstore.h>
>   #include "xenctrl.h"
>   
> -#define ESCAPE_CHARACTER 0x1d
> +#define DEFAULT_ESCAPE_CHARACTER 0x1d
>   
>   static volatile sig_atomic_t received_signal = 0;
>   static char lockfile[sizeof (XEN_LOCK_DIR "/xenconsole.") + 8] = { 0 };
> @@ -77,6 +77,7 @@ static void usage(const char *program) {
>   	       "  -n, --num N      use console number N\n"
>   	       "  --type TYPE      console type. must be 'pv', 'serial' or 'vuart'\n"
>   	       "  --start-notify-fd N file descriptor used to notify parent\n"
> +	       "  --escape E       escape sequence to exit console\n"
>   	       , program);
>   }
>   
> @@ -174,7 +175,7 @@ static void restore_term(int fd, struct termios *old)
>   }
>   
>   static int console_loop(int fd, struct xs_handle *xs, char *pty_path,
> -		        bool interactive)
> +			bool interactive, char escape_character)
>   {
>   	int ret, xs_fd = xs_fileno(xs), max_fd = -1;
>   
> @@ -215,7 +216,7 @@ static int console_loop(int fd, struct xs_handle *xs, char *pty_path,
>   			char msg[60];
>   
>   			len = read(STDIN_FILENO, msg, sizeof(msg));
> -			if (len == 1 && msg[0] == ESCAPE_CHARACTER) {
> +			if (len == 1 && msg[0] == escape_character) {
>   				return 0;
>   			}
>   
> @@ -335,6 +336,7 @@ int main(int argc, char **argv)
>   		{ "help",    0, 0, 'h' },
>   		{ "start-notify-fd", 1, 0, 's' },
>   		{ "interactive", 0, 0, 'i' },
> +		{ "escape",  1, 0, 'e' },
>   		{ 0 },
>   
>   	};
> @@ -345,6 +347,7 @@ int main(int argc, char **argv)
>   	console_type type = CONSOLE_INVAL;
>   	bool interactive = 0;
>   	const char *console_names = "serial, pv, vuart";
> +	char escape_character = DEFAULT_ESCAPE_CHARACTER;
>   
>   	while((ch = getopt_long(argc, argv, sopt, lopt, &opt_ind)) != -1) {
>   		switch(ch) {
> @@ -375,6 +378,16 @@ int main(int argc, char **argv)
>   		case 'i':
>   			interactive = 1;
>   			break;
> +		case 'e':
> +			if (optarg[0] == '^' && optarg[1] && optarg[2] == '\0')
> +				escape_character = optarg[1] & 0x1f;
> +			else if (optarg[0] && optarg[1] == '\0')
> +				escape_character = optarg[0];
> +			else {
> +				fprintf(stderr, "Invalid escape argument\n");
> +				exit(EINVAL);
> +			}
> +			break;
>   		default:
>   			fprintf(stderr, "Invalid argument\n");
>   			fprintf(stderr, "Try `%s --help' for more information.\n",
> @@ -493,7 +506,7 @@ int main(int argc, char **argv)
>   		close(start_notify_fd);
>   	}
>   
> -	console_loop(spty, xs, path, interactive);
> +	console_loop(spty, xs, path, interactive, escape_character);
>   
>   	free(path);
>   	free(dom_path);

Nice work~

Reviewed-by: Hongda Deng <hongda.deng@arm.com>


