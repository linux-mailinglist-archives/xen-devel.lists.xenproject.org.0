Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DC44B82C7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 09:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273762.469012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKFV1-0007hS-7o; Wed, 16 Feb 2022 08:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273762.469012; Wed, 16 Feb 2022 08:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKFV1-0007eO-4O; Wed, 16 Feb 2022 08:17:19 +0000
Received: by outflank-mailman (input) for mailman id 273762;
 Wed, 16 Feb 2022 08:17:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbM1=S7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nKFUz-0007eI-77
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 08:17:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9cc0f39-8f00-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 09:17:16 +0100 (CET)
Received: from DB7PR05CA0047.eurprd05.prod.outlook.com (2603:10a6:10:2e::24)
 by AM5PR0802MB2564.eurprd08.prod.outlook.com (2603:10a6:203:a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 08:17:12 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::3c) by DB7PR05CA0047.outlook.office365.com
 (2603:10a6:10:2e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Wed, 16 Feb 2022 08:17:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 08:17:12 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Wed, 16 Feb 2022 08:17:12 +0000
Received: from ff3db04f4d7b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 36C475AF-8C97-4753-BFB6-4FADCB9816A3.1; 
 Wed, 16 Feb 2022 08:17:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff3db04f4d7b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 08:17:11 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by AM7PR08MB5336.eurprd08.prod.outlook.com
 (2603:10a6:20b:105::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 08:17:01 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 08:16:59 +0000
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
X-Inumbo-ID: d9cc0f39-8f00-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCsX5TWiQRdbBLDv8OYYrtYQkhBsOjbWFA2Z2jFtW/A=;
 b=jkVTlKEeBHUSW9fOJQHzswXjVZ7ONqzxwbp/3o7HW5IiZrZT3eP7E06f+QNN7n8ZRTC0GnjQtXW9uc/Cr+p1eDGBESewN2fTFtlOPO82lvZoNKOeY83k/Wg6SEM2MfQhKFzBdw6ixDoJQkSUXEz70eQxqdHT+fht7OVfx7BXR4g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fc015dd556840793
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZC/Qy3r8ksPghizDKY37BrfjrEq5i8WU0mXEoL7UQR3oMpikZVcxinXf7KsJmswgLcwxRzldunwTOwLnCwEeUwPq6D0VHPNFB5M33wdf12BT7K1ujwAIv8b4MsYL5ev1LlNHR6+Z1cs9VokZYzRHNVD5PVeyWa9xQdi0nhdpdX3k3KpchfaSYu6vN63eGWuTxJ7vIqyDVg6xQymL5fjPMjNB2MXoWY52DMBpewHq7a2wVU1ejWvQZuwHWlgvFB4g0kVwY709Oyz6LxTATBtjkD/wBbOR2EOjDbkcdy6JPYukFhZeAg+XyPFmDK02qXRtlr9/SkhFeTgdqF9M80bNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCsX5TWiQRdbBLDv8OYYrtYQkhBsOjbWFA2Z2jFtW/A=;
 b=UcKfIR80TLCVwdQ/uwIZIX+QQa8EYWaSACxsPBrEoRCUPFI8sChv06oloWFPOzGyDFNGpdz+lxHcvksvHB2gbynhMnHLuuY7ntTtVtCd75tk3RY2Hh5erO08LbWhlDwk59VkFOMutQg9TUXCBZxo8DAo1wj79vZGHNRP4ULIYnMUSYoE6+r51dgVE7jLb3jVdTVT2Emt9Yb8L7e2Gx6mJi4mWKjgXtQuO44i909eWMb4xV0j+JR7zaAWrDms61+ESKfIGTBmdWtUyPLMuzSdsdYCWbjaXnNwwb+RFwpXyWrpdj8DSz1r2Dx4382ROlIcVb+TCI3hrrThtPVXBSZTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCsX5TWiQRdbBLDv8OYYrtYQkhBsOjbWFA2Z2jFtW/A=;
 b=jkVTlKEeBHUSW9fOJQHzswXjVZ7ONqzxwbp/3o7HW5IiZrZT3eP7E06f+QNN7n8ZRTC0GnjQtXW9uc/Cr+p1eDGBESewN2fTFtlOPO82lvZoNKOeY83k/Wg6SEM2MfQhKFzBdw6ixDoJQkSUXEz70eQxqdHT+fht7OVfx7BXR4g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 1/5] tools/cpupools: Give a name to unnamed cpupools
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <8763ed2b-ce5d-12eb-1ea2-542e8024764b@suse.com>
Date: Wed, 16 Feb 2022 08:16:55 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 wei.chen@arm.com,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <994A7B5F-DC53-411A-ABB2-4D7E8B77EF63@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-2-luca.fancellu@arm.com>
 <efd968bb-e3f6-9e16-3826-4cab25127718@suse.com>
 <71460E15-5D09-4CE6-99ED-4858147BB0D0@arm.com>
 <8763ed2b-ce5d-12eb-1ea2-542e8024764b@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO2P123CA0076.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::9) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 99e0bd87-56ab-4fd6-a0e9-08d9f124bbb8
