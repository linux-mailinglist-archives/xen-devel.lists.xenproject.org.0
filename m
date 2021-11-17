Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16671454602
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 12:52:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226802.392082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJUJ-0003jR-Ha; Wed, 17 Nov 2021 11:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226802.392082; Wed, 17 Nov 2021 11:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJUJ-0003g6-DO; Wed, 17 Nov 2021 11:52:27 +0000
Received: by outflank-mailman (input) for mailman id 226802;
 Wed, 17 Nov 2021 11:52:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtAJ=QE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mnJUI-0003fy-Lp
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:52:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d46133b8-479c-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 12:52:25 +0100 (CET)
Received: from DU2PR04CA0321.eurprd04.prod.outlook.com (2603:10a6:10:2b5::26)
 by VE1PR08MB4896.eurprd08.prod.outlook.com (2603:10a6:802:b1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 11:52:21 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::a2) by DU2PR04CA0321.outlook.office365.com
 (2603:10a6:10:2b5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Wed, 17 Nov 2021 11:52:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Wed, 17 Nov 2021 11:52:21 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Wed, 17 Nov 2021 11:52:21 +0000
Received: from 3ceec2153b09.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2836A5CC-9157-4917-B99B-26467F35C677.1; 
 Wed, 17 Nov 2021 11:52:09 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ceec2153b09.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Nov 2021 11:52:09 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6846.eurprd08.prod.outlook.com (2603:10a6:102:15d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 11:52:08 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb%6]) with mapi id 15.20.4690.015; Wed, 17 Nov 2021
 11:52:08 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LNXP265CA0032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.20 via Frontend Transport; Wed, 17 Nov 2021 11:52:08 +0000
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
X-Inumbo-ID: d46133b8-479c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo1+fdYgImCVH9Dbo/jFZe8vPebZIbtirwi6vieZFIY=;
 b=z81wEFFSDC6CvhIwF6tBZi/iW66lnI3AZA6FwMjSwEXv7yP+L7Cb5KaR4Z7txJ8OxLjL+BibWvCD1hDbfVBN5mBBmhJFY+lthz0ALfQlHCvWmDF2u5XKAe8gl3MxJlA8vSVePte3zUOLw5j5Dhz2VqNiaf8I0hrvtdm9w/TCVXY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f894de6f21acbc5d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aE+iS34bY9TagNQFM3UB+E/f7CTfIpeJwr1vIATP2S22Tao4m4vewGI9N+YRDL8kKTlMyowh5VgzXjFG5KE+1Qy90gGDCxBOAuPpO6rXGo/EJHbzUDaEfamt3ubbdEIWkqA55unSEex3Ba+31UZPFRLh/bgOOQMT0hpMhIjAehORxx1sqwZMsbSQdCH258aRZ9oX9ZQ/yPkgNoByXFHDUTU2r4nJLOvq1RVvVHI+ogjo4/rZteE7C6uk1Bm580w32YhGVDBCO3qJeIvlDOZz8+80TfE8zW+WSwFGX+ck45q2vwm/ioqFX5pVsdW3D2I3Z+N7lf51DloBbeUSqsD1xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo1+fdYgImCVH9Dbo/jFZe8vPebZIbtirwi6vieZFIY=;
 b=dpAILSMVYEtWXw+t8uLNIwe6HNvDiJEAyIwwxg5Yr+T7Zmla5k1pxPSCj/0+ib6t9C2QFpv4XdAlchnLPZ/L/BvmW2abySfivCtl4wm+0992FcnOjgGqhLJMeeWJPscmVAyC94T17PcAQFH4FPQf5xB/Gy57aj8wpHRxlWjYP4xoefBrUWg0zFyv1qs4wo8N5yn/VaIcgRwzbEf9mATuGz8G3dwjTz/BTCMbGvPVRBZ7fyHCinPcptLTi9rgTGSJHd1g9zUcbisIonhAuhpxus5b2HDduhE+RRqP5M0oI0A5nhM1TPlGabu1/p1J/Ztyjf43IWAq23zfq5NGcyLm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo1+fdYgImCVH9Dbo/jFZe8vPebZIbtirwi6vieZFIY=;
 b=z81wEFFSDC6CvhIwF6tBZi/iW66lnI3AZA6FwMjSwEXv7yP+L7Cb5KaR4Z7txJ8OxLjL+BibWvCD1hDbfVBN5mBBmhJFY+lthz0ALfQlHCvWmDF2u5XKAe8gl3MxJlA8vSVePte3zUOLw5j5Dhz2VqNiaf8I0hrvtdm9w/TCVXY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [RFC PATCH 2/2] tools/cpupools: Give a name to unnamed cpupools
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <2d0140be-8830-3d7a-5ee9-58ef80357888@suse.com>
Date: Wed, 17 Nov 2021 11:52:01 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D14A26F2-487D-42B6-BD3B-552CEFA84294@arm.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <20211117095711.26596-3-luca.fancellu@arm.com>
 <2d0140be-8830-3d7a-5ee9-58ef80357888@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LNXP265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::20) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a265944-e95d-40e4-5905-08d9a9c0b69b
