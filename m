Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58BB6F1152
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 07:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527158.819429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psGi3-0002bW-Ub; Fri, 28 Apr 2023 05:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527158.819429; Fri, 28 Apr 2023 05:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psGi3-0002ZY-Rq; Fri, 28 Apr 2023 05:31:55 +0000
Received: by outflank-mailman (input) for mailman id 527158;
 Fri, 28 Apr 2023 05:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xpt/=AT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1psGi2-0002ZS-0D
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 05:31:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fad1bd89-e585-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 07:31:52 +0200 (CEST)
Received: from AM6P194CA0064.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::41)
 by AS2PR08MB9596.eurprd08.prod.outlook.com (2603:10a6:20b:608::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23; Fri, 28 Apr
 2023 05:31:50 +0000
Received: from AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::83) by AM6P194CA0064.outlook.office365.com
 (2603:10a6:209:84::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 05:31:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT048.mail.protection.outlook.com (100.127.140.86) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.23 via Frontend Transport; Fri, 28 Apr 2023 05:31:49 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Fri, 28 Apr 2023 05:31:49 +0000
Received: from 354fcd50ed2d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63502CC3-B893-4E98-8CAE-7B22DED7272A.1; 
 Fri, 28 Apr 2023 05:31:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 354fcd50ed2d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Apr 2023 05:31:43 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM9PR08MB6081.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24; Fri, 28 Apr
 2023 05:31:39 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::bce1:f206:86af:31be]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::bce1:f206:86af:31be%5]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 05:31:39 +0000
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
X-Inumbo-ID: fad1bd89-e585-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C80hBpRfopBuAUbs21hwg3cF5r8UOx9NeTcCdymtSfs=;
 b=S1HDtL1tO/C3KsFLJAZhRxSmqzdJbL3MGCvIgtjJTxvMZZlz3eT/R9/eAVPpI5FrnlzoxAV+tnvFafjRCLGeJPwrPYIs5uEKvrmH6voUMVcTHNw+XC8iMvaDU9tlqrrYMCVqy0XhXDzfg4Xinoe9M54wwJZJHko0I6cITt5RE8M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3c9f0d3445903b3b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y63QRZwhapNVui/lakBfkpVSbakOVT6+n5ijtvirZKpGX3ZTC9+cfykbXuHxAmy1czBKEcQdj22Gas/lGkpUW9NWQK7liy47JV+QQszMu4+90uDq0/Eom1lGUEsv5Es2vJvfDls20DNSEscBZdhbRVXzMRbCpJ33cm7sZRDRQsF9+PQdZTfTKVfANCWJB6CZCSU/rli1PogJgj63oNagMVF0Nul6ZOZGGR/A4FKcaATbYlfv/DAgTMOxpNZBqxRYZbgVVyQV6RzjlBudBA97Y2FP9qExT0PRIFbVgnvOBFAWhPlZxy9igOHLRtvytF+mUxYHfwhqiLlgwPiMjtZl3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C80hBpRfopBuAUbs21hwg3cF5r8UOx9NeTcCdymtSfs=;
 b=XH/yv4cprBDFDtxZI1FNL9Gsd0oCL2d9gPLCImjvuv+EKjD5F5Hubza7nICvH3PJ12xH+kR5A/IdYLlSQt5wd7g7pc1VlTIH/9/eBjwpUtzJ56sg2RlDONN+G+a2m3GzUCYa1DXw7kfcWldUNvPNxxpteF+miGIyvD1YAWQnpcHgWLcPpO3uryOH+XceNp8b4tQSeXLLrxLEQ8+NlOXsC+7fvxPBJUKU6JGv3P1tAIUqzOS1SBzgsR1dE+RJ2VWBtCmbrvct2tS4I3r4FVVyez+bUNOZgTXO4R8XV6QS7NbQkqZ7gMxIcVc3ZXMyeUVt9bmCbPXa8C/xBkAwtP5b1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C80hBpRfopBuAUbs21hwg3cF5r8UOx9NeTcCdymtSfs=;
 b=S1HDtL1tO/C3KsFLJAZhRxSmqzdJbL3MGCvIgtjJTxvMZZlz3eT/R9/eAVPpI5FrnlzoxAV+tnvFafjRCLGeJPwrPYIs5uEKvrmH6voUMVcTHNw+XC8iMvaDU9tlqrrYMCVqy0XhXDzfg4Xinoe9M54wwJZJHko0I6cITt5RE8M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v2] xen/misra: xen-analysis.py: fix return error on
 PhaseExceptions
Thread-Topic: [PATCH v2] xen/misra: xen-analysis.py: fix return error on
 PhaseExceptions
Thread-Index: AQHZeQvr/NpTS3xi9kqkgHy5QIJUF68/lZYAgACdrgA=
Date: Fri, 28 Apr 2023 05:31:39 +0000
Message-ID: <D04634DD-8278-4F48-8A89-65405C261E77@arm.com>
References: <20230427132559.14712-1-luca.fancellu@arm.com>
 <29317463-a5de-2a5d-e217-498d3250ceae@citrix.com>
