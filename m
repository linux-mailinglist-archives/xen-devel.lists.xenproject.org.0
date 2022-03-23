Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1F64E513F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 12:23:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293855.499345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWz4b-0006iz-Qk; Wed, 23 Mar 2022 11:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293855.499345; Wed, 23 Mar 2022 11:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWz4b-0006gZ-NB; Wed, 23 Mar 2022 11:22:41 +0000
Received: by outflank-mailman (input) for mailman id 293855;
 Wed, 23 Mar 2022 11:22:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7r0c=UC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nWz4a-0006gT-9e
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 11:22:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8baeeeda-aa9b-11ec-a405-831a346695d4;
 Wed, 23 Mar 2022 12:22:38 +0100 (CET)
Received: from AM6P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::14)
 by DB8PR08MB4155.eurprd08.prod.outlook.com (2603:10a6:10:a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 11:22:34 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::57) by AM6P191CA0001.outlook.office365.com
 (2603:10a6:209:8b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Wed, 23 Mar 2022 11:22:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Wed, 23 Mar 2022 11:22:33 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Wed, 23 Mar 2022 11:22:33 +0000
Received: from 77a1b25287dd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 060DFE96-07AD-439D-8B1C-AA52D7D6767D.1; 
 Wed, 23 Mar 2022 11:22:26 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77a1b25287dd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Mar 2022 11:22:26 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by HE1PR0801MB1868.eurprd08.prod.outlook.com (2603:10a6:3:49::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Wed, 23 Mar
 2022 11:22:24 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 11:22:24 +0000
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
X-Inumbo-ID: 8baeeeda-aa9b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMMnRqUdSLAII8BEb726B5nyV33KdTyQIWi8LvAlR1I=;
 b=6rqhzlvoYBpxKUKEybkljyScSYLIjbk4jM94UqNmCSAVvsGao5zxoO7gY7xw46jcMLr0NBr3/Bu1bAS0hw00Fu0rFBoAMSc5PGuybHIFe7ZIWxlgSjxcOm40m5Wbpocsqf6skBkRcW1vMZOm5KUtDvtNwnJkFu8G216tYI+GmMg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae1d9c063dc6ad1d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4lys+t86Ih0zB0/pz2BFPb0IXPa03Yv2fOMOtsxqt2tVTXF8jbKmwvzuXbvLYEi15zjSKv+uU1Ma5WIIPvLfyAy9PBlysOmZz0fbOUERjkD+4ydCHj5+X+zjEoefG0aZ7OVkDYizfhoVo86UiMd/+rTNL5vyjOYe5wL7OgXSuuA/t50wTotUfMPdUIksyC9Ok3mMLpyQCyePCzybefwPZcTtOxMgBjBwevlkAI6XLkE6nsLoV7uzHBeBKGtPtSiLPL8rf1nwn2wWS2C895nHHg7HOBXLukcDMk9pYNIzI/Xf4y0NsA1xx0AyKxpz2S6V2txaO6bBYW9lJkOuYRzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMMnRqUdSLAII8BEb726B5nyV33KdTyQIWi8LvAlR1I=;
 b=Y3uzWXQcaF4WzRXCv22VBtB918jNxdIeaLsYUCDxuLZEoy+h/ZFLdHi1u2HPZcJX4NWPv6KHrmRxKvdV7Qi/UqMJ5VdoIT9OXiXM42WCmCta6lNrRjqGfVVMqCSIBh0z1zq2o8Go0LT4+S3BHhFnxxrBohocCGxHiiwKS2BfsWQXnL9XA02ZkY6mfYsqPZWnmdrnqJTxTI4YknIDK4VP4knruwXSGucmOJyU8KHdilCdk7bb1gZboVkv1oN+CqiwbytAuTo9j38d4wVdILpF44z8e3iG7OC0kjalSIrSxTKnE4yiWEiqmGo0cOah9F03D9tkEqyN3cKxxcU6h/MwTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMMnRqUdSLAII8BEb726B5nyV33KdTyQIWi8LvAlR1I=;
 b=6rqhzlvoYBpxKUKEybkljyScSYLIjbk4jM94UqNmCSAVvsGao5zxoO7gY7xw46jcMLr0NBr3/Bu1bAS0hw00Fu0rFBoAMSc5PGuybHIFe7ZIWxlgSjxcOm40m5Wbpocsqf6skBkRcW1vMZOm5KUtDvtNwnJkFu8G216tYI+GmMg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] include/public: add command result definitions to
 vscsiif.h
Thread-Topic: [PATCH v2] include/public: add command result definitions to
 vscsiif.h
Thread-Index: AQHYPpQ58aXPwYTvBkyN7CpMP587w6zM0CCAgAADQIA=
Date: Wed, 23 Mar 2022 11:22:24 +0000
Message-ID: <E1CB4644-C2B7-428F-A3F5-AD15681A0E01@arm.com>
References: <20220323085831.27057-1-jgross@suse.com>
 <C69C67B6-4959-4594-A32B-78044CB0EDB2@arm.com>
In-Reply-To: <C69C67B6-4959-4594-A32B-78044CB0EDB2@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e6e8dd7e-3cc4-44e2-a49d-08da0cbf6d24
x-ms-traffictypediagnostic:
	HE1PR0801MB1868:EE_|VE1EUR03FT061:EE_|DB8PR08MB4155:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB41552A21BC5142A2E75E0139E4189@DB8PR08MB4155.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bSaKnTGDcpplX96Gj8/7GsBKXNJc5/jE5ivJ6DuzzM9f3zfR4aqqx8foLPA06CukDdIwZQYIqp2gm9jU6O2SvgV+pQ3foczVPEdtIZy5VuhpkFK3UDtDKLpVHCdqdAqwAOrFPM9i62kLdTx145DOEPZUFdqG+iGRf7+t1OlIKO37v9cz3tB4klo4DFa9PS6x/C8TJED1nQiZc8Y84KI3PGKXf4Db/+zn7CfVnI2z/5ZdJ0GqCm9myKCKNSiz//9XUx5Hmji8BCB63GzePmQPeGrPjyGmvpzHW0sNc6rTShbq3Vk989kO5PqRmCLMcmKmcRBGeB8+bnnw4InMMsnenUCYvH1HYno0IPLpf8mpVqQa3yzGpIsioLa4q9orOT8icgl4tPwSwnjRmHxKToftqgQ21zhqJZOZDJYzzF+hzJdn8lLsQdO5ihibAMK/fr23YvBkRaFeg/fEVUWNLZ5M+w9cCYA2WJMiCsic49lmb/dxvl5pASqiSGcwhM284jxr6aSrGxJH3VjMwRZVzF4QnvVrsxwDVL729VzHRQjHiqd0b/ljlY6fA5b+8QjaOyGizlfItf3tMuTue2sS/raPjtIWwIvoBWXvkYfhY0a0aoHQueyvr5XrPTldnLOlkMakb87QGlrs+snl71ywHP5pThxazWTLPwGixQnObueg1FFxfFSpqi/v3p0zGUmNobdTByNR83ESZ/ctjBhBaKIBj/R9N6nRglql7532pUNT4ALOBoiqU5cq1Lkb01QhmnzK
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(71200400001)(76116006)(8676002)(6512007)(8936002)(38070700005)(122000001)(66556008)(66446008)(64756008)(508600001)(66476007)(4326008)(91956017)(2616005)(38100700002)(6486002)(66946007)(316002)(53546011)(2906002)(186003)(6506007)(26005)(36756003)(5660300002)(33656002)(86362001)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <094291CC1466D44B88C59C808AD51401@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1868
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2edea1e-1383-4a2b-d3ca-08da0cbf67fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LPx+QDKRPBmvqpcvir5CsLiVpoWbwNgCR6ye40W9+JPHx6qCYVoHMQcmUY2kGGh8hYaEHlcvFtGDnztYgQLO++XpoMmsB7gg2Vx3wBJMcn+Fglhx77AT2Ez1d/RXKF/hxoOsYknZK2gxfUoLDnCA5mntslcRkWgRT9Z3TCB7J2bANGV0oXH1zl8Z85j9/8Ka6gjnrZKWkF1DhYkZKhS5nmkvPGzY+JJxL2Q9iiD3UHcwzKGVXlQYUTcXDrgmP+RCJYd0ZBuh8RewxJrQOGr9jIt7D85XtPsBf9bTBEvdOycvHKFvTpy5bMpA4Yov9hlnpa8VyNp5XjKwUDu/Rro10bvPLhfslVXRNggc/Xd03yhfQrNvzCG31z3yaK8xlJst1AQ6OxqL5IbLom3RrUD9/03Uxyva9hECKgDmQFHFmW3IuxkPRF4HyOUr/0X+WD9iSBhpUJM3NuvqggOErfW2dMKJUIbsL4QnhXEa+SgA9lo7840YDsUgQBmubDGIRTKe34mWy/Y6bTbHYHQ5a4TKIzXCVIXqs2PspwQGVP8kKiO22+NPyd1D2D8Eaf9AA3xPssG/s+0qf/Q5GYFdMDC+KnVTmfGPEshuQXfZacQrpGsXfSbXa7a0Lh89TbPjNytQag0bPxVuWiWCPtu4TqLhWJCefSoKVqSl8iuyp7uleiuwgiLbMNs8ORJuP5W/hd+9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(6486002)(6512007)(47076005)(70586007)(70206006)(4326008)(8936002)(6862004)(82310400004)(8676002)(53546011)(6506007)(33656002)(86362001)(36860700001)(40460700003)(36756003)(2616005)(83380400001)(356005)(81166007)(336012)(26005)(186003)(5660300002)(2906002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 11:22:33.4657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e8dd7e-3cc4-44e2-a49d-08da0cbf6d24
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4155



> On 23 Mar 2022, at 11:10, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
>=20
>=20
>> On 23 Mar 2022, at 08:58, Juergen Gross <jgross@suse.com> wrote:
>>=20
>> The result field of struct vscsiif_response is lacking a detailed
>> definition. Today the Linux kernel internal scsi definitions are being
>> used, which is not a sane interface for a PV device driver.
>>=20
>> Add macros to change that by using today's values in the XEN namespace.
>>=20
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - put macro parameters in parentheses (Jan Beulich)
>> - correct XEN_VSCSIIF_RSLT_HOST() (Jan Beulich)
>> - more verbose result defines (Jan Beulich)
>> - add reset result defines (Jan Beulich)
>> ---
>> xen/include/public/io/vscsiif.h | 51 +++++++++++++++++++++++++++++++++
>> 1 file changed, 51 insertions(+)
>>=20
>> diff --git a/xen/include/public/io/vscsiif.h b/xen/include/public/io/vsc=
siif.h
>> index c9ceb1884d..8553b17cc6 100644
>> --- a/xen/include/public/io/vscsiif.h
>> +++ b/xen/include/public/io/vscsiif.h
>> @@ -315,6 +315,57 @@ struct vscsiif_response {
>> };
>> typedef struct vscsiif_response vscsiif_response_t;
>>=20
>> +/* SCSI I/O status from vscsiif_response->rslt */
>> +#define XEN_VSCSIIF_RSLT_STATUS(x)  ((x) & 0x00ff)

Sorry Juergen,

A thing came to me after sending my first message, is XEN_VSCSIIF_RSLT_STAT=
US meant
to be used to compare the result with XEN_VSCSIIF_RSLT_RESET_SUCCESS or=20
XEN_VSCSIIF_RSLT_RESET_FAILED?

Because I think the mask should be 0xFFFF instead of 0xFF since we have the=
 bit 13 set

Cheers,
Luca

>> +
>> +/* Host I/O status from vscsiif_response->rslt */
>> +#define XEN_VSCSIIF_RSLT_HOST(x)    (((x) & 0x00ff0000) >> 16)
>> +#define XEN_VSCSIIF_RSLT_HOST_OK                   0
>> +/* Couldn't connect before timeout */
>> +#define XEN_VSCSIIF_RSLT_HOST_NO_CONNECT           1
>> +/* Bus busy through timeout */
>> +#define XEN_VSCSIIF_RSLT_HOST_BUS_BUSY             2
>> +/* Timed out for other reason */
>> +#define XEN_VSCSIIF_RSLT_HOST_TIME_OUT             3
>> +/* Bad target */
>> +#define XEN_VSCSIIF_RSLT_HOST_BAD_TARGET           4
>> +/* Abort for some other reason */
>> +#define XEN_VSCSIIF_RSLT_HOST_ABORT                5
>> +/* Parity error */
>> +#define XEN_VSCSIIF_RSLT_HOST_PARITY               6
>> +/* Internal error */
>> +#define XEN_VSCSIIF_RSLT_HOST_ERROR                7
>> +/* Reset by somebody */
>> +#define XEN_VSCSIIF_RSLT_HOST_RESET                8
>> +/* Unexpected interrupt */
>> +#define XEN_VSCSIIF_RSLT_HOST_BAD_INTR             9
>> +/* Force command past mid-layer */
>> +#define XEN_VSCSIIF_RSLT_HOST_PASSTHROUGH         10
>> +/* Retry requested */
>> +#define XEN_VSCSIIF_RSLT_HOST_SOFT_ERROR          11
>> +/* Hidden retry requested */
>> +#define XEN_VSCSIIF_RSLT_HOST_IMM_RETRY           12
>> +/* Requeue command requested */
>> +#define XEN_VSCSIIF_RSLT_HOST_REQUEUE             13
>> +/* Transport error disrupted I/O */
>> +#define XEN_VSCSIIF_RSLT_HOST_TRANSPORT_DISRUPTED 14
>> +/* Transport class fastfailed */
>> +#define XEN_VSCSIIF_RSLT_HOST_TRANSPORT_FAILFAST  15
>> +/* Permanent target failure */
>> +#define XEN_VSCSIIF_RSLT_HOST_TARGET_FAILURE      16
>> +/* Permanent nexus failure on path */
>> +#define XEN_VSCSIIF_RSLT_HOST_NEXUS_FAILURE       17
>> +/* Space allocation on device failed */
>> +#define XEN_VSCSIIF_RSLT_HOST_ALLOC_FAILURE       18
>> +/* Medium error */
>> +#define XEN_VSCSIIF_RSLT_HOST_MEDIUM_ERROR        19
>> +/* Transport marginal errors */
>> +#define XEN_VSCSIIF_RSLT_HOST_TRANSPORT_MARGINAL  20
>=20
> Hi Juergen,
>=20
> Would it makes sense to define the values in hex like in include/scsi/scs=
i_status.h
> so that they are more easy to compare?
>=20
> However this looks good to me,
>=20
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
>=20
>> +
>> +/* Result values of reset operations */
>> +#define XEN_VSCSIIF_RSLT_RESET_SUCCESS  0x2002
>> +#define XEN_VSCSIIF_RSLT_RESET_FAILED   0x2003
>> +
>> DEFINE_RING_TYPES(vscsiif, struct vscsiif_request, struct vscsiif_respon=
se);
>>=20
>>=20
>> --=20
>> 2.34.1