X-MS-TrafficTypeDiagnostic: PAXPR08MB6846:|VE1PR08MB4896:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB489651E9359BD32805BC799CE49A9@VE1PR08MB4896.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wlL1LNj9xawuEzKgiYB2xSrIPaHdqomVKrvJxUFpv/kF3ZInIHtlpBYbnZQ8uQmX5zNA8oAOrPkVjQf+EDmqC/ysBWJgVRGUCuajNoJS7JLzV5uNh9R7Py6dmHzKcG0W55ZqAzgQEOCsbSNbuYgd0BdzR8pNp9Kk3NTcc3k6uyggwFeY7uBbyWiKnlxisobsvEeD6/j4msQBcayzygzA/yqJQTMmZ84RsdY7Kb5SHJ1ilOjbJvbaepY9LJpIGMKzROXUNkcLZq0Rq5N7X3A5QTzm+tHX2w1zhpW9v0mkUu3gkNLGRi36ON5O2Tter3qDm5JnHKhPIuBXgFwfki9a/AQNbiFGd+INp/aI9A8H27G5owaYQ9G84XqWcIE7zWI1djhZXOHnLVM0n4aC56eD3K+XU4UYqZbWvZ6gAdnOHWCHh1X6aGzzFl4Jbct7xwsj+oTAjuDb3ElUKgoOG/M00ShMjdgxK4MFXzp4wDjSdH3j6XhQzFRu2HALSFOX41YHqR74ddXuBCPZRTiJ+zEnxcUA7gR5HvHZVBofTl7Ec8duRtXvNYFyvOqbtO1wQ9diX4L4vXjWG6Ht1XGbRYd7yBbDUaP4X1VTqegTEUvs3sdCqV7VQKPvMCWeLXGI1EjB8++5gneJATLD2RwGbNfKSxT3sO16FIx7wY860D3q7O1SfrapeH1M3l7xz8vH9RriiOhPMZ5Wxf8I6YENrDWgFejbGZYVXT2KzLWg7279Zt4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(26005)(2906002)(36756003)(38100700002)(38350700002)(8936002)(6512007)(83380400001)(52116002)(956004)(53546011)(6486002)(6506007)(2616005)(86362001)(5660300002)(4326008)(6916009)(54906003)(8676002)(33656002)(66946007)(66556008)(66476007)(44832011)(6666004)(186003)(316002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6846
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fb929e9b-e9ba-4ce1-d54f-08d9a9c0aef2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7oB71BjAAnUmrHLMICdBRZILetg1+L7VSopSwrNM257GWlI0dlMsOjRRGqmShwVuzG8+DEPBv/hWDiBbFgXtK9TXu6r3+kSVDAvmdC7cvv5TTZIWxAszUo9dX3WNHrrIBgCD+bGcU5nvadIkE/tTke2Z0qpgkCv2VGZpHhGM1/gPHTGAgIr/gx9hMf+Mp/GpzHKXggFGdwV0JNKfBEzg4lSYbPadF97tKNGAUgOWJcuWa5Q7vzp1AmRFluRKlglhuenjWNn63S4SbUDTAr+ymqIwZ3qSu91vE2VhUmjA4YDeQkcOZEVsIWB5HTJTdaK4ZhjqQ4sMF3tk+An5BGvh2nCn+ZxSLSdK/p9Wo7//yNDQxriRxIrfFU+BSWvnpRa9LIuco2bNfH+jDIY9AQlijBV61QGPJPdjZ/YzgW7CyLbLo53Eqnan2LPPAI/5/QiKzGudQffqsvRfP3z2qrfIbdRB33RCc0iuJIAkiQhsr6nAYP9gg1R424SKgHVUGd5ixMrle30hHBIL7DqFtvPf+FoRQVx5p22hWRi4m2PKX6tPnEdgqQYPIR9QSJCdM9NbqHidUs6dNYnyaw6kVQNHDV/kUDfI3Tqu3VFg9mezZOmAIEb91rZDQsbv56G0UDAHM2qIj/N+taSGBV6k1R29ygz/GwR2izEBnDW/cU8Fd0Pp3Hpr74IRqHkrftrPnw0qxjl0wZyNZiUxfKSOi9iW0g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(83380400001)(81166007)(6862004)(107886003)(36756003)(6512007)(33656002)(316002)(6486002)(4326008)(6506007)(53546011)(36860700001)(26005)(47076005)(54906003)(186003)(356005)(86362001)(70586007)(5660300002)(70206006)(8676002)(44832011)(8936002)(956004)(2616005)(508600001)(336012)(6666004)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 11:52:21.2015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a265944-e95d-40e4-5905-08d9a9c0b69b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4896



> On 17 Nov 2021, at 11:10, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 17.11.21 10:57, Luca Fancellu wrote:
>> With the introduction of boot time cpupools, Xen can
>> create at boot time many cpupools different from the
>> cpupool with id 0.
>> Since these newly created cpupools can't have an
>> entry in Xenstore, name them with the same convention
>> used for the cpupool 0: Pool-<cpupool id>.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  tools/libs/light/libxl_utils.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>> diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_uti=
ls.c
>> index 4699c4a0a3..d97d91ca98 100644
>> --- a/tools/libs/light/libxl_utils.c
>> +++ b/tools/libs/light/libxl_utils.c
>> @@ -147,13 +147,16 @@ int libxl_cpupool_qualifier_to_cpupoolid(libxl_ctx=
 *ctx, const char *p,
>>  char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
>>  {
>>      unsigned int len;
>> -    char path[strlen("/local/pool") + 12];
>> +    char buffer[strlen("/local/pool") + 12];
>>      char *s;
>>  -    snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);
>> -    s =3D xs_read(ctx->xsh, XBT_NULL, path, &len);
>> -    if (!s && (poolid =3D=3D 0))
>> -        return strdup("Pool-0");
>> +    snprintf(buffer, sizeof(buffer), "/local/pool/%d/name", poolid);
>> +    s =3D xs_read(ctx->xsh, XBT_NULL, buffer, &len);
>> +    if (!s)
>> +    {
>> +        snprintf(buffer, sizeof(buffer), "Pool-%d", poolid);
>> +        return strdup(buffer);
>> +    }
>>      return s;
>>  }
>> =20
>=20
> This breaks libxl_cpupoolid_is_valid(), as it will now return always
> true, regardless whether the poolid is existing or not.

Hi Juergen,

Yes right, do you think I can use safely xc_cpupool_getinfo(=E2=80=A6) when=
 there is no entry
in xenstore?
I would check that the returned cpupool id is the same and if it isn=E2=80=
=99t or if I get a null
result, then I will return NULL to ensure libxl_cpupoolid_is_valid(=E2=80=
=A6) works again.

Cheers,
Luca

>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


