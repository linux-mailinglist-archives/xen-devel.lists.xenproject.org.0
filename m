Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EEE4E510F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 12:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293847.499323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWytV-0004bc-Jb; Wed, 23 Mar 2022 11:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293847.499323; Wed, 23 Mar 2022 11:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWytV-0004Yg-FI; Wed, 23 Mar 2022 11:11:13 +0000
Received: by outflank-mailman (input) for mailman id 293847;
 Wed, 23 Mar 2022 11:11:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7r0c=UC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nWytT-0004Ya-CK
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 11:11:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec943185-aa99-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 12:11:02 +0100 (CET)
Received: from DB3PR08CA0022.eurprd08.prod.outlook.com (2603:10a6:8::35) by
 AM6PR08MB5205.eurprd08.prod.outlook.com (2603:10a6:20b:ee::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.16; Wed, 23 Mar 2022 11:10:58 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::fd) by DB3PR08CA0022.outlook.office365.com
 (2603:10a6:8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Wed, 23 Mar 2022 11:10:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Wed, 23 Mar 2022 11:10:58 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Wed, 23 Mar 2022 11:10:58 +0000
Received: from 60fa3cf99eae.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 494A2E45-BC4F-4525-B5FF-DC798BEE4C99.1; 
 Wed, 23 Mar 2022 11:10:51 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 60fa3cf99eae.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Mar 2022 11:10:51 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM5PR0801MB1956.eurprd08.prod.outlook.com (2603:10a6:203:4b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 11:10:46 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 11:10:46 +0000
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
X-Inumbo-ID: ec943185-aa99-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnfH39a5IFLykrlZuM9gfbuHOTbcItj5VeWY+wzlayg=;
 b=kC2bm/e2koTyRnGnHH0tYkTq6Jjoim41YOLdvKAeIxuMV5VyikA9FQy7968WDp9IZ6aoBF+0IuryMpzbnwIWtwdATffR7QY+bfLkLv/ITUg+gmKtYgh/XRu6GBomRbUxasvkXr6u8J92u+GtExom1u12Zs1gUqVQP9KchwFMfVw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22d1cda756ecea24
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N80MnU+Biy9Z8qZKVWzqbLbbUyLIuMdn86+2gLww6Z+nVZG/7pRPAGH6b1ILG2QJUJYKZfLDRCTahHHKjnrg1MVIylztwW6NP6d4YEa7MNCz2ZYCRiAbNIbFrKfOqBa/Anx7h4eruxabkb3TL5h8ntgwGBQXX+ZfBRV6Y8J0PFGhWai7Hrn2ojfpFFdkU5b8KicLhM1ZyELCtjdyGI2lyBDS6VcdLDRmLEXFS+g679l4sK2uA1VS567gptM8BLpA8WUZY4aQKnC0SBEeWFXaaVLrxsUfc2KwN0cPLsHd6JBpPLj1XAlXeTjcm44lr5dliiF/e3xyB4bF3aMX7ZBLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnfH39a5IFLykrlZuM9gfbuHOTbcItj5VeWY+wzlayg=;
 b=N4Pa0T+LTlQTfgXH7Xf+l/oXrVSJWQyQsOV4oJTfTAh8a4ieHzqzehnBoRWRLzn6PEND/16qgrYI2QHC0QYgmbK0DBDKDgxabfgmOL7dzuYVif0J5VsbQk4C3/rFMRGRB//Mlodc60VcyYhYiumW4ms2TDr/3DtaAOaSuYM0kIpvfITtmvPcrRvAAoAVowfxGDjTm4HMFsTmEkeDdIn5MkUh+UvHZE3S4Zw3Q+HkNmlX1UWeJleBhINsKsCETSzk009jY5E8odxIToY6Ajrt866hxCwutReEfrCMb3x1tTArWlrb89z0iAhdjg1HYL9WKJ+JLS7O88IBwp3I+UqwhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnfH39a5IFLykrlZuM9gfbuHOTbcItj5VeWY+wzlayg=;
 b=kC2bm/e2koTyRnGnHH0tYkTq6Jjoim41YOLdvKAeIxuMV5VyikA9FQy7968WDp9IZ6aoBF+0IuryMpzbnwIWtwdATffR7QY+bfLkLv/ITUg+gmKtYgh/XRu6GBomRbUxasvkXr6u8J92u+GtExom1u12Zs1gUqVQP9KchwFMfVw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] include/public: add command result definitions to
 vscsiif.h
Thread-Topic: [PATCH v2] include/public: add command result definitions to
 vscsiif.h
Thread-Index: AQHYPpQ58aXPwYTvBkyN7CpMP587w6zM0CCA
Date: Wed, 23 Mar 2022 11:10:46 +0000
Message-ID: <C69C67B6-4959-4594-A32B-78044CB0EDB2@arm.com>
References: <20220323085831.27057-1-jgross@suse.com>
In-Reply-To: <20220323085831.27057-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 783f4581-3911-4ca8-bf56-08da0cbdcebd
x-ms-traffictypediagnostic:
	AM5PR0801MB1956:EE_|DB5EUR03FT018:EE_|AM6PR08MB5205:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB52059FE495D9E7095B924C03E4189@AM6PR08MB5205.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 czFs6ATG1E8opR6VvXfzfRMMDEj+i7Evbwe0NMOLiX0+sLxJpUjMLyP8lypgHYDPHU0Way34A7ekxAsRY7WgZ+y/PurmmiZ374bUG6aKq0c9t+MmEYYyU/3u/fZQ/mlbAC2EBmBNZDSUpyXAvIAtkgVg8bqhd6JlDO2lFLmEmZz9XKK1CKc8jkiO0Iv6sAehSNp/IXpu0MyyOgJg3KP+Op6C8ncg3RbJcQb+NKI5a7eMsOciZf79YBRggPT5DzKp5ygcntt/rpDikSpjI6DNRNwfUGvSlLIgYVFtdegMN75//sR/AFW5rTzNhyr0NNNIfq8k61f7QedI5gs8E6+0zUd7D849DLl/Vmn4jrMDa5yeXudZ8hJL2cabtwDjREKcP32ysFnsr/PQRoEtBUn8GbwnI8esp33b8gbaf0DjDq0Z7gLc4SpdJryhkHTLY6bjO2EZc0Xhyv6zEEgptdNPNNNdjosMo2uIW/7hl/ZS0tlTva5aSV2u+fgDZhjYTwbuDjrwURFE1W6Bb2QnBa1mmesVjKUpMvhZDGG2erwjlMtq6je+6aG2TU6TRfHKgNFVPyr9AGBYuJ7zLMje9NfHPA+0QiRwM/hoDJE1O79XWsM1YlHlkXtuozyINHgL5y4+3ycfuwfcLdSnm2b8VmkVyzDb0v18ksZgrnKkq2G3Uq0zCQq+ODjCvM/0LEOuRUxDspykxugz/09aEDTYRwsXoKxOfKpvSDzSKvNvN4kCiO0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(4326008)(2906002)(66476007)(8676002)(91956017)(66946007)(66446008)(186003)(26005)(5660300002)(2616005)(8936002)(66556008)(64756008)(38070700005)(83380400001)(33656002)(122000001)(71200400001)(6486002)(86362001)(316002)(6916009)(36756003)(6512007)(38100700002)(508600001)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <587A3F93779E344F9D4F8F1DA85C74DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1956
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8dddecb-d9a6-462a-21fb-08da0cbdc785
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N1Ic0ev6X92KuocKOijybypNiwshGDexKxwp4thEhu1ypCMfUuv1sTgwPHW+Onh+TZWfy2G4U79abxn7LxagYHtG1m7c05iQTXucr+s6+USsYGOfKgHWxB0X2TTMXQn38mWYZCPkl6mV4nJU0R5b8/JSXMlcj50KA1LFu+J87QoRsx4eTscBgCxiUzT8oKSDZm8cQ9fJ6oWGLxyMhQUoww+qXvFCxN3+LqQKwRtRW8BhcKtWT6isGQDMOeO0kUuTO0E17MG8t+rI1/Ftuvayp/wqx4jyzdwWp1eZPWsO/htLPqSZq+EHy74QaXWMNDIbTn3R0XJLonWfqfYceytrxDypF6UaQGZsz+a02sfSWIqtvuoRGWNXxjxT/jM/vkTyiLGOsHtpxMLjOQ4pdVoPKO7CkuxEfyANryPNBKIRGjMmuyBSbVL/mC5XtQRuSecwtAEFdB7bFKAH+HSicU9Okj8gWxkx+DjT0pre7/HlOoGUtHb2Ooptb2VWBAfalXrBNtLi0fk/PIQAOZuZRLHwKUXSVDK24cTx/U6FtLSjaq10aATVemHIiE9IWklNBLO+h54FKmkcBs6tOnpu9S0u8Sd2CnMCHjSPKiOyyof2lR5kIAIg2KWvVU9FoRj/TMC7CWEpxUX12Zx9P+QD7Bi57yei1my5QwhqnrUP3vkNDWwoubVUG64BcOYmNoO5p05O
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36756003)(2616005)(36860700001)(40460700003)(2906002)(5660300002)(316002)(83380400001)(81166007)(356005)(186003)(26005)(336012)(4326008)(8936002)(70586007)(70206006)(6862004)(6512007)(6486002)(508600001)(47076005)(33656002)(86362001)(6506007)(82310400004)(8676002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 11:10:58.3240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 783f4581-3911-4ca8-bf56-08da0cbdcebd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5205



> On 23 Mar 2022, at 08:58, Juergen Gross <jgross@suse.com> wrote:
>=20
> The result field of struct vscsiif_response is lacking a detailed
> definition. Today the Linux kernel internal scsi definitions are being
> used, which is not a sane interface for a PV device driver.
>=20
> Add macros to change that by using today's values in the XEN namespace.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - put macro parameters in parentheses (Jan Beulich)
> - correct XEN_VSCSIIF_RSLT_HOST() (Jan Beulich)
> - more verbose result defines (Jan Beulich)
> - add reset result defines (Jan Beulich)
> ---
> xen/include/public/io/vscsiif.h | 51 +++++++++++++++++++++++++++++++++
> 1 file changed, 51 insertions(+)
>=20
> diff --git a/xen/include/public/io/vscsiif.h b/xen/include/public/io/vscs=
iif.h
> index c9ceb1884d..8553b17cc6 100644
> --- a/xen/include/public/io/vscsiif.h
> +++ b/xen/include/public/io/vscsiif.h
> @@ -315,6 +315,57 @@ struct vscsiif_response {
> };
> typedef struct vscsiif_response vscsiif_response_t;
>=20
> +/* SCSI I/O status from vscsiif_response->rslt */
> +#define XEN_VSCSIIF_RSLT_STATUS(x)  ((x) & 0x00ff)
> +
> +/* Host I/O status from vscsiif_response->rslt */
> +#define XEN_VSCSIIF_RSLT_HOST(x)    (((x) & 0x00ff0000) >> 16)
> +#define XEN_VSCSIIF_RSLT_HOST_OK                   0
> +/* Couldn't connect before timeout */
> +#define XEN_VSCSIIF_RSLT_HOST_NO_CONNECT           1
> +/* Bus busy through timeout */
> +#define XEN_VSCSIIF_RSLT_HOST_BUS_BUSY             2
> +/* Timed out for other reason */
> +#define XEN_VSCSIIF_RSLT_HOST_TIME_OUT             3
> +/* Bad target */
> +#define XEN_VSCSIIF_RSLT_HOST_BAD_TARGET           4
> +/* Abort for some other reason */
> +#define XEN_VSCSIIF_RSLT_HOST_ABORT                5
> +/* Parity error */
> +#define XEN_VSCSIIF_RSLT_HOST_PARITY               6
> +/* Internal error */
> +#define XEN_VSCSIIF_RSLT_HOST_ERROR                7
> +/* Reset by somebody */
> +#define XEN_VSCSIIF_RSLT_HOST_RESET                8
> +/* Unexpected interrupt */
> +#define XEN_VSCSIIF_RSLT_HOST_BAD_INTR             9
> +/* Force command past mid-layer */
> +#define XEN_VSCSIIF_RSLT_HOST_PASSTHROUGH         10
> +/* Retry requested */
> +#define XEN_VSCSIIF_RSLT_HOST_SOFT_ERROR          11
> +/* Hidden retry requested */
> +#define XEN_VSCSIIF_RSLT_HOST_IMM_RETRY           12
> +/* Requeue command requested */
> +#define XEN_VSCSIIF_RSLT_HOST_REQUEUE             13
> +/* Transport error disrupted I/O */
> +#define XEN_VSCSIIF_RSLT_HOST_TRANSPORT_DISRUPTED 14
> +/* Transport class fastfailed */
> +#define XEN_VSCSIIF_RSLT_HOST_TRANSPORT_FAILFAST  15
> +/* Permanent target failure */
> +#define XEN_VSCSIIF_RSLT_HOST_TARGET_FAILURE      16
> +/* Permanent nexus failure on path */
> +#define XEN_VSCSIIF_RSLT_HOST_NEXUS_FAILURE       17
> +/* Space allocation on device failed */
> +#define XEN_VSCSIIF_RSLT_HOST_ALLOC_FAILURE       18
> +/* Medium error */
> +#define XEN_VSCSIIF_RSLT_HOST_MEDIUM_ERROR        19
> +/* Transport marginal errors */
> +#define XEN_VSCSIIF_RSLT_HOST_TRANSPORT_MARGINAL  20

Hi Juergen,

Would it makes sense to define the values in hex like in include/scsi/scsi_=
status.h
so that they are more easy to compare?

However this looks good to me,

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


> +
> +/* Result values of reset operations */
> +#define XEN_VSCSIIF_RSLT_RESET_SUCCESS  0x2002
> +#define XEN_VSCSIIF_RSLT_RESET_FAILED   0x2003
> +
> DEFINE_RING_TYPES(vscsiif, struct vscsiif_request, struct vscsiif_respons=
e);
>=20
>=20
> --=20
> 2.34.1
>=20
>=20