In-Reply-To: <29317463-a5de-2a5d-e217-498d3250ceae@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM9PR08MB6081:EE_|AM7EUR03FT048:EE_|AS2PR08MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 777ec377-6587-4703-fc2b-08db47a9ddba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Qw8Er/EA8fHtWgx8wn3gyJEtt47ufSbKs7X6hU5+kqvVvK38v1zl3eXvzKMl2cKRBpArCy0lxTWOyO1CVuKBopQs+lKo0ts76b19zeuZHfPdIhoo5bc/jQawoTK1LoRmr7vfQgNYCzltNH9BoIuBThGtMFBC9KgD/qXofuAwsAtRG5rmz8mtMJzxKWJRnwI6Bn9QyLczhyEN9IaI9ReOf5Cq+HS6FqxuQLWT27XsNzh51Z6qXjEXoWXiQuIj5N1LDrsAQFsK79sVpv2d4HjX2iKkrkLyadUrnOV61OyqB59Wm1wlaipE1rpmwE5ziHyfv4962dyndbiLjpGHuBJPt08F/vL/MoNnmcjhp+3vMOwYktks3XsonRJeezmuGmJOwoHEEQgSfW3308h/LluIoJzTWAa06HfWrdF2YuoOshF6QrRaGS70v0j3SKTHY+Kx1m+rtOlFhSK1VL5proFth5MncwTI7KC9uDVEaBCYUHZ3OIk/WjZqhSdtNb7oTdtvylC93uET1V0t5NnOqiMw2jdHxXf2hVAjV3sDiiuZXCU5Ec1Qucwz9LdvomyGcbMRAwvoALtdlzmGxs+Ka5jGAkRZUd/jmCEcsR5qz9lqaauLoAznGtlyMVR9vZ1ijxk4BIbvtnU8An44M5T405/FSg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(54906003)(478600001)(5660300002)(8676002)(8936002)(36756003)(2906002)(38070700005)(86362001)(33656002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(4326008)(6916009)(316002)(91956017)(38100700002)(41300700001)(122000001)(26005)(53546011)(6512007)(6506007)(83380400001)(2616005)(186003)(71200400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0F9344BB88E99F499077B741C465CBE2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6081
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3993550e-ff4b-402d-d47c-08db47a9d784
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A4QlMo8Lco8CkesJZqUGEW33jPEf8Vg5NxpLWBqFeuEF+gqECGp0SSu92wBfx0OSYIiNXtgkJCeQjgfnjZyqfS133CYKqZ3ydrGF/y1C5xyEHVH5kXFVaDOAOxwydCtmRDIu2o0dn4TpSZTAEbEjXchuuJTQ3uQiNSLSkb5le/OSrV/cX4e2u81lxjAsUIqx/ryRTi9Caer91sZ+Q/Y8lvw0M4+djew85erMmXPvCYeecSYM9VHYUd0kY8lNBaVSGpib8X/6icH4kMs3p3Omamgi9iFpJRTBZ3RCaZ11GTb2JhUMF54OzvibQxOv0B66HacwIXVkJ+hOC3APQ0ihpcg/BmGXkWaTp4/8qWJz8MCtZFCUwlV7jEu9bUP+xWpqK28heoTv/YQqzVbLfI+14Wxx0yN0WdsQmXe9TCFokHod3AF20JFtHrIfrMtSwWp2JcK9tOLZ4EaGd77hh/S2nwJL9ANeOYmmFuXdPXJi5gfSeB5yC+oP5TcRM2CBopUcg/CmMOBWuA+vtHpw0zpV6p5/dJBkTkezCRpfniQKrRtKsd5Vh2T3qZ97Ch9HjaE8C5g+hHExa7mcx0YfVXuIVqBuQFDn+0MpKCrC4pG7hi1m5ANrsgoD+ELPCrHzumF3xMQZt8DyMDORHY/XKuFRbGob+eyOD7/d+auVK+s3iXrmKaDSFA7npx20ej+oXOwk101/nHsGmmc9T9XGUNJVR+AqkEKp31JX20JiFL1viOs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(40480700001)(34020700004)(2616005)(40460700003)(33656002)(82310400005)(6486002)(81166007)(478600001)(82740400003)(6506007)(53546011)(36756003)(356005)(8936002)(8676002)(41300700001)(2906002)(316002)(5660300002)(6862004)(86362001)(70586007)(4326008)(54906003)(70206006)(6512007)(26005)(186003)(47076005)(83380400001)(36860700001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 05:31:49.7496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 777ec377-6587-4703-fc2b-08db47a9ddba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9596



> On 27 Apr 2023, at 21:07, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> On 27/04/2023 2:25 pm, Luca Fancellu wrote:
>> Currently the script return code is 0 even if an exception is
>> found, because the return code is written only if the exception
>> object has the errorcode member.
>>=20
>> Fix the issue returning the errorcode member in case it exists,
>> otherwise use a generic value different from 0.
>>=20
>> Fixes: 02b26c02c7c4 ("xen/scripts: add cppcheck tool to the xen-analysis=
.py script")
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
>> Change-Id: I1b76b8fa4668bef49da3282339fca3052e3379cd
>=20
> although this doesn't look like it should be here.  I've stripped it

My bad! I forgot to remove it before sending. Thanks

>=20
> ~Andrew
>=20
>> ---
>> Changes from v1:
>> - use getattr() (Andrew)
>> ---
>> xen/scripts/xen-analysis.py | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/xen/scripts/xen-analysis.py b/xen/scripts/xen-analysis.py
>> index 8e50c27cd898..5e8f2910cd72 100755
>> --- a/xen/scripts/xen-analysis.py
>> +++ b/xen/scripts/xen-analysis.py
>> @@ -26,8 +26,7 @@ def main(argv):
>>             cppcheck_analysis.generate_cppcheck_report()
>>     except PhaseExceptions as e:
>>         print("ERROR: {}".format(e))
>> -        if hasattr(e, "errorcode"):
>> -            ret_code =3D e.errorcode
>> +        ret_code =3D getattr(e, "errorcode", 1)
>>     finally:
>>         if settings.step_clean_analysis:
>>             cppcheck_analysis.clean_analysis_artifacts()
>=20


