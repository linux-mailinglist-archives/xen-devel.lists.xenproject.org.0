Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A7A4ADA68
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 14:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268365.462191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQuv-0001N0-DH; Tue, 08 Feb 2022 13:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268365.462191; Tue, 08 Feb 2022 13:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQuv-0001KC-9u; Tue, 08 Feb 2022 13:52:25 +0000
Received: by outflank-mailman (input) for mailman id 268365;
 Tue, 08 Feb 2022 13:52:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHQut-0001K6-MU
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 13:52:24 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5614d920-88e6-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 14:52:22 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218Dikqg006860;
 Tue, 8 Feb 2022 13:52:18 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3snvg18j-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 13:52:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB8PR03MB6217.eurprd03.prod.outlook.com (2603:10a6:10:133::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 13:52:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 13:52:14 +0000
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
X-Inumbo-ID: 5614d920-88e6-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bh+l6lN2NlosGHdikCn2HRTZLKrPQ4DibVuiKO6IPdvLIe13klAibu0oOktOx/vQ5QJ2qFSukrGAqiBz7iQDyf3dUcyHIA/P6cxpyeieK2e5bzUNBQ4hwwIufhTlqT0IBSMpBzJDqpPtfl6eL5+gwdkv86zznI6YcFgHWpUVFf7b6eNNmXTUSIVDrvqdOUHCdnFQe44Rs8ekgKQHu1Ey5M1ygwr/CT2SGeRyTrlt9fNCuo9sjo+DR1CHQK1GoaN/FRkQ/3FjN9R6maZEm3ruOiXDtI5n8+sTOzr9tPc2+x8OBl77501cyFx9vlTXP0Zy3wiShsjWoBWjFRQUG7ILxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OV0yQiCeohm3WATHNMvSpLy+lOyiJ3teNWGSWymmVjg=;
 b=PQhC6rFPkU2pttXSQeHSfpEPXPNPzJOq/EfGFtzKR8VkMs9j2sE4MTBxSFPKgUt/Uqvk1RdyL3MMVsmFfYV7+4LOAWjcxNrzvu46PGv3xLbKvd9YXEXqHos9JlYimFAUPNjNCJNs37QPqCENRfCMYg5IbxEZaR2iAMvDSqY5d2yDEXk5NfBRTFn1BNlSgB5WjkIGEV7gQcuufcxLzWuT4F5VvH25695uaA0Q0A+KGDGn7NKcKNVZ7SzGrBdD7vg/V85gZiKf+D6Q6rpPTxeDev/I/Dd4Oof2MiyBpQaV4+Iw70a7EtkljaDbFO7nHaiMRiTsFlCeX/0nUMrTQPdNaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OV0yQiCeohm3WATHNMvSpLy+lOyiJ3teNWGSWymmVjg=;
 b=UOlwelikiBZkAxhHyYPX2V9wZLPMg/IELWuwa2p6CqIjXvDpD2sLO3EpWYmH3mB+f9+gyf68NDqYQMYeP4DXL+HfliKK/HrhUyy+sAP7EC/Xi39M08FkPGB51UgqpXy80UMIaJGzUKGStaTD4W7M6lMwrqG9EmLnAtjz1Kvni7H5ADgGD22vSnC4j13c5j+zdHIVVb/iczocZd8dSXGuH+4R8wiH0DoKu2fgKkdZryueliks8d75UDeoECZm9AWpJDpo2nCpD3ToniAA8Arz1Ihe24tzA0fJQoznlwqLJ+06wAjwei61GdLVG668E7K1+6LE0ZZST/rxmiLfIYCsTw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABt5gIAAEpuAgAAE5ICAAASKAIAAAiiAgAAKNYCAAARNAIAAC1wAgAACRYCAAAGVgIAABJiAgAAB5wCAAPjsgIAANleAgAAGm4CAACiEAIAAA8eA
Date: Tue, 8 Feb 2022 13:52:14 +0000
Message-ID: <8dd91569-ab6b-4424-df08-ad1065cb8690@epam.com>
References: <e8fc7872-c7d0-f389-c507-335b809ffcbc@epam.com>
 <21c8125a-2f79-1a4a-494c-db9e4be2a1a6@suse.com>
 <4276fe72-558b-7d95-6430-d4330989dbe8@epam.com>
 <ad985f4a-10f0-4a2d-df02-cde915fea3f1@suse.com>
 <f7669670-8eeb-9966-5ba3-e8f9c03ce3d3@epam.com>
 <73e08285-6bb1-5842-899f-bd6502406e49@suse.com>
 <be3f4222-6580-4c89-a202-c003b6feb9b4@epam.com>
 <e91965c5-0802-adf8-0c17-522f86ebf231@epam.com>
 <YgJK2zPszyTXGxMM@Air-de-Roger>
 <0f83fa71-c252-6e6c-47c9-3ef899b45901@epam.com>
 <YgJyYkrEGVduPVLg@Air-de-Roger>
In-Reply-To: <YgJyYkrEGVduPVLg@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df70dc14-4aba-481a-3503-08d9eb0a3661
x-ms-traffictypediagnostic: DB8PR03MB6217:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB8PR03MB6217D94E8D040DB3D28A56E6E72D9@DB8PR03MB6217.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 P6ScqA0CoUeI6TYkl4+5SVK8AFAFbogCsnuy79yYMVd2cuMlZNWniUBygSs10ywd9NJnOy+OwdHTvP5ImaXZAxLpcRFNx3FbS0L6JyHK1MywWV0sRCNYVyJjf/gI13jbYBDUC3nnY/Ijll08xe8NkyDtR3IFK2sd1M2wRgg6VtobVeLtts1OFlluzmdo4yOahb3XSGjzrahbwR6A6PmwgLjLjaoHiIQ/gqAfz0CxutZXLb0mGJW32meV/Sblza9/yg80biLO407o7d3ofElq9VObMFYNagVeApPZfv607NZdtHcf8tzaAgRh7lu5/fKgvj2rVxM1uJQ7yAmoc4qI5Mbtc9jOx6xyeS9IM3tv86vhG97ezo4vb493PJVpi1E3MhkEuZJL9ir37J5RQImrEnVSMZcUL1hoqVaEa2AMdXU6hLcYznEaYiUDtftq4JCVkvhmCZlKWkZ7isAqkgBKZEO4CtOHMkukpN+sAGI2xqt8dYEaoP4GBnFnNl9GqZ1tI9X5evJo7WUHmfkiYVwikpiqEXZviKC06uu9hqSvYH84kJDmdYGiMhgDEY/OcDKc6OpoqHr1NGrJbVamoYg6Bew4z2v0Y4A8LEqgYt8nXFo8vZth/e8KqSTU9YVoHOTOpGa10ama0q4UvVO5axH0RrHbWHq4l1BpmbI1RxZ4b53JlSakSBqMaRCb2g8RNIK0gtjgNWUaARStL4MJbkCbB6R2WupEndUEBhnbYTRTqPC3P4AvgBqBBg4Z3Rez+NgK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(54906003)(66556008)(6916009)(64756008)(83380400001)(71200400001)(91956017)(86362001)(8676002)(66946007)(76116006)(508600001)(38070700005)(5660300002)(6486002)(7416002)(4326008)(316002)(2906002)(36756003)(2616005)(8936002)(6512007)(107886003)(31686004)(122000001)(66446008)(31696002)(66476007)(38100700002)(53546011)(186003)(26005)(55236004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R0JwMW9pTTRpdklMSkFmM2dvMDBjRG5XdWgzemt6Q21VclZIMkJaWmpaSzhr?=
 =?utf-8?B?REduSzFodEVVY1lHZ2tUTDlMZXZBakhzS0MyeFRieEYyOHk5eWtqUkxjWjlT?=
 =?utf-8?B?SnkvMmRjSXprRmZRbVJNVzVSNmVqb2ZBbjBJWnhrbXQvZk54OUpZV3k3UklV?=
 =?utf-8?B?ZVR0UVRRL0hsYXdJRDUyNFpkYVc2UHJXVnNDa0pJdlcvQml1MHNzZFdLeW95?=
 =?utf-8?B?K1NoWGlnM0FhY2QwQnBYR3VLNis0bW9oc0RGbzRTUHpGeEtvMkIzRVIyMEg0?=
 =?utf-8?B?SGgvcjhVSHRNUjc5ODhUbFR6ZGJjU1kydnhONHFpUi9HQmFXbzNIZ2l2NGg4?=
 =?utf-8?B?MVhKdUlxZUM5TnhkUFFKMVpPdU5Scmh2TFNxNkkzS05KZ3FmOHAwUEozWnp4?=
 =?utf-8?B?dE1uWmRVbkdMN0ZuZzBldGFpNmZLS0xhYVduWmtMMUdlL3FyQXVrNXVwSytM?=
 =?utf-8?B?TzUxeUpiWmxCanU2RFRyWXRzWjFNZlpza1NwU2FMYmNGVmQyTUNTT1ZsRjQ4?=
 =?utf-8?B?VlJVWlQzZmthaHNTcFNGYU4rQ1BpL2dCUm11UWtYTTRVTllYS1J1ejRBVXJz?=
 =?utf-8?B?a1c5NWZnYlRtV2M5RWY4cWdjczMxN2JlOFV6ZkJUSUxxblVWMXVGdncrQW03?=
 =?utf-8?B?R1lNSHdZVWVJTWw0SkkzZGpQUVE0eU56b0FYUGsyUjFhcTl1bDJISU5DcVRp?=
 =?utf-8?B?SHRDWmlFTnhaYWwwZ2k0eGN0QVEwcldCSHdueDE0Z0JKRFZZbEV4MlNKU0lV?=
 =?utf-8?B?Nm5ySkpxTy9hY0FyUFdMdVBTWnNSejBVeFZpM1FITWRRVExudzJoNEE5V0VE?=
 =?utf-8?B?V1FBbjkrMEFkV3RQUUJuZ1VJM09tOHo0Z3J5VDljTU5zVWVDRjJONDBZMVJE?=
 =?utf-8?B?bW9HamFqelZ6Q0hNRXE3c3UrMXh4NnowOU9zbEREL05ocHN3aG1rYUlscHdW?=
 =?utf-8?B?S0lOaVdRZEFqUzB5TXovZ1ZtRUw3VUl6M1oyaHZ6VllQSnNyQVBaSjFWRE1m?=
 =?utf-8?B?WmtsazdoR3RPbmdxY2U2UHNOWXVSb3RNT2F4TXZKSTJBWHhnQm5LZmh5bGcz?=
 =?utf-8?B?Q1ZXYnIvUXpOZGFsOVQrTysyd3BzSEp0YkhUcEhyYmt1MDByeHdYZk00NW9p?=
 =?utf-8?B?eTc0cGorQkhXM2NiUXhpeXc4bXlQZC9VTFp2VlE5ZEFFakRxL2hxOWJqZmha?=
 =?utf-8?B?dkVpblh1MjNnWUZ6eFVVUzk2VGtZRncwd0ZScHVIVi9CN3hZdjArNW4rWXdR?=
 =?utf-8?B?MU0yQlY2OUYxSjIrNkw2MkcvSlZWUHBrcHpjdXo5bysrNVZsOGxLSHpIYWQ1?=
 =?utf-8?B?ZkY0U1FyTGpRWTYwTG82eGd1N1NOekh0cDBMZVpjRURxS1ZmTWVCdHB3L281?=
 =?utf-8?B?UnlZMDZPRUxabnZvV0ZOM3dYc1A1WnhYWWhKL0pLV1ZGUFU3cjgzSHI2KzBQ?=
 =?utf-8?B?ajk3ZUpxcFRhd0IvNUxrekxNckFuZFc5NTdqNFZ3aktVYStQdlpxeDMyNHpq?=
 =?utf-8?B?bnR5Yis2dzdFTENyc0wwZWVDVzZvaGNLenNpS3BPbEp5d0YvNlBQaWlYMnlz?=
 =?utf-8?B?NlFMMy9TdUpSZjkrSmt5YVo2V0c1bG5nZ2dvSk5qNDhVTm1rc3V2czRuZ0pT?=
 =?utf-8?B?MXp3cnlmbXdiSmYrcS9HZ2RLRUdLNmpuRStGVHZZZGVEL0E2L3liZzVJS05G?=
 =?utf-8?B?ZVdsd0p2VGJqOGNYV1l0L0dmNy9NYk13amVzZjRpUDBJVzM1MWZQdzFnbE11?=
 =?utf-8?B?ZXVZWkRKNWhORnlqL2ZxakJSbHJXbm5XRG9aNFdTZ2VITGVIWlhmQVRDcUlV?=
 =?utf-8?B?c0JxdjZYdGhCYzJRVVV2cjdMOHV0dWJCTTFDNTUxREZ0YUw4ZktnVjBmT2Ro?=
 =?utf-8?B?bVVjSHRCVU5kRDJBMjhMWHZGVnhEc2I0WFV6TzB5Q29iT1czd05IcXdmNXdw?=
 =?utf-8?B?enI1NTFSUDYvSVdZQWJXUkUxT2tCZmxMRVR4Y0NsY0hrNkdsNFVocHRMa1Ji?=
 =?utf-8?B?S2RKb043Z2hqS3lRVnJTenpobGVVSDVmdHM2WXhlSnd5WGorWWUvS0FtWWhj?=
 =?utf-8?B?QjQ4N3h6RUtJQUh4VjlqN3lXdTkzK1JFeTFmZjQxYUhDTFhsdjEzNjJIbmtK?=
 =?utf-8?B?UmlYczc2a21mclBvTGVPRWRrWHpCbzFCZndNcVhYazlMTEVsNDFrU0NaS2FJ?=
 =?utf-8?B?bElXOVR4c3poTzR3L29TTTRBYUJRZFlUbFp5U1BLem9qYVpaMGtOR0p4QjRZ?=
 =?utf-8?B?VklnZTdhSkVwL3FVY0ZVZnBFSm12QmtmV2dGU2FYUzdIb1JSdElYMy9yYlNP?=
 =?utf-8?B?WC94Um91dkR3NGdvaEQ5VHFPUDg5d1ZaQkZrZm9UcHYyYVl4MUxObE1NVG8r?=
 =?utf-8?Q?qW+QPvM7qu7LSRZk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A44FA972A368949B2B06A19E94EB3A3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df70dc14-4aba-481a-3503-08d9eb0a3661
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 13:52:14.2926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wTJ9h9VJz8K8O46VgaeUeWneJX1OvRLNcKTo9xBW3Rl5paVG3U9HGsK4UZlTkhddXtFSfVjKYZk64YxcYxd2rJ8sOlptEz9mACaDdWIFs6E2ALgmtBbCytkOqJZKLMIE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6217
X-Proofpoint-GUID: NTIje2FN8TEbxlRCjoXEDunmbf4FF7YB
X-Proofpoint-ORIG-GUID: NTIje2FN8TEbxlRCjoXEDunmbf4FF7YB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_04,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=551
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080086

DQoNCk9uIDA4LjAyLjIyIDE1OjM4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUdWUs
IEZlYiAwOCwgMjAyMiBhdCAxMToxMzo0MUFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAwOC4wMi4yMiAxMjo1MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBUdWUsIEZlYiAwOCwgMjAyMiBhdCAwNzozNTozNEFNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gNS4gWW91IG5hbWUgaXQNCj4+Pj4gPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0N
Cj4+Pj4NCj4+Pj4gICAgRnJvbSBhbGwgdGhlIGFib3ZlIEkgd291bGQgcmVjb21tZW5kIHdlIGdv
IHdpdGggb3B0aW9uIDIgd2hpY2ggc2VlbXMgdG8gcmVsaWFibHkNCj4+Pj4gc29sdmUgQUJCQSBh
bmQgZG9lcyBub3QgYnJpbmcgY29ucyBvZiB0aGUgb3RoZXIgYXBwcm9hY2hlcy4NCj4+PiA2LiBw
ZXItZG9tYWluIHJ3bG9jayArIHBlci1kZXZpY2UgdnBjaSBsb2NrDQo+Pj4NCj4+PiBJbnRyb2R1
Y2UgdnBjaV9oZWFkZXJfd3JpdGVfbG9jayhzdGFydCwge2VuZCwgc2l6ZX0pIGhlbHBlcjogcmV0
dXJuDQo+Pj4gd2hldGhlciBhIHJhbmdlIHJlcXVpcmVzIHRoZSBwZXItZG9tYWluIGxvY2sgaW4g
d3JpdGUgbW9kZS4gVGhpcyB3aWxsDQo+Pj4gb25seSByZXR1cm4gdHJ1ZSBpZiB0aGUgcmFuZ2Ug
b3ZlcmxhcHMgd2l0aCB0aGUgQkFSIFJPTSBvciB0aGUgY29tbWFuZA0KPj4+IHJlZ2lzdGVyLg0K
Pj4+DQo+Pj4gSW4gdnBjaV97cmVhZCx3cml0ZX06DQo+Pj4NCj4+PiBpZiAoIHZwY2lfaGVhZGVy
X3dyaXRlX2xvY2soLi4uKSApDQo+Pj4gICAgICAgLyogR2FpbiBleGNsdXNpdmUgYWNjZXNzIHRv
IGFsbCBvZiB0aGUgZG9tYWluIHBkZXZzIHZwY2kuICovDQo+Pj4gICAgICAgd3JpdGVfbG9jayhk
LT52cGNpKTsNCj4+PiBlbHNlDQo+Pj4gew0KPj4+ICAgICAgIHJlYWRfbG9jayhkLT52cGNpKTsN
Cj4+PiAgICAgICBzcGluX2xvY2sodnBjaS0+bG9jayk7DQo+Pj4gfQ0KPj4+IC4uLg0KPj4+DQo+
Pj4gVGhlIHZwY2kgYXNzaWduL2RlYXNzaWduIGZ1bmN0aW9ucyB3b3VsZCBuZWVkIHRvIGJlIG1v
ZGlmaWVkIHRvIHdyaXRlDQo+Pj4gbG9jayB0aGUgcGVyLWRvbWFpbiByd2xvY2suIFRoZSBNU0kt
WCB0YWJsZSBNTUlPIGhhbmRsZXIgd2lsbCBhbHNvDQo+Pj4gbmVlZCB0byByZWFkIGxvY2sgdGhl
IHBlciBkb21haW4gdnBjaSBsb2NrLg0KPj4gT2ssIHNvIGl0IHNlZW1zIHlvdSBhcmUgaW4gZmF2
b3Igb2YgdGhpcyBpbXBsZW1lbnRhdGlvbiBhbmQgSSBoYXZlDQo+PiBubyBvYmplY3Rpb24gYXMg
d2VsbC4gVGhlIG9ubHkgbGltaXRhdGlvbiB3ZSBzaG91bGQgYmUgYXdhcmUgb2YgaXMNCj4+IHRo
YXQgb25jZSBhIHBhdGggaGFzIGFjcXVpcmVkIHRoZSByZWFkIGxvY2sgaXQgaXMgbm90IHBvc3Np
YmxlIHRvIGRvDQo+PiBhbnkgd3JpdGUgcGF0aCBvcGVyYXRpb25zIGluIHRoZXJlLg0KPj4gdnBj
aV9wcm9jZXNzX3BlbmRpbmcgd2lsbCBhY3F1aXJlIHdyaXRlIGxvY2sgdGhvdWdoIGFzIGl0IGNh
bg0KPj4gbGVhZCB0byB2cGNpX3JlbW92ZV9kZXZpY2Ugb24gaXRzIGVycm9yIHBhdGguDQo+Pg0K
Pj4gU28sIEkgYW0gZ29pbmcgdG8gaW1wbGVtZW50IHBkZXYtPnZwY2ktPmxvY2sgKyBkLT52cGNp
X2xvY2sNCj4gSSB0aGluayBpdCdzIHRoZSBsZXNzIHVuY2VydGFpbiBvcHRpb24uDQo+DQo+IEFz
IHNhaWQsIGlmIHlvdSB3YW50IHRvIGludmVzdGlnYXRlIHdoZXRoZXIgeW91IGNhbiBzdWNjZXNz
ZnVsbHkgbW92ZQ0KPiB0aGUgY2hlY2tpbmcgaW50byB2cGNpX3Byb2Nlc3NfcGVuZGluZyB0aGF0
IHdvdWxkIGFsc28gYmUgZmluZSB3aXRoDQo+IG1lLCBidXQgSSBjYW5ub3QgYXNzZXJ0IGl0J3Mg
Z29pbmcgdG8gYmUgc3VjY2Vzc2Z1bC4gT1RPSCBJIHRoaW5rIHRoZQ0KPiBwZXItZG9tYWluIHJ3
bG9jayArIHBlci1kZXZpY2Ugc3BpbmxvY2sgc2VlbXMgcXVpdGUgbGlrZWx5IHRvIHNvbHZlDQo+
IG91ciBpc3N1ZXMuDQpPaywgdGhlbiBJJ2xsIGdvIHdpdGggcGVyLWRvbWFpbiByd2xvY2sgKyBw
ZXItZGV2aWNlIHNwaW5sb2NrDQphbmQgd3JpdGUgbG9jayBpbiB2cGNpX3dyaXRlIGZvciBjbWQg
KyBST00uIE9mIGNvdXJzZSBvdGhlcg0KcGxhY2VzIHN1Y2ggYXMgdnBjaV9yZW1vdmVfZGV2aWNl
IGFuZCB2cGNpX3Byb2Nlc3NfcGVuZGluZw0Kd2lsbCB1c2Ugd3JpdGUgbG9jaw0KPg0KPiBUaGFu
a3MsIFJvZ2VyLg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

