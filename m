Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1084B742E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 18:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273476.468676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK1wa-0000wM-3f; Tue, 15 Feb 2022 17:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273476.468676; Tue, 15 Feb 2022 17:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK1wZ-0000uX-V3; Tue, 15 Feb 2022 17:48:51 +0000
Received: by outflank-mailman (input) for mailman id 273476;
 Tue, 15 Feb 2022 17:48:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h622=S6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nK1wY-0000uN-De
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 17:48:50 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe05::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8625bc4a-8e87-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 18:48:47 +0100 (CET)
Received: from DB6PR0202CA0011.eurprd02.prod.outlook.com (2603:10a6:4:29::21)
 by DB6PR0801MB2007.eurprd08.prod.outlook.com (2603:10a6:4:78::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 17:48:43 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::ed) by DB6PR0202CA0011.outlook.office365.com
 (2603:10a6:4:29::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Tue, 15 Feb 2022 17:48:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 17:48:43 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Tue, 15 Feb 2022 17:48:43 +0000
Received: from bb77d64df5ab.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09D6C916-4C27-493C-853F-886484CAB7A6.1; 
 Tue, 15 Feb 2022 17:48:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb77d64df5ab.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Feb 2022 17:48:32 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by DB6PR0802MB2424.eurprd08.prod.outlook.com
 (2603:10a6:4:a0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 17:48:30 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4975.018; Tue, 15 Feb 2022
 17:48:30 +0000
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
X-Inumbo-ID: 8625bc4a-8e87-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qKkaHHmKKIJajO827U52gAvCWMeX/xn59bD2EEt4u8=;
 b=6Rmk4LlMtd4Rce/Nx0p+RftNroihdiyykWfx175sRPJStN3bLIMvB1zJWEiPFAFaoQ8kZ/LdYhFYTmG/hr7MbWHscKnePxMcsHoS4UUjJ8B0YNr2VpUdrm08TJplJQXdU6PmmfLYAZ0xl2FYmvInrxwhCZpWbUWvx2DD63TSuEs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 006e210cd753c964
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVtVYSnyJ6guxjqivDp8lL6r2tFk7FJfHmtWZD4FypBM3ls+poidLplr4AWzGia9vY8T1oLkuubviQfAXBwaYKrg8Hw3l+eWP5XcSdYfveg2gMLDHsZOG7Y0DqPmSnMxZ9niZHpCee/EYnw7BoTcooPrOWjLvKFjYNbaxXlkN/3lXMbTp/lIFDowHmb3dsran2zgZyQTMeWZcJnmuocJnSgbbRdpZFplymUX44aE9Mj7jkZRyzVhsEVuu+LfjrLhvizCjuZ4BCa+zgX4KwvrYQTZl34kcfzXuq/SIlduUT3+a1yRRyYEAUrfles06Vx2bKplA2z9N21IpXef9StQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qKkaHHmKKIJajO827U52gAvCWMeX/xn59bD2EEt4u8=;
 b=VLhgKhR3Pt8iH846A2yJqxr4kq7Tmklvn7qhBhm95JeiT/eLS5vClnAiN9PsYDgr7D1hlQ/gZZ6RRQXqf0d+Xda9tAhYsyR5wqv76pgLllBjh8cYRErwCwWJiIMar9l7uKKyv4KPie+ZNf9WginbG1CAGmLMapZokCRtte8EuoQo20LT/MNnpB3rfZIL44/sXxyd3Z8UXC+mk4efIHMST1hDUPHW7knev3hzn/8ffXEZd5ZE+tg0FdPUEwsRG4KG161y2aSFMv1xjtFuoMykpNXMB3MVQxfoYMZewp2Z/XN7WWCfok10jzrmkLP0KjK5frakvQsa/gdAkLnaadF1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qKkaHHmKKIJajO827U52gAvCWMeX/xn59bD2EEt4u8=;
 b=6Rmk4LlMtd4Rce/Nx0p+RftNroihdiyykWfx175sRPJStN3bLIMvB1zJWEiPFAFaoQ8kZ/LdYhFYTmG/hr7MbWHscKnePxMcsHoS4UUjJ8B0YNr2VpUdrm08TJplJQXdU6PmmfLYAZ0xl2FYmvInrxwhCZpWbUWvx2DD63TSuEs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 1/5] tools/cpupools: Give a name to unnamed cpupools
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <efd968bb-e3f6-9e16-3826-4cab25127718@suse.com>
Date: Tue, 15 Feb 2022 17:48:26 +0000
Cc: xen-devel@lists.xenproject.org,
 wei.chen@arm.com,
 Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <71460E15-5D09-4CE6-99ED-4858147BB0D0@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-2-luca.fancellu@arm.com>
 <efd968bb-e3f6-9e16-3826-4cab25127718@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO4P123CA0300.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::17) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: e593d41f-5a06-4549-eae0-08d9f0ab68b5
