Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA08F7916F5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 14:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595124.928619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd8Vv-0007JJ-0s; Mon, 04 Sep 2023 12:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595124.928619; Mon, 04 Sep 2023 12:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd8Vu-0007Hc-Tk; Mon, 04 Sep 2023 12:17:06 +0000
Received: by outflank-mailman (input) for mailman id 595124;
 Mon, 04 Sep 2023 12:17:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5g5r=EU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qd8Vt-0007HU-2I
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 12:17:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f427be35-4b1c-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 14:17:02 +0200 (CEST)
Received: from DB7PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:10:36::25)
 by PAWPR08MB9590.eurprd08.prod.outlook.com (2603:10a6:102:2e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 12:17:00 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::89) by DB7PR05CA0012.outlook.office365.com
 (2603:10a6:10:36::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 12:16:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.23 via Frontend Transport; Mon, 4 Sep 2023 12:16:59 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Mon, 04 Sep 2023 12:16:59 +0000
Received: from 9fb047743ad0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9597A815-850E-4962-928C-AC30007D47D0.1; 
 Mon, 04 Sep 2023 12:13:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9fb047743ad0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Sep 2023 12:13:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB8PR08MB5482.eurprd08.prod.outlook.com (2603:10a6:10:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 12:13:53 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 12:13:53 +0000
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
X-Inumbo-ID: f427be35-4b1c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fa64oUxSBs8PZfZbcvMA1ZD2ib4mo9J4tT1DgDYUNA0=;
 b=99mC+wBoE75e0h4v8CiUGDGI51aabO4opfGeIatmGrtI6L5jIn4WKhwwxt0/pB1KGV/wlHEgpTpxZsdY9JuNoF4+PojliDyBY6HY/fpzF69mSze0vEsbY4gUUgRjkQheQL5s6v4vRtlxDvVpCHSzpKk5ut0StzcQRRocUWl9ot4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 026fdb30c70ea5ad
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOtGxpeCq6Lr8Of+sDfb+SNzjcslttV3NGalNiBOwQXWwDnirYgH4z+L/IQOLZ4lx2fimlL4WSTj4JgxuXIQe523jVUteKQwHOt1gceQDdCBhKC3WlDmgY7GxZb1SRCaQpPGlro+DdMXQ6XRFjcQfBo4LZK7dFnBPuP1O6DUp1kdi3sPWsCzIe4nbLtKVmHuLhdirsWEwUmmRaWrlO8zbfg3hPzlP9e7UbR2BABRCY2aNIrgJixMntrkIXJF9mUCKuZq9jjdhhPhBBkzamCrnJDYXBbFC0F1zfFnfHK7Ci85uL1TKn43HXVZdmZAP1x+ROjCSVu3MCWvrdpJ8ETUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fa64oUxSBs8PZfZbcvMA1ZD2ib4mo9J4tT1DgDYUNA0=;
 b=OkNXVwzDOG4mGUurjviPnq6djDolFSobiIXllLq7XSUTlCBM6MM9/yBfdHCqfZ77rBRguxYsGUFI/Br4KA4i7u7SmdCHM2qQLR9KixhB4wsZzH7mXovlpfXOeuPmyzzWz2gAePW1MrWb9knFRat+NttN5oa0S7YT0VKPF7lHsFAuuBx4qw0o62y8Ypxb8UojnRKXZadfIe0x3cx0itzJXhQXogw1FnGHM7nAb47gy8krr0spkxquNC2407bTbfZsi1GIYZpycF24ZpZKzWlOtxwxAe0Dkola15+3ZJUv5w7VTvGVkt0Z1MgB+3VW2No7qR+YO9mZ3ys400U13oAHhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fa64oUxSBs8PZfZbcvMA1ZD2ib4mo9J4tT1DgDYUNA0=;
 b=99mC+wBoE75e0h4v8CiUGDGI51aabO4opfGeIatmGrtI6L5jIn4WKhwwxt0/pB1KGV/wlHEgpTpxZsdY9JuNoF4+PojliDyBY6HY/fpzF69mSze0vEsbY4gUUgRjkQheQL5s6v4vRtlxDvVpCHSzpKk5ut0StzcQRRocUWl9ot4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, "nicola.vetrini@bugseng.com"
	<nicola.vetrini@bugseng.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: xen-analysis ECLAIR support
Thread-Topic: xen-analysis ECLAIR support
Thread-Index: AQHZ1tnZvpm8hZMDREGKKcjBarux3K/6q84AgA/4+wA=
Date: Mon, 4 Sep 2023 12:13:53 +0000
Message-ID: <63E4B0A8-1B3E-4542-81E6-4DC60A5C63E8@arm.com>
References:
 <alpine.DEB.2.22.394.2308241453470.6458@ubuntu-linux-20-04-desktop>
 <aec70a33-b5b7-0bcb-52db-15162407c8bb@amd.com>
In-Reply-To: <aec70a33-b5b7-0bcb-52db-15162407c8bb@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB8PR08MB5482:EE_|DBAEUR03FT022:EE_|PAWPR08MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 97eca471-8f73-4072-fe34-08dbad40d6b4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9xiGInmJZy4ri+4eyxDa7RQ7lNoJkyYgpSH1Xc2Mwslq8L0fz0AAM5U2OrbpY4sjGX52YK8bMVFhtaWAGRqOThEOMYzlFMp7zgLphYzRKLecVuqSNkpNUnVcSUFXgctXRcteXCSxDchfMJOdg16BuuVEHQ9VC4fJP69kUWUU+aIcKY3++p8vXFgeV3lU/6dB0znjYiHyjIG1/e0U5virDKdCP2q3EtjKthXOMVU6JvioRmoevNIRhxLroFCWtok3qrXRMdmls00YUPPfhLrQmQ5IMNTc/0w9BWqfHnVo85hKZsvWtIeOd5VDiYfz2VVFIkfcKoAWUAbidABAxNqOgLVWNKT9DutEsubUjZY8EhOlsXJUwM2E/4ocdgtgSLubOOt+OpPe/qVx5/LOWxr33cbi26n0A45ex2zT1h+dxQe9FPkAHinLwefhh61nIaGritWqE856wehihqaaDtH6QuEcz6Bwg+RVMsPS9+1nRnghlYyf/cZSeUTFB6a5d9RhL4l5nDGV1zSiK/GgXAP1fPeWuQc4dX2zh9aaJotTCVr81PoWOEhD2kwJAUci1cUAAsx+06tluIcMt4G1vVqNLaojSwu39y8EvlIxSyg8nz5ePucWdyWIOr83VSxmn5rVH/NIyp5xdH1wj3JURb3yVA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199024)(186009)(1800799009)(3480700007)(38100700002)(122000001)(38070700005)(33656002)(41300700001)(5660300002)(36756003)(86362001)(83380400001)(66556008)(66476007)(66946007)(66446008)(76116006)(26005)(64756008)(478600001)(2616005)(91956017)(71200400001)(8936002)(8676002)(4326008)(316002)(53546011)(6512007)(6486002)(54906003)(2906002)(6506007)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C9155F9A108E584B947A66E31D7F81A4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5482
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ddff42c3-4e4e-4bbd-abbe-08dbad4067d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2cGG8OGS7DKfqJhrvX0OQDHRKkQI0fW8n6GEUJ+dULpXHUbh4+yWA+pIUyGXjWJErgEU7D4/WGavFxFXjnrYmMbzsAzbFibkMfuap7OPNYsl/lIRJv8x7yM3MPXiNx+BCIvSiBK9SYEIIa+29ugedSQT7nKx7Uyq+afFazHCTV60sbNjSU2P5KIxu9FGT0lMJoOrDzaMLfnltsFIVNGiojv5S/OUG0W1Io8bl31lK6x8yGKCY5vafeDr5cY4PbFP59QDeIRyCs8WU0EwZV4MyweiHxJpcEfqgx5ufhy/W+xvJ4DfgGOKmCfuETftQJ22LvD/iNk+hFWU3odRbcb/RyagAc+w8G24+8mdng8A127zc/ZOH4Vn2O7UrSMJeeihxdaBnXu3YrNExZmdEpvB/l47nYQD7rfZqIcYs+UkhEU5fJcKiXZaK15jgDorktKWfzpt4Z8c4lLPldZzDh1OUy604vJeJH/HcTEN0fxXxJgiAnTKqXQ+Tiwtl3uGeX8FnVlD9NrRkI1ZnFK7rcbUQ1JrEOGQwBrFxbfWhQggoq3filAGyzY2g8W32qtHEcT9qogBWZyDL0eWAg1Wi09AoCk3O7DWV3obgflVNnIRxBxB+LsJ3YLeulKc5wI7BHMlu271GxnYg0WCKTLlkrUYvDuPRgHVdGi3TmsZtLOHb8qVSrPXvpgjrLmdq7jmCmoS2xyZNxZuujN3dQdqxxv4qoMsPyH0lIqKkY1xxMwhRZ0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199024)(186009)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(2906002)(36756003)(54906003)(86362001)(316002)(70206006)(70586007)(33656002)(40480700001)(5660300002)(4326008)(8936002)(8676002)(6862004)(41300700001)(40460700003)(6512007)(3480700007)(47076005)(2616005)(83380400001)(336012)(26005)(36860700001)(478600001)(81166007)(356005)(82740400003)(6506007)(6486002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 12:16:59.4755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97eca471-8f73-4072-fe34-08dbad40d6b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9590



> On 25 Aug 2023, at 09:18, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi Stefano,
>=20
> On 25/08/2023 00:24, Stefano Stabellini wrote:
>>=20
>>=20
>> Hi Luca,
>>=20
>> We are looking into adding ECLAIR support for xen-analysis so that we
>> can use the SAF-n-safe tags also with ECLAIR.
>>=20
>> One question that came up is about multi-line statements. For instance,
>> in a case like the following:
>>=20
>> diff --git a/xen/common/inflate.c b/xen/common/inflate.c
>> index 8fa4b96d12..8bdc9208da 100644
>> --- a/xen/common/inflate.c
>> +++ b/xen/common/inflate.c
>> @@ -1201,6 +1201,7 @@ static int __init gunzip(void)
>>     magic[1] =3D NEXTBYTE();
>>     method   =3D NEXTBYTE();
>>=20
>> +    /* SAF-1-safe */
>>     if (magic[0] !=3D 037 ||
>>         ((magic[1] !=3D 0213) && (magic[1] !=3D 0236))) {
>>         error("bad gzip magic numbers");
>>=20
>>=20
>> Would SAF-1-safe cover both 037, and also 0213 and 0213?
>> Or would it cover only 037?
>>=20
>> We haven't use SAFE-n-safe extensively through the codebase yet but
>> my understanding is that SAFE-n-safe would cover the entire statement of
>> the following line, even if it is multi-line. Is that also your
>> understanding? Does it work like that with cppcheck?
> Looking at the docs and the actual script, only the single line below SAF=
 comment is excluded.
> So in your case you would require:
>=20
> /* SAF-1-safe */
> if (magic[0] !=3D 037 ||
>    /* SAF-1-safe */
>    ((magic[1] !=3D 0213) && (magic[1] !=3D 0236))) {
>    error("bad gzip magic numbers");

Yes correct

>=20
> I guess this was done so that it is clear that someone took all the parts=
 of the statements into account
> and all of them fall into the same justification (which might not be the =
case).
>=20
> BTW. I don't think we have also covered the case where there is more than=
 one violation in a single line
> that we want to deviate (e.g. sth like /* SAF-1-safe, SAF-2-safe */

You are right, but it should work adding multiple comments in this way:

/* SAF-1-safe */
/* SAF-2-safe */
<code where violation 1 and 2 are in the same line>

>=20
> ~Michal