X-MS-TrafficTypeDiagnostic:
	AM7PR08MB5336:EE_|DB5EUR03FT044:EE_|AM5PR0802MB2564:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB25640163176EAAC337E51ACFE4359@AM5PR0802MB2564.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Z5J9RW+wx8FiQWqumtigq8kYXvGbXJxnjR2AIOj7TGrOtd6nak5kgPhoS/zYItF2N6BoTw4EveKo5jr9zarfurEc90/vH35tdS3l86D0dsl9qbhk2OLrD4DAYhPOiWCvpzd6hRJgUdqogBC3YF/cqStL2N8zcp87RjMu28pSiGFXw2v46OzyaAHfiutz6ArWBYgPBIscjNkXYMaW1BFyMG7M8wzfiDwVqU0uI67w4OmWE0fJzlaGsC98mxWIXQRnDKez/0rv5HaiXxD5YcosewVbBHi5IwOfp/pQPIIC4o0UyLZjAzaDDyYXL4micYVOeR1WIyFbyYhphqr3MM5fEWw/31PgA+J6a2f+CdtIki4Tuu8+X3mSdZujcDJN1O1qNjcCO5oDK0SmaA9wqLjtfQ/k88VyLSMMlYjw3yyJvjePz0m+m7ce0knPQBwGeb03X3Tklg1m4bVpMddDfrNrX9kGTg9giOzNs9eR2f2PwGpRi8Y68mZOp6VOk1oqiQHC6dV3tdkVHjSOcHmTxTHGTdo9P8FdvWU01uqG2au3UDjpOzkxQa23GwEReXVSfX3VMSzUahOj0i33FgmJLG3CR5KFG2RXydewJqZmkomZUcR+ZDXKgwbthtcOVPUakH8BxASdkbQwt/fVYV5qylHxHiY9f3B0uiZOdSCk5GM5xIppQ2HE3g2VbnlOkpP3+hJcZLsfwPdCjxVn/YcZjwfDcVyQjaVKA5S0242qi2iRUOY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(52116002)(33656002)(5660300002)(53546011)(316002)(508600001)(6916009)(54906003)(6486002)(38100700002)(38350700002)(8676002)(66946007)(66556008)(86362001)(66476007)(83380400001)(4326008)(6506007)(8936002)(6666004)(6512007)(186003)(44832011)(26005)(2616005)(2906002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5336
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ade7d57-d749-4008-bc6f-08d9f124b382
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gjUXQXJ77vZTQj1HmYYdTzasBhna3Mob1f/aE5Av8D5UDy/Sp6bO6jmCYc2as2PFUsaBd0W0c4sCZ2cMjDxJLYkMyafMCwUwIa0fUdit4P1VkLvi1Nkj+lp7Vi2CUSrFMRLB62c+jo+qVXdVpYYyC0qTHaj1Mleiqe697NqrzgLNdNZ9T626fZb1PLrxpLhT5/nfFnT4axM6p5KnAUqTgLwoWUeNjrvQQx10ecqoWIAYlqPRe4fVZi3ND54W2PBWkA+G+t3Ni8fsMrAB1meY+wbBVeQDbDKYytfEZjGTurjGZCNUfsL0l5HP+SpZiHY5PLWwqy85+z7jtrzY6hzbfgSielnXZjZQrkKrJD6E27ey/y4jkDw5TnwH8sH04L8x5NmSOpUKtMZxJJk/mB/XCNAkV96NivhWrPDOpGxqk1A594ko6hKtm1flDwZVQhALYGF2NWr9hFOH0ZtKS0YZoHLXRsxXzsdh4uTi7WtHG8+mm2cjNPCKEh5WhK3u2ay/fe51QaMGn4U59PWN/75cl/9bNPc4jMxN5X9leRW8TcYgJEzb/Y87xJ2OXZsah2d1eGH+q/t5q4p0dZOcNO/KO5X/63p1cmH9rAwlB6DMMQEvbZvgfJ1Q1qMPy/ixjLUTIOHAqMjQ8llhSvLddQAfBfgd9JikZN3l20yjOmYMY5RsBRov8qZErtyiy4Y3+YxV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(316002)(2906002)(5660300002)(508600001)(47076005)(82310400004)(6486002)(8936002)(54906003)(36756003)(8676002)(356005)(44832011)(70586007)(70206006)(81166007)(6862004)(40460700003)(4326008)(36860700001)(6512007)(83380400001)(2616005)(186003)(53546011)(86362001)(33656002)(336012)(107886003)(26005)(6666004)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 08:17:12.0035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e0bd87-56ab-4fd6-a0e9-08d9f124bbb8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2564



> On 16 Feb 2022, at 06:13, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 15.02.22 18:48, Luca Fancellu wrote:
>>> On 15 Feb 2022, at 10:33, Juergen Gross <jgross@suse.com> wrote:
>>>=20
>>> On 15.02.22 11:15, Luca Fancellu wrote:
>>>> With the introduction of boot time cpupools, Xen can create many
>>>> different cpupools at boot time other than cpupool with id 0.
>>>> Since these newly created cpupools can't have an
>>>> entry in Xenstore, create the entry using xen-init-dom0
>>>> helper with the usual convention: Pool-<cpupool id>.
>>>> Given the change, remove the check for poolid =3D=3D 0 from
>>>> libxl_cpupoolid_to_name(...).
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>> ---
>>>>  tools/helpers/xen-init-dom0.c  | 26 +++++++++++++++++++++++++-
>>>>  tools/libs/light/libxl_utils.c |  3 +--
>>>>  2 files changed, 26 insertions(+), 3 deletions(-)
>>>> diff --git a/tools/helpers/xen-init-dom0.c b/tools/helpers/xen-init-do=
m0.c
>>>> index c99224a4b607..3539f56faeb0 100644
>>>> --- a/tools/helpers/xen-init-dom0.c
>>>> +++ b/tools/helpers/xen-init-dom0.c
>>>> @@ -43,7 +43,10 @@ int main(int argc, char **argv)
>>>>      int rc;
>>>>      struct xs_handle *xsh =3D NULL;
>>>>      xc_interface *xch =3D NULL;
>>>> -    char *domname_string =3D NULL, *domid_string =3D NULL;
>>>> +    char *domname_string =3D NULL, *domid_string =3D NULL, *pool_stri=
ng =3D NULL;
>> Hi Juergen,
>>>=20
>>> pool_string seems to be unused.
>> I will remove it
>>>=20
>>>> +    char pool_path[strlen("/local/pool") + 12], pool_name[strlen("Poo=
l-") + 5];
>>>=20
>>> I don't like that. Why don't you use pointers and ...
>>>=20
>>>> +    xc_cpupoolinfo_t *xcinfo;
>>>> +    unsigned int pool_id =3D 0;
>>>>      libxl_uuid uuid;
>>>>        /* Accept 0 or 1 argument */
>>>> @@ -114,6 +117,27 @@ int main(int argc, char **argv)
>>>>          goto out;
>>>>      }
>>>>  +    /* Create an entry in xenstore for each cpupool on the system */
>>>> +    do {
>>>> +        xcinfo =3D xc_cpupool_getinfo(xch, pool_id);
>>>> +        if (xcinfo !=3D NULL) {
>>>> +            if (xcinfo->cpupool_id !=3D pool_id)
>>>> +                pool_id =3D xcinfo->cpupool_id;
>>>> +            snprintf(pool_path, sizeof(pool_path), "/local/pool/%d/na=
me",
>>>> +                     pool_id);
>>>> +            snprintf(pool_name, sizeof(pool_name), "Pool-%d", pool_id=
);
>>>=20
>>> ... use asprintf() here for allocating the strings in the needed size?
>> Why would you like more this approach? I was trying to avoid allocation/=
free
>> operations in a loop that would need also more code to check cases in wh=
ich
>> memory is not allocated. Instead with the buffers in the stack we don=E2=
=80=99t have problems.
>=20
> My main concerns are the usage of strlen() for sizing an on-stack array,
> the duplication of the format strings (once in the arrays definition and
> once in the snprintf()), and the mixture of strlen() and constants for
> sizing the arrays.
>=20
> There are actually some errors in your approach for sizing the arrays,
> showing how fragile your solution is: you are allowing a "positive
> integer number" for a cpupool-id, which could easily need 10 digits,
> while your arrays allow only for 5 or 4 digits, depending on the array.
>=20
> And doing the two asprintf() calls and then checking that both arrays
> are not NULL isn't that much code. BTW, your approach is missing the
> test that the arrays have been large enough.
>=20
> The performance of that loop shouldn't be that critical that a few
> additional microseconds really hurt, especially as I don't think any
> use case will exceed single digit loop iterations.

Hi Juergen,

Thank you for your explanation, totally makes sense. I took inspiration fro=
m
libxl_cpupoolid_to_name in libxl_utils.c writing this code but I see the li=
mitation
now.

I will change it to use asprintf().

Cheers,
Luca

>=20
>>>=20
>>>> +            pool_id++;
>>>> +            if (!xs_write(xsh, XBT_NULL, pool_path, pool_name,
>>>> +                          strlen(pool_name))) {
>>>> +                fprintf(stderr, "cannot set pool name\n");
>>>> +                rc =3D 1;
>>>> +            }
>>>> +            xc_cpupool_infofree(xch, xcinfo);
>>>> +            if (rc)
>>>> +                goto out;
>>>=20
>>> Moving the call of xc_cpupool_infofree() ahead of the call of xs_write(=
)
>>> would drop the need for this last if statement, as you could add the
>>> goto to the upper if.
>> Yes you are right, it would simplify the code
>>>=20
>>>> +        }
>>>> +    } while(xcinfo !=3D NULL);
>>>> +
>>>=20
>>> With doing all of this for being able to assign other domains created
>>> at boot to cpupools, shouldn't you add names for other domains than dom=
0
>>> here, too?
>> This serie is more about cpupools, maybe I can do that in another commit=
 out
>> of this serie.
>=20
> Fine with me.
>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