X-MS-TrafficTypeDiagnostic:
	DB6PR0802MB2424:EE_|DB5EUR03FT034:EE_|DB6PR0801MB2007:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB20076E95575BA3ACC39AD979E4349@DB6PR0801MB2007.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nLoXcHkXySoyN37qC9p93zOPmj5/pquV0UKXC4WF53Uo52CJyNugwpzJmtv+uuBJof1PrkgEUJdkavCqb+unys9LCrhWtJNNxcLm95cSbOtpt+o6rJZIprpJPIs0nNpJI5AqTeq1L68KSPO/UXdTx1kbLhQQvsda+kmlHZI4Lyc/2QfBgPjgDk3DNjpGLMNi6tz4W7IwpIerXq0yrpXVxYSnpZ66HfhusfxZzYqXKmCykwijXI2TO3Alp826gx+WAiqlSziQOAfkf8Q4wzfuw2jY9Gh466dh1ROq9tFq2E8k2gX0fx8qNsNl3CBkI7izTTbABL7K78QbWtmv0MP57subqbm/rF56ls1eobKcr89WIPG8N4tn00NWs8QymHnk9L9yT3no7r94z1vXYG7nb/wmXjcAzyhNFdTVX2jb+5useOvMG0BLpO0uKOJnWrl3Fqy2si8d2O8DIBsTh9AfjE9A0kIx3IUJTpKQqKsq585On38hJpBELGgQQ0vWLQKurJIDiKBY69F2jtq6/oIMPbrBsk0Am/dSWGULEcvutFVoCTMlBqnHcHiOdTHJeozdeN7yRyxylxoLB6UxNa1G3cK4ZMH5I/997y056eKZcE8GQKM7ExY9E2YQhLchm7eg/8n4i4JwSnZ2fMwGL2OaVfVXcR76yieHIsx+NQ7IS8RG+oQv4iy0i5U9tg6vTK7pT5j0tNNljMapx/v0YT62+L2x4mXrgXwQkiK6xDPgxDo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(26005)(83380400001)(186003)(2616005)(5660300002)(44832011)(2906002)(8936002)(53546011)(508600001)(6506007)(6486002)(52116002)(6666004)(4326008)(8676002)(66476007)(66556008)(66946007)(316002)(6916009)(38350700002)(86362001)(33656002)(36756003)(38100700002)(54906003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2424
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be81d8c0-54c3-4932-454f-08d9f0ab609f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FayZxx0ypRFpQNrYkdD52VM2pIrCov9H6PYkU7QYl6r4ZjP9JF/XjCsgRKRJgZbBzRhmMVThu7VJnlMKqMck2luoBJ84e8QwrazN8WJ4+j+PL0B2fcAFblIiJR2ERPyS786BPp0jyfBGOGBB77H4aEB4L041fay8hyC+yTuP/Mk4RMHquNuAARNVWKRFZ5Ftl01AMsMkulJ9u8qhOFSu3kvNYHw02jwTRuTwTtreCIum9Y44fS5AbYgShB0K3bsvvvuq5Kn6/3HQlTSUxifvdKvAMKrpYVcC/2qOaj5XBd9cEadobjAXKClzCEPS6n1xnsZVero0QRo/pPH38IYrxDYJzJT2u4LPEErvBm4HadpJzg/MjZX1x0y3V03TIm9kIKNec1z6L0tquzciMEe3BzOZl2PqlMz4BR1R0X/ixT+06gxNWwr/7odClyyZ4VpFjqxrXh+IWleF1zIN/IM+EATo4yJ1UfO1BNPiWoO0b395JAqnA3DvvevBHTR8MtbOX4nHZxaHv/aKTKti52bd93MTQW+SKNaxd/JIpGmIuiWWYlc7AySMkTFoOW06hjCQec4YBELshh7v4PyuskoIoC2rStTJI2J8AAYk2gLkPCs3yVMMcMGHUG9hNqvJeSqKt05kTOAe1LqjKxtEYtRiVnp84um180IytGqvhWMTUbEdgnyAXAReI/XuvS8rV0Rq
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(356005)(6486002)(36860700001)(47076005)(316002)(54906003)(36756003)(83380400001)(81166007)(40460700003)(6862004)(5660300002)(53546011)(33656002)(6512007)(508600001)(6506007)(8936002)(44832011)(107886003)(2906002)(82310400004)(70586007)(6666004)(26005)(186003)(8676002)(86362001)(70206006)(336012)(2616005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 17:48:43.6387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e593d41f-5a06-4549-eae0-08d9f0ab68b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2007



> On 15 Feb 2022, at 10:33, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 15.02.22 11:15, Luca Fancellu wrote:
>> With the introduction of boot time cpupools, Xen can create many
>> different cpupools at boot time other than cpupool with id 0.
>> Since these newly created cpupools can't have an
>> entry in Xenstore, create the entry using xen-init-dom0
>> helper with the usual convention: Pool-<cpupool id>.
>> Given the change, remove the check for poolid =3D=3D 0 from
>> libxl_cpupoolid_to_name(...).
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  tools/helpers/xen-init-dom0.c  | 26 +++++++++++++++++++++++++-
>>  tools/libs/light/libxl_utils.c |  3 +--
>>  2 files changed, 26 insertions(+), 3 deletions(-)
>> diff --git a/tools/helpers/xen-init-dom0.c b/tools/helpers/xen-init-dom0=
.c
>> index c99224a4b607..3539f56faeb0 100644
>> --- a/tools/helpers/xen-init-dom0.c
>> +++ b/tools/helpers/xen-init-dom0.c
>> @@ -43,7 +43,10 @@ int main(int argc, char **argv)
>>      int rc;
>>      struct xs_handle *xsh =3D NULL;
>>      xc_interface *xch =3D NULL;
>> -    char *domname_string =3D NULL, *domid_string =3D NULL;
>> +    char *domname_string =3D NULL, *domid_string =3D NULL, *pool_string=
 =3D NULL;

Hi Juergen,

>=20
> pool_string seems to be unused.

I will remove it

>=20
>> +    char pool_path[strlen("/local/pool") + 12], pool_name[strlen("Pool-=
") + 5];
>=20
> I don't like that. Why don't you use pointers and ...
>=20
>> +    xc_cpupoolinfo_t *xcinfo;
>> +    unsigned int pool_id =3D 0;
>>      libxl_uuid uuid;
>>        /* Accept 0 or 1 argument */
>> @@ -114,6 +117,27 @@ int main(int argc, char **argv)
>>          goto out;
>>      }
>>  +    /* Create an entry in xenstore for each cpupool on the system */
>> +    do {
>> +        xcinfo =3D xc_cpupool_getinfo(xch, pool_id);
>> +        if (xcinfo !=3D NULL) {
>> +            if (xcinfo->cpupool_id !=3D pool_id)
>> +                pool_id =3D xcinfo->cpupool_id;
>> +            snprintf(pool_path, sizeof(pool_path), "/local/pool/%d/name=
",
>> +                     pool_id);
>> +            snprintf(pool_name, sizeof(pool_name), "Pool-%d", pool_id);
>=20
> ... use asprintf() here for allocating the strings in the needed size?

Why would you like more this approach? I was trying to avoid allocation/fre=
e
operations in a loop that would need also more code to check cases in which
memory is not allocated. Instead with the buffers in the stack we don=E2=80=
=99t have problems.

>=20
>> +            pool_id++;
>> +            if (!xs_write(xsh, XBT_NULL, pool_path, pool_name,
>> +                          strlen(pool_name))) {
>> +                fprintf(stderr, "cannot set pool name\n");
>> +                rc =3D 1;
>> +            }
>> +            xc_cpupool_infofree(xch, xcinfo);
>> +            if (rc)
>> +                goto out;
>=20
> Moving the call of xc_cpupool_infofree() ahead of the call of xs_write()
> would drop the need for this last if statement, as you could add the
> goto to the upper if.

Yes you are right, it would simplify the code

>=20
>> +        }
>> +    } while(xcinfo !=3D NULL);
>> +
>=20
> With doing all of this for being able to assign other domains created
> at boot to cpupools, shouldn't you add names for other domains than dom0
> here, too?

This serie is more about cpupools, maybe I can do that in another commit ou=
t
of this serie.

Thanks for your review.

Cheers,
Luca

>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


